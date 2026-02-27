# ABOUTME: Management command to import legacy MySQL dump into Django models.
# ABOUTME: Parses phpMyAdmin INSERT statements and maps old schema to new models.

import html
import re

from django.core.management.base import BaseCommand
from django.db import transaction

from op.models import (
    AlternateName,
    Bestowal,
    Event,
    Group,
    Honor,
    HonorImage,
    Recipient,
    SiteConfig,
)

# Category mapping from legacy values
CATEGORY_MAP = {
    "BAR": Honor.Category.BARONIAL,
    "FGCH": Honor.Category.CHAMPION,
    "bfg": Honor.Category.BARONIAL,
}

# Legacy config keys we care about
CONFIG_KEY_MAP = {
    "adminName": "admin_name",
    "adminEmail": "admin_email",
    "groupNameShort": "group_name_short",
    "groupNameLong": "group_name_long",
    "coronet": "coronet",
}


def decode_legacy_text(value):
    """Decode HTML entities and normalize escaped quotes from legacy MySQL data."""
    if value is None:
        return None
    # Unescape HTML entities
    result = html.unescape(value)
    # Normalize escaped single quotes (MySQL escaping styles)
    # Replace \'' before \' so the longer pattern matches first
    result = result.replace("\\''", "'")
    result = result.replace("\\'", "'")
    return result


def parse_insert_values(line):
    """Parse a single INSERT INTO ... VALUES (...) statement and return a list of values.

    Handles: quoted strings with escaped quotes, NULL, integers, hex BLOBs.
    """
    match = re.search(r"VALUES\s*\((.+)\)\s*;?\s*$", line)
    if not match:
        return []

    raw = match.group(1)
    values = []
    i = 0
    n = len(raw)

    while i < n:
        # Skip whitespace
        while i < n and raw[i] in " \t":
            i += 1
        if i >= n:
            break

        if raw[i] == "'":
            # Quoted string — collect until unescaped closing quote
            i += 1
            parts = []
            while i < n:
                if raw[i] == "\\" and i + 1 < n and raw[i + 1] == "'":
                    # Backslash-escaped quote
                    parts.append("'")
                    i += 2
                elif raw[i] == "'" and i + 1 < n and raw[i + 1] == "'":
                    # Double-quote escape
                    parts.append("'")
                    i += 2
                elif raw[i] == "'":
                    i += 1
                    break
                else:
                    parts.append(raw[i])
                    i += 1
            values.append("".join(parts))
        elif raw[i:i + 4].upper() == "NULL":
            values.append(None)
            i += 4
        elif raw[i] == "0" and i + 1 < n and raw[i + 1] == "x":
            # Hex BLOB value
            j = i + 2
            while j < n and raw[j] in "0123456789abcdefABCDEF":
                j += 1
            values.append(raw[i:j])
            i = j
        else:
            # Unquoted value (number, etc.)
            j = i
            while j < n and raw[j] not in ",)":
                j += 1
            values.append(raw[i:j].strip())
            i = j

        # Skip comma separator
        while i < n and raw[i] in " \t,":
            i += 1

    return values


def extract_inserts(sql_text, table_name):
    """Extract all INSERT statements for a given table from the SQL dump."""
    pattern = re.compile(
        rf"^INSERT INTO `{re.escape(table_name)}` VALUES\s*\(", re.MULTILINE
    )
    results = []
    for match in pattern.finditer(sql_text):
        # Find the full line
        line_start = sql_text.rfind("\n", 0, match.start()) + 1
        line_end = sql_text.find("\n", match.start())
        if line_end == -1:
            line_end = len(sql_text)
        line = sql_text[line_start:line_end].strip()
        results.append(line)
    return results


