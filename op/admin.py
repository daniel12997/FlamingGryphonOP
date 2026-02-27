# ABOUTME: Django admin registration for the op app.
# ABOUTME: Registers SiteConfig and other OP models for admin management.

from django.contrib import admin

from .models import (
    AlternateName,
    Bestowal,
    Event,
    Group,
    Honor,
    HonorImage,
    Recipient,
    SiteConfig,
)


@admin.register(SiteConfig)
class SiteConfigAdmin(admin.ModelAdmin):
    list_display = ("group_name_short", "admin_name", "coronet")


class AlternateNameInline(admin.TabularInline):
    model = AlternateName
    extra = 1


@admin.register(Recipient)
class RecipientAdmin(admin.ModelAdmin):
    list_display = ("sca_name", "mundane_name", "group", "active")
    list_filter = ("active", "group")
    search_fields = ("sca_name", "mundane_name")
    inlines = [AlternateNameInline]


@admin.register(Honor)
class HonorAdmin(admin.ModelAdmin):
    list_display = ("name", "prefix", "category", "level", "is_active", "is_external")
    list_filter = ("category", "is_active", "is_external")
    search_fields = ("name",)


@admin.register(Event)
class EventAdmin(admin.ModelAdmin):
    list_display = ("name", "date")
    ordering = ("-date",)


@admin.register(Bestowal)
class BestovalAdmin(admin.ModelAdmin):
    list_display = ("recipient", "honor", "sort_date", "event_name")
    list_filter = ("honor", "is_draft")
    search_fields = ("recipient__sca_name", "honor__name")
    raw_id_fields = ("recipient", "honor", "event")


@admin.register(Group)
class GroupAdmin(admin.ModelAdmin):
    list_display = ("name", "designator")


@admin.register(HonorImage)
class HonorImageAdmin(admin.ModelAdmin):
    list_display = ("honor", "image")
