# ABOUTME: URL patterns for the op (Order of Precedence) app.
# ABOUTME: Routes for public browsing of recipients, honors, events, and bestowals.

from django.urls import path

from . import views

app_name = "op"

urlpatterns = [
    path("", views.index, name="index"),
]
