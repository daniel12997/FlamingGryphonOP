# ABOUTME: Django admin registration for the accounts app.
# ABOUTME: Custom UserAdmin showing approval status with approve action.

from django.contrib import admin
from django.contrib.auth import get_user_model
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin

User = get_user_model()


@admin.register(User)
class UserAdmin(BaseUserAdmin):
    list_display = ("username", "email", "sca_name", "is_approved", "is_staff")
    list_filter = ("is_approved", "is_staff", "is_active")
    fieldsets = BaseUserAdmin.fieldsets + (
        ("SCA Info", {"fields": ("sca_name", "is_approved")}),
    )
    add_fieldsets = BaseUserAdmin.add_fieldsets + (
        ("SCA Info", {"fields": ("sca_name",)}),
    )
