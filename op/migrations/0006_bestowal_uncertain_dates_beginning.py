# ABOUTME: Data migration to re-compute sort_date for uncertain bestowals.
# ABOUTME: Shifts end-of-period approximations to beginning-of-period so uncertain awards sort as older.

import datetime
import re

from django.db import migrations


def _parse_year(raw: str) -> int:
    y = int(raw)
    return y + 1900 if y < 100 else y


def _sort_date_from_display(display_date: str) -> datetime.date | None:
    """Compute a beginning-of-period sort_date from a legacy display_date string.

    Known date (MM/DD/YYYY or MM/DD/YY) → parse as-is.
    Day unknown (MM/?/YYYY or MM/?/YY) → first of that month.
    Month+day unknown (?/?/YYYY, ?/?/YY, ?/YYYY, ?/YY) → Jan 1st of that year.
    Fully unknown (?, empty) → None.
    Multi-date strings (e.g. '?/80,?/81') → use the first parseable fragment.
    """
    if not display_date:
        return None
    for fragment in re.split(r"[,;]", display_date):
        fragment = fragment.strip()
        if not fragment or fragment == "?":
            continue
        m = re.fullmatch(r"(\d{1,2})/(\d{1,2})/(\d{2,4})", fragment)
        if m:
            try:
                return datetime.date(_parse_year(m.group(3)), int(m.group(1)), int(m.group(2)))
            except ValueError:
                continue
        m = re.fullmatch(r"(\d{1,2})/\?/(\d{2,4})", fragment)
        if m:
            try:
                return datetime.date(_parse_year(m.group(2)), int(m.group(1)), 1)
            except ValueError:
                continue
        m = re.fullmatch(r"\?/\?/(\d{2,4})", fragment)
        if m:
            return datetime.date(_parse_year(m.group(1)), 1, 1)
        m = re.fullmatch(r"\?/(\d{2,4})", fragment)
        if m:
            return datetime.date(_parse_year(m.group(1)), 1, 1)
        m = re.fullmatch(r"(\d{4})", fragment)
        if m:
            return datetime.date(int(m.group(1)), 1, 1)
    return None


def recompute_uncertain_sort_dates(apps, schema_editor):
    Bestowal = apps.get_model("op", "Bestowal")
    to_update = []
    for b in Bestowal.objects.filter(display_date__contains="?").exclude(sort_date=None):
        new_date = _sort_date_from_display(b.display_date)
        if new_date is not None and new_date != b.sort_date:
            b.sort_date = new_date
            to_update.append(b)
    if to_update:
        Bestowal.objects.bulk_update(to_update, ["sort_date"])


class Migration(migrations.Migration):

    dependencies = [
        ("op", "0005_midrealm_award"),
    ]

    operations = [
        migrations.RunPython(recompute_uncertain_sort_dates, migrations.RunPython.noop),
    ]
