# ABOUTME: Django admin registration for the op app.
# ABOUTME: Registers SiteConfig and other OP models for admin management.

from django.contrib import admin

from .models import SiteConfig


@admin.register(SiteConfig)
class SiteConfigAdmin(admin.ModelAdmin):
    list_display = ("group_name_short", "admin_name", "coronet")
