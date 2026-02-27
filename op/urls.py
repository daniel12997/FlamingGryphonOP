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
    path("awards/", views.HonorListView.as_view(), name="honor_list"),
    path(
        "awards/<int:pk>/",
        views.HonorDetailView.as_view(),
        name="honor_detail",
    ),
    path("events/", views.EventListView.as_view(), name="event_list"),
    path(
        "events/<int:pk>/",
        views.EventDetailView.as_view(),
        name="event_detail",
    ),
]
