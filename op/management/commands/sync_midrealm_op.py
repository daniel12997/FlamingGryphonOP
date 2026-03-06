# ABOUTME: Management command to sync the Midrealm Order of Precedence into a local mirror.
# ABOUTME: Uses Playwright for the initial session, then pages through all records via AJAX.

import asyncio
import datetime

from django.core.management.base import BaseCommand
from django.db import transaction

from op.models import Bestowal, Honor, MidrealAward, MidrealSyncLog

MIDREALM_OP_URL = "https://midrealm.org/order-of-precedence/"
AJAX_URL = "https://midrealm.org/wp-admin/admin-ajax.php"
TABLE_ID = "52"
NONCE_INPUT_ID = f"wdtNonceFrontendServerSide_{TABLE_ID}"
PAGE_SIZE = 200


_COLUMNS = [
    ("terriblesorting", "0"),
    ("precedence", "1"),
    ("scaname", "2"),
    ("awardname", "3"),
    ("datereceived", "4"),
    ("alternatenames", "5"),
    ("notes", "6"),
]

def _build_body(nonce: str, draw: int, start: int, length: int) -> str:
    """Build the exact POST body that wpDataTables expects."""
    import urllib.parse
    params = []
    for i, (name, data) in enumerate(_COLUMNS):
        params += [
            (f"columns[{i}][data]", data),
            (f"columns[{i}][name]", name),
            (f"columns[{i}][searchable]", "true"),
            (f"columns[{i}][orderable]", "true"),
            (f"columns[{i}][search][value]", ""),
            (f"columns[{i}][search][regex]", "false"),
        ]
    params += [
        ("draw", str(draw)),
        ("length", str(length)),
        ("order[0][column]", "0"),
        ("order[0][dir]", "asc"),
        ("search[regex]", "false"),
        ("search[value]", ""),
        ("start", str(start)),
        ("wdtNonce", nonce),
    ]
    return urllib.parse.urlencode(params)


async def _fetch_page(page, nonce: str, start: int, draw: int) -> dict:
    """Fetch one page of Midrealm OP data via XHR inside the browser context."""
    body = _build_body(nonce, draw, start, PAGE_SIZE)
    url = f"{AJAX_URL}?action=get_wdtable&table_id={TABLE_ID}"

    js = """
    ({url, body}) => new Promise((resolve, reject) => {
        const xhr = new XMLHttpRequest();
        xhr.open('POST', url);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
        xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
        xhr.onload = () => resolve(xhr.responseText);
        xhr.onerror = () => reject(new Error('XHR error'));
        xhr.send(body);
    });
    """
    result = await page.evaluate(js, {"url": url, "body": body})
    import json as _json
    return _json.loads(result)


async def _fetch_all_records(since_sort_key: str | None, verbosity: int) -> tuple[list[dict], int]:
    """Use Playwright to get a valid session then page through all Midrealm OP records."""
    from playwright.async_api import async_playwright

    records = []
    total_remote = 0

    async with async_playwright() as p:
        browser = await p.chromium.launch(headless=True)
        context = await browser.new_context()
        page = await context.new_page()

        if verbosity > 0:
            print("  Loading Midrealm OP page to establish session...")
        await page.goto(MIDREALM_OP_URL, wait_until="networkidle")

        # The JS sends nonce as 'wdtNonce'; read from the hidden input value
        nonce = await page.locator(f"#{NONCE_INPUT_ID}").get_attribute("value")
        if verbosity > 0:
            print(f"  Nonce: {nonce}")

        start = 0
        draw = 1
        while True:
            data = await _fetch_page(page, nonce, start, draw)
            total_remote = int(data.get("recordsTotal", 0))
            batch = data.get("data", [])

            if not batch:
                break

            for row in batch:
                sort_key = str(row[0]) if row[0] is not None else ""
                # Delta: records are sorted by terriblesorting ASC; stop once we're past known data
                if since_sort_key and sort_key <= since_sort_key:
                    start += PAGE_SIZE
                    draw += 1
                    continue

                records.append({
                    "sort_key": sort_key,
                    "sca_name": (row[2] or "").strip(),
                    "award_name": (row[3] or "").strip(),
                    "date_raw": (row[4] or "").strip(),
                    "alternate_names": (row[5] or "").strip() if row[5] else "",
                    "notes": (row[6] or "").strip() if row[6] else "",
                })

            if verbosity > 1:
                print(f"    Fetched {start + len(batch)}/{total_remote} records...")

            start += PAGE_SIZE
            draw += 1

            if start >= total_remote:
                break

        await browser.close()

    return records, total_remote


def _parse_date(date_raw: str) -> datetime.date | None:
    """Parse MM/DD/YYYY date string from Midrealm OP."""
    if not date_raw:
        return None
    try:
        return datetime.datetime.strptime(date_raw, "%m/%d/%Y").date()
    except ValueError:
        return None


def _enrich_external_honors(verbosity: int) -> int:
    """Match MidrealAward records to external-honor bestowals by recipient name + date.

    Updates Honor.name from 'External Honor #xxx' to the real award name where a
    confident match exists.
    """
    updated = 0
    external_bestowals = (
        Bestowal.objects.filter(honor__is_external=True)
        .select_related("recipient", "honor")
        .exclude(sort_date=None)
    )

    for bestowal in external_bestowals:
        name = bestowal.recipient.sca_name
        try:
            midrealm = MidrealAward.objects.get(
                sca_name__iexact=name,
                date_received=bestowal.sort_date,
            )
        except MidrealAward.DoesNotExist:
            continue
        except MidrealAward.MultipleObjectsReturned:
            # Ambiguous — skip
            continue

        honor = bestowal.honor
        if honor.name.startswith("External Honor #"):
            honor.name = midrealm.award_name
            honor.save(update_fields=["name"])
            updated += 1

    return updated


