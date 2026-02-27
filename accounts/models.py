# ABOUTME: Custom User model for the accounts app.
# ABOUTME: Extends AbstractUser with SCA name and admin-approved registration.

from django.contrib.auth.models import AbstractUser
from django.db import models


class User(AbstractUser):
    """Custom user with SCA name and approval workflow."""

    sca_name = models.CharField(max_length=250, blank=True)
    is_approved = models.BooleanField(
        default=False,
        help_text="Users cannot log in until approved by an admin.",
    )

    def __str__(self):
        if self.sca_name:
            return f"{self.username} ({self.sca_name})"
        return self.username
