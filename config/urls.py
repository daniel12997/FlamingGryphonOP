# ABOUTME: Root URL configuration for the Flaming Gryphon OP app.
# ABOUTME: Includes op/, accounts/, and Django admin URL patterns.

from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path("admin/", admin.site.urls),
    path("accounts/", include("accounts.urls")),
    path("", include("op.urls")),
]
