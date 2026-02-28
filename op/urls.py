# ABOUTME: URL patterns for the op (Order of Precedence) app.
# ABOUTME: Routes for public browsing of recipients, honors, events, and bestowals.

from django.urls import path

from . import views

app_name = "op"

urlpatterns = [
    path("", views.index, name="index"),
    path("people/", views.RecipientListView.as_view(), name="recipient_list"),
    path("people/new/", views.RecipientCreateView.as_view(), name="recipient_create"),
    path(
        "people/duplicate-check/",
        views.recipient_duplicate_check,
        name="recipient_duplicate_check",
    ),
    path(
        "people/autocomplete/",
        views.recipient_autocomplete,
        name="recipient_autocomplete",
    ),
    path(
        "people/quick-create/",
        views.recipient_quick_create,
        name="recipient_quick_create",
    ),
    path(
        "people/<int:pk>/",
        views.RecipientDetailView.as_view(),
        name="recipient_detail",
    ),
    path(
        "people/<int:pk>/edit/",
        views.RecipientUpdateView.as_view(),
        name="recipient_update",
    ),
    path("awards/", views.HonorListView.as_view(), name="honor_list"),
    path("awards/new/", views.HonorCreateView.as_view(), name="honor_create"),
    path(
        "awards/<int:pk>/",
        views.HonorDetailView.as_view(),
        name="honor_detail",
    ),
    path(
        "awards/<int:pk>/edit/",
        views.HonorUpdateView.as_view(),
        name="honor_update",
    ),
    path("events/", views.EventListView.as_view(), name="event_list"),
    path("events/new/", views.EventCreateView.as_view(), name="event_create"),
    path(
        "events/<int:pk>/",
        views.EventDetailView.as_view(),
        name="event_detail",
    ),
    path(
        "events/<int:pk>/edit/",
        views.EventUpdateView.as_view(),
        name="event_update",
    ),
    path(
        "bestowals/new/",
        views.BestovalCreateView.as_view(),
        name="bestowal_create",
    ),
    path(
        "bestowals/<int:pk>/edit/",
        views.BestovalUpdateView.as_view(),
        name="bestowal_update",
    ),
    path("bestowals/batch/", views.batch_bestowal, name="batch_bestowal"),
    path("bestowals/batch/add-row/", views.batch_add_row, name="batch_add_row"),
    path(
        "recommendations/",
        views.RecommendationListView.as_view(),
        name="recommendation_list",
    ),
    path(
        "recommendations/new/",
        views.RecommendationCreateView.as_view(),
        name="recommendation_create",
    ),
    path(
        "recommendations/<int:pk>/",
        views.RecommendationDetailView.as_view(),
        name="recommendation_detail",
    ),
    path(
        "recommendations/<int:pk>/status/",
        views.recommendation_update_status,
        name="recommendation_update_status",
    ),
    path(
        "reports/",
        views.ReportListView.as_view(),
        name="report_list",
    ),
    path(
        "reports/new/",
        views.ReportCreateView.as_view(),
        name="report_create",
    ),
    path(
        "reports/mine/",
        views.MyReportsView.as_view(),
        name="my_reports",
    ),
    path(
        "reports/<int:pk>/",
        views.ReportDetailView.as_view(),
        name="report_detail",
    ),
    path(
        "reports/<int:pk>/status/",
        views.report_update_status,
        name="report_update_status",
    ),
    path(
        "court-list/",
        views.CourtListView.as_view(),
        name="court_list",
    ),
    path(
        "court-list/<int:pk>/",
        views.CourtListDetailView.as_view(),
        name="court_list_detail",
    ),
    path(
        "court-list/<int:pk>/add/",
        views.court_list_add,
        name="court_list_add",
    ),
    path(
        "court-list/<int:pk>/publish/",
        views.court_list_publish,
        name="court_list_publish",
    ),
    path(
        "court-list/<int:pk>/reorder/",
        views.court_list_reorder,
        name="court_list_reorder",
    ),
    path(
        "court-list/<int:pk>/print/",
        views.CourtListPrintView.as_view(),
        name="court_list_print",
    ),
]
