# ABOUTME: URL patterns for the op (Order of Precedence) app.
# ABOUTME: Routes for public browsing of recipients, honors, events, and bestowals.

from django.urls import path

from . import views

app_name = "op"

urlpatterns = [
    path("", views.index, name="index"),
    path("people/", views.RecipientListView.as_view(), name="recipient_list"),
    path(
        "people/<int:pk>/",
        views.RecipientDetailView.as_view(),
        name="recipient_detail",
    ),
]
