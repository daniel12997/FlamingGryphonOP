#!/bin/sh
# ABOUTME: Container entrypoint — runs pre-flight steps before starting gunicorn.
# ABOUTME: Calls venv Python directly to avoid uv sync checks against the lockfile.
set -e

/app/.venv/bin/python manage.py collectstatic --noinput
/app/.venv/bin/python manage.py migrate --noinput

exec /app/.venv/bin/gunicorn config.wsgi:application --bind 0.0.0.0:8000
