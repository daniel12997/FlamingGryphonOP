#!/bin/sh
# ABOUTME: Container entrypoint — runs pre-flight steps before starting gunicorn.
# ABOUTME: Calls venv Python directly to avoid uv sync checks against the lockfile.
set -e

/app/.venv/bin/python manage.py collectstatic --noinput
/app/.venv/bin/python manage.py migrate --noinput
/app/.venv/bin/python manage.py createsuperuser --noinput || true

# Auto-import legacy data if the SQL file exists and the DB is empty
if [ -f /tmp/gryphony_OP.sql ]; then
    RECIPIENT_COUNT=$(/app/.venv/bin/python manage.py shell -c "from op.models import Recipient; print(Recipient.objects.count())" 2>/dev/null || echo "0")
    if [ "$RECIPIENT_COUNT" = "0" ]; then
        echo "Importing legacy data..."
        /app/.venv/bin/python manage.py import_legacy_sql /tmp/gryphony_OP.sql
    fi
fi

exec /app/.venv/bin/gunicorn config.wsgi:application --bind 0.0.0.0:8000 --control-socket /tmp/gunicorn.ctl
