# ABOUTME: App configuration for the op (Order of Precedence) app.
# ABOUTME: Core domain: recipients, honors, bestowals, events, groups, site config.

from django.apps import AppConfig


class OpConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "op"
    verbose_name = "Order of Precedence"
