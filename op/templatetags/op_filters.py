# ABOUTME: Custom template filters for the OP app.
# ABOUTME: Includes format_date for rendering legacy display_date strings as "Mon DD, YYYY".

import re
import datetime

from django import template

register = template.Library()

_MONTHS = [
    "", "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
]


def _parse_year(raw: str) -> int:
    y = int(raw)
    return y + 1900 if y < 100 else y


def _format_fragment(fragment: str) -> str:
    """Format a single date fragment into abbreviated-month form."""
    fragment = fragment.strip()
    if not fragment or fragment == "?":
        return "Unknown"

    # MM/DD/YYYY or MM/DD/YY — fully known
    m = re.fullmatch(r"(\d{1,2})/(\d{1,2})/(\d{2,4})", fragment)
    if m:
        try:
            month = int(m.group(1))
            day = int(m.group(2))
            year = _parse_year(m.group(3))
            return f"{_MONTHS[month]} {day}, {year}"
        except (ValueError, IndexError):
            pass

    # MM/?/YYYY or MM/?/YY — day unknown
    m = re.fullmatch(r"(\d{1,2})/\?/(\d{2,4})", fragment)
    if m:
        try:
            month = int(m.group(1))
            year = _parse_year(m.group(2))
            return f"{_MONTHS[month]} ?, {year}"
        except (ValueError, IndexError):
            pass

    # ?/?/YYYY or ?/?/YY — month and day unknown
    m = re.fullmatch(r"\?/\?/(\d{2,4})", fragment)
    if m:
        return f"?, {_parse_year(m.group(1))}"

    # ?/YYYY or ?/YY — year-only fragment
    m = re.fullmatch(r"\?/(\d{2,4})", fragment)
    if m:
        return f"?, {_parse_year(m.group(1))}"

    # YYYY alone
    m = re.fullmatch(r"(\d{4})", fragment)
    if m:
        return str(int(m.group(1)))

    # Already a datetime.date object (from sort_date fallback)
    return fragment


@register.filter
def format_date(value) -> str:
    """Format a legacy display_date string as 'Mon DD, YYYY'.

    Handles uncertainty markers (?) gracefully. Falls back to formatting
    a date object if given one. Returns 'Unknown' if no date is present.
    """
    if not value:
        return "Unknown"

    # datetime.date object (sort_date fallback)
    if isinstance(value, datetime.date):
        return value.strftime("%b %-d, %Y")

    value = str(value).strip()
    if not value:
        return "Unknown"

    fragments = re.split(r"[,;]\s*", value)
    parts = [_format_fragment(f) for f in fragments if f.strip()]
    return " / ".join(parts) if parts else "Unknown"
