# ABOUTME: App configuration for the accounts app.
# ABOUTME: Handles user auth with admin-approved registration and roles.

from django.apps import AppConfig


class AccountsConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "accounts"
    verbose_name = "Accounts"