class Command(BaseCommand):
    help = "Import legacy gryphony_OP.sql data into Django models"

    def add_arguments(self, parser):
        parser.add_argument("sql_file", help="Path to the unzipped gryphony_OP.sql file")

    @transaction.atomic
    def handle(self, *args, **options):
        sql_file = options["sql_file"]
        verbosity = options["verbosity"]

        with open(sql_file, "r", encoding="utf-8") as f:
            sql_text = f.read()

        self._import_groups(sql_text, verbosity)
        self._import_honors(sql_text, verbosity)
        self._import_recipients(sql_text, verbosity)
        self._import_altnames(sql_text, verbosity)
        self._import_events(sql_text, verbosity)
        honor_lookup = {h.legacy_key: h for h in Honor.objects.exclude(legacy_key=None)}
        recipient_lookup = self._build_recipient_lookup(sql_text)
        self._import_bestowals(sql_text, honor_lookup, recipient_lookup, verbosity)
        self._import_honorimages(sql_text, honor_lookup, verbosity)
        self._import_configuration(sql_text, verbosity)

    def _import_groups(self, sql_text, verbosity):
        inserts = extract_inserts(sql_text, "op_groups")
        count = 0
        for line in inserts:
            vals = parse_insert_values(line)
            if len(vals) < 3:
                continue
            Group.objects.get_or_create(
                name=decode_legacy_text(vals[1]) or "",
                defaults={"designator": decode_legacy_text(vals[2]) or ""},
            )
            count += 1
        if verbosity > 0:
            self.stdout.write(f"  Groups: {count} imported")

    def _import_honors(self, sql_text, verbosity):
        inserts = extract_inserts(sql_text, "op_honors")
        count = 0
        for line in inserts:
            vals = parse_insert_values(line)
            if len(vals) < 9:
                continue
            legacy_key = int(vals[0])
            category_raw = (vals[7] or "").strip()
            category = CATEGORY_MAP.get(category_raw, Honor.Category.BARONIAL)

            Honor.objects.get_or_create(
                legacy_key=legacy_key,
                defaults={
                    "name": decode_legacy_text(vals[1]) or "",
                    "prefix": decode_legacy_text(vals[2]) or "",
                    "description": decode_legacy_text(vals[3]) or "",
                    "abbreviation": decode_legacy_text(vals[4]) or "",
                    "level": int(vals[5]) if vals[5] else 0,
                    "is_active": vals[6] == "1",
                    "category": category,
                    "accepts_recommendations": vals[8] == "1",
                    "is_external": False,
                },
            )
            count += 1
        if verbosity > 0:
            self.stdout.write(f"  Honors: {count} imported")

    def _import_recipients(self, sql_text, verbosity):
        inserts = extract_inserts(sql_text, "op_recipients")
        count = 0
        for line in inserts:
            vals = parse_insert_values(line)
            if len(vals) < 8:
                continue
            reckey = int(vals[0])
            Recipient.objects.get_or_create(
                pk=reckey,
                defaults={
                    "sca_name": decode_legacy_text(vals[1]) or "",
                    "mundane_name": decode_legacy_text(vals[2]) or "",
                    "gender": vals[3] or "",
                    "active": vals[4] == "1",
                    "name_registered": vals[5] == "1",
                    "device_registered": vals[6] == "1",
                    "device_blazon": decode_legacy_text(vals[7]) or "",
                },
            )
            count += 1
        if verbosity > 0:
            self.stdout.write(f"  Recipients: {count} imported")

    def _import_altnames(self, sql_text, verbosity):
        inserts = extract_inserts(sql_text, "op_altnames")
        count = 0
        skipped = 0
        for line in inserts:
            vals = parse_insert_values(line)
            if len(vals) < 6:
                continue
            reckey = int(vals[1])
            name = decode_legacy_text(vals[2]) or ""

            # Skip empty names
            if not name.strip():
                skipped += 1
                continue

            # Skip if recipient doesn't exist
            try:
                recipient = Recipient.objects.get(pk=reckey)
            except Recipient.DoesNotExist:
                skipped += 1
                continue

            AlternateName.objects.get_or_create(
                pk=int(vals[0]),
                defaults={
                    "recipient": recipient,
                    "name": name,
                    "is_nickname": vals[3] == "1",
                    "is_former_name": vals[4] == "1",
                    "is_registered": vals[5] == "1",
                },
            )
            count += 1
        if verbosity > 0:
            self.stdout.write(f"  Alternate names: {count} imported, {skipped} skipped")

    def _import_events(self, sql_text, verbosity):
        inserts = extract_inserts(sql_text, "op_calendar")
        count = 0
        for line in inserts:
            vals = parse_insert_values(line)
            if len(vals) < 3:
                continue
            Event.objects.get_or_create(
                pk=int(vals[0]),
                defaults={
                    "name": decode_legacy_text(vals[1]) or "",
                    "date": vals[2],
                },
            )
            count += 1
        if verbosity > 0:
            self.stdout.write(f"  Events: {count} imported")

    def _build_recipient_lookup(self, sql_text):
        """Build a dict of legacy reckey -> Django Recipient pk."""
        lookup = {}
        for r in Recipient.objects.all():
            lookup[r.pk] = r
        return lookup

    def _import_bestowals(self, sql_text, honor_lookup, recipient_lookup, verbosity):
        inserts = extract_inserts(sql_text, "op_bestowals")
        count = 0
        skipped = 0
        external_created = 0

        for line in inserts:
            vals = parse_insert_values(line)
            if len(vals) < 8:
                continue

            bestowal_id = int(vals[0])
            sort_date = vals[1]  # Could be None
            reckey = int(vals[5]) if vals[5] and vals[5] != "0" else 0
            honorkey = int(vals[6]) if vals[6] and vals[6] != "0" else 0

            # Skip fully null/zero rows
            if sort_date is None and reckey == 0 and honorkey == 0:
                skipped += 1
                continue

            # Skip if honorkey is 0
            if honorkey == 0:
                skipped += 1
                continue

            # Skip if reckey is 0 or recipient doesn't exist
            if reckey == 0 or reckey not in recipient_lookup:
                skipped += 1
                continue

            # Get or create honor
            honor = honor_lookup.get(honorkey)
            if honor is None:
                # External honor — create placeholder
                honor = Honor.objects.create(
                    legacy_key=honorkey,
                    name=f"External Honor #{honorkey}",
                    category=Honor.Category.EXTERNAL,
                    is_external=True,
                    is_active=True,
                )
                honor_lookup[honorkey] = honor
                external_created += 1

            recipient = recipient_lookup[reckey]

            Bestowal.objects.get_or_create(
                pk=bestowal_id,
                defaults={
                    "sort_date": sort_date,
                    "sequence": decode_legacy_text(vals[2]) or "",
                    "display_date": decode_legacy_text(vals[3]) or "",
                    "event_name": decode_legacy_text(vals[4]) or "",
                    "recipient": recipient,
                    "honor": honor,
                    "notes": decode_legacy_text(vals[7]) or "",
                },
            )
            count += 1

        if verbosity > 0:
            self.stdout.write(
                f"  Bestowals: {count} imported, {skipped} skipped, "
                f"{external_created} external honors created"
            )

    def _import_honorimages(self, sql_text, honor_lookup, verbosity):
        inserts = extract_inserts(sql_text, "op_honorimages")
        count = 0
        skipped = 0

        for line in inserts:
            vals = parse_insert_values(line)
            if len(vals) < 6:
                continue

            honorkey = int(vals[1])
            filename = vals[2]
            hex_data = vals[5]

            honor = honor_lookup.get(honorkey)
            if honor is None:
                skipped += 1
                continue

            if hex_data and hex_data.startswith("0x"):
                # Convert hex to binary and save to file
                import os
                from django.conf import settings

                binary_data = bytes.fromhex(hex_data[2:])
                badge_dir = os.path.join(settings.MEDIA_ROOT, "badges")
                os.makedirs(badge_dir, exist_ok=True)
                filepath = os.path.join(badge_dir, filename)
                with open(filepath, "wb") as f:
                    f.write(binary_data)

                HonorImage.objects.get_or_create(
                    honor=honor,
                    defaults={"image": f"badges/{filename}"},
                )
                count += 1
            else:
                skipped += 1

        if verbosity > 0:
            self.stdout.write(f"  Honor images: {count} imported, {skipped} skipped")

    def _import_configuration(self, sql_text, verbosity):
        inserts = extract_inserts(sql_text, "op_configuration")
        config = SiteConfig.load()
        count = 0

        for line in inserts:
            vals = parse_insert_values(line)
            if len(vals) < 2:
                continue

            key = vals[0]
            value = decode_legacy_text(vals[1]) or ""

            if key in CONFIG_KEY_MAP:
                field_name = CONFIG_KEY_MAP[key]
                setattr(config, field_name, value)
                count += 1

        config.save()
        if verbosity > 0:
            self.stdout.write(f"  Configuration: {count} values imported")
