# ABOUTME: Custom authentication backend for admin-approved registration.
# ABOUTME: Rejects login for users who have not been approved by an admin.

from typing import Any

from django.contrib.auth import get_user_model
from django.contrib.auth.backends import ModelBackend
from django.contrib.auth.base_user import AbstractBaseUser
from django.http import HttpRequest

User = get_user_model()


class ApprovedUserBackend(ModelBackend):
    """Only allow login for users where is_approved=True."""

    def authenticate(  # type: ignore[override]
        self,
        request: HttpRequest | None,
        username: str | None = None,
        password: str | None = None,
        **kwargs: Any,
    ) -> AbstractBaseUser | None:
        user = super().authenticate(request, username=username, password=password, **kwargs)
        if user is not None and not user.is_approved and not user.is_superuser:
            return None
        return user
