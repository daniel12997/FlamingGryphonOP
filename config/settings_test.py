# ABOUTME: Test-specific Django settings.
# ABOUTME: Overrides database to SQLite in-memory for fast tests without PostgreSQL.

import os

# Set DEBUG before importing base settings so the SECRET_KEY guard allows
# the insecure default key during test runs.
os.environ.setdefault("DEBUG", "True")

from .settings import *  # noqa: F401, F403

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.sqlite3",
        "NAME": ":memory:",
    }
}

# Faster password hashing for tests
PASSWORD_HASHERS = [
    "django.contrib.auth.hashers.MD5PasswordHasher",
]

# Disable whitenoise compressed storage in tests
STORAGES = {
    "staticfiles": {
        "BACKEND": "django.contrib.staticfiles.storage.StaticFilesStorage",
    },
}
