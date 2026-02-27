# ABOUTME: Custom authentication backend for admin-approved registration.
# ABOUTME: Rejects login for users who have not been approved by an admin.

from django.contrib.auth import get_user_model
from django.contrib.auth.backends import ModelBackend

User = get_user_model()


class ApprovedUserBackend(ModelBackend):
    """Only allow login for users where is_approved=True."""

    def authenticate(self, request, username=None, password=None, **kwargs):
        user = super().authenticate(request, username=username, password=password, **kwargs)
        if user is not None and not user.is_approved:
            return None
        return user
