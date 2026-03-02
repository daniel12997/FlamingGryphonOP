#!/bin/sh
# ABOUTME: Container entrypoint — runs pre-flight steps before starting gunicorn.
# ABOUTME: Handles collectstatic and migrate so the image needs no env vars at build time.
set -e

uv run python manage.py collectstatic --noinput
uv run python manage.py migrate --noinput

exec gunicorn config.wsgi:application --bind 0.0.0.0:8000