def _diff_records(remote: list[dict], verbosity: int) -> dict:
    """Compare remote records against local DB. Returns counts and changed records.

    Checks every remote record for:
    - NEW: not in local DB at all
    - CHANGED: exists but a field (award_name, date_raw, alternate_names, notes) differs
    - DELETED: in local DB but absent from the full remote fetch
    """
    remote_keys = {(r["sca_name"], r["award_name"], r["date_raw"]) for r in remote}
    local_qs = MidrealAward.objects.all()
    local_by_key = {(a.sca_name, a.award_name, a.date_raw): a for a in local_qs}

    new_records = []
    changed_records = []
    deleted_keys = []

    for r in remote:
        key = (r["sca_name"], r["award_name"], r["date_raw"])
        local = local_by_key.get(key)
        if local is None:
            new_records.append(r)
        else:
            diffs = {}
            for field in ("alternate_names", "notes", "sort_key"):
                local_val = getattr(local, field) or ""
                remote_val = r.get(field) or ""
                if local_val != remote_val:
                    diffs[field] = (local_val, remote_val)
            if diffs:
                changed_records.append({"record": r, "diffs": diffs})

    for key in local_by_key:
        if key not in remote_keys:
            deleted_keys.append(key)

    return {
        "new": new_records,
        "changed": changed_records,
        "deleted": deleted_keys,
    }


class Command(BaseCommand):
    help = "Sync the Midrealm Order of Precedence into a local mirror table"

    def add_arguments(self, parser):
        parser.add_argument(
            "--full",
            action="store_true",
            help="Force a full re-sync even if a previous sync exists",
        )
        parser.add_argument(
            "--diff",
            action="store_true",
            help="Full fetch then report new/changed/deleted records without writing anything",
        )
        parser.add_argument(
            "--no-enrich",
            action="store_true",
            help="Skip updating external honor names after sync",
        )

    def handle(self, *args, **options):
        verbosity = options["verbosity"]
        full = options["full"]
        diff_only = options["diff"]

        # --diff implies a full fetch
        if diff_only:
            full = True

        # Determine sync mode
        last_sync = MidrealSyncLog.objects.filter(status="ok").first()
        since_sort_key = None
        if last_sync and not full:
            latest = MidrealAward.objects.order_by("-sort_key").first()
            if latest:
                since_sort_key = latest.sort_key
                if verbosity > 0:
                    self.stdout.write(f"  Delta sync from sort_key > {since_sort_key}")
        else:
            if verbosity > 0:
                mode = "diff (read-only)" if diff_only else "full sync"
                self.stdout.write(f"  {mode}")

        log = MidrealSyncLog(status="running")
        if not diff_only:
            log.save()

        try:
            records, total_remote = asyncio.run(
                _fetch_all_records(since_sort_key, verbosity)
            )

            if verbosity > 0:
                self.stdout.write(
                    f"  Fetched {len(records)} records from Midrealm OP (total: {total_remote})"
                )

            if diff_only:
                diff = _diff_records(records, verbosity)
                self._print_diff(diff)
                return

            log.records_total = total_remote

            new_count = 0
            with transaction.atomic():
                for r in records:
                    date_received = _parse_date(r["date_raw"])
                    _, created = MidrealAward.objects.update_or_create(
                        sca_name=r["sca_name"],
                        award_name=r["award_name"],
                        date_raw=r["date_raw"],
                        defaults={
                            "date_received": date_received,
                            "alternate_names": r["alternate_names"],
                            "notes": r["notes"],
                            "sort_key": r["sort_key"],
                        },
                    )
                    if created:
                        new_count += 1

            log.records_fetched = len(records)
            log.new_records = new_count
            log.status = "ok"
            log.save()

            if verbosity > 0:
                self.stdout.write(f"  New records: {new_count}")

            if not options["no_enrich"]:
                enriched = _enrich_external_honors(verbosity)
                if verbosity > 0:
                    self.stdout.write(f"  External honors enriched: {enriched}")

        except Exception as e:
            log.status = "error"
            log.error = str(e)
            if not diff_only:
                log.save()
            raise

    def _print_diff(self, diff: dict) -> None:
        new = diff["new"]
        changed = diff["changed"]
        deleted = diff["deleted"]

        self.stdout.write(
            f"\n  Summary: {len(new)} new, {len(changed)} changed, {len(deleted)} deleted\n"
        )

        if new:
            self.stdout.write(f"  NEW ({len(new)}):")
            for r in new[:50]:
                self.stdout.write(f"    + {r['sca_name']} | {r['award_name']} | {r['date_raw']}")
            if len(new) > 50:
                self.stdout.write(f"    ... and {len(new) - 50} more")

        if changed:
            self.stdout.write(f"\n  CHANGED ({len(changed)}):")
            for item in changed[:50]:
                r = item["record"]
                self.stdout.write(f"    ~ {r['sca_name']} | {r['award_name']} | {r['date_raw']}")
                for field, (old, new_val) in item["diffs"].items():
                    self.stdout.write(f"        {field}: {old!r} → {new_val!r}")
            if len(changed) > 50:
                self.stdout.write(f"    ... and {len(changed) - 50} more")

        if deleted:
            self.stdout.write(f"\n  DELETED ({len(deleted)}):")
            for name, award, date in deleted[:50]:
                self.stdout.write(f"    - {name} | {award} | {date}")
            if len(deleted) > 50:
                self.stdout.write(f"    ... and {len(deleted) - 50} more")

        if not new and not changed and not deleted:
            self.stdout.write("  Local mirror is up to date — no differences found.")
