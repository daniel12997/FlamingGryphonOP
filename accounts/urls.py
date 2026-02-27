# ABOUTME: URL patterns for the accounts app.
# ABOUTME: Routes for registration, login, logout, and admin approval.

from django.contrib.auth import views as auth_views
from django.urls import path

from . import views

app_name = "accounts"

urlpatterns = [
    path("register/", views.RegisterView.as_view(), name="register"),
    path("register/success/", views.register_success, name="register_success"),
    path(
        "login/",
        auth_views.LoginView.as_view(template_name="accounts/login.html"),
        name="login",
    ),
    path("logout/", auth_views.LogoutView.as_view(), name="logout"),
    path("pending/", views.pending_users, name="pending"),
    path("approve/<int:pk>/", views.approve_user, name="approve"),
]
