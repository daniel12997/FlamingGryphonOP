# ABOUTME: Root conftest for pytest-django configuration.
# ABOUTME: Shared fixtures for auth clients and common test data.

import pytest
from django.contrib.auth import get_user_model
from django.test import Client

from op.models import Event, Group, Honor, Recipient

User = get_user_model()


@pytest.fixture
def approved_user(db):
    return User.objects.create_user(
        username="gooduser",
        password="testpass123",
        sca_name="Dafydd Blaidd",
        is_approved=True,
    )


@pytest.fixture
def admin_user(db):
    return User.objects.create_superuser(
        username="admin",
        password="adminpass123",
        sca_name="The Admin",
        is_approved=True,
    )


@pytest.fixture
def auth_client(approved_user):
    c = Client()
    c.login(username="gooduser", password="testpass123")
    return c


@pytest.fixture
def admin_client(admin_user):
    c = Client()
    c.login(username="admin", password="adminpass123")
    return c


@pytest.fixture
def sample_group(db):
    return Group.objects.create(name="Havenholde", designator="Marche of")


@pytest.fixture
def sample_honor(db):
    return Honor.objects.create(
        name="Flaming Brand",
        prefix="Award of the",
        category=Honor.Category.BARONIAL,
        level=50,
        is_active=True,
        accepts_recommendations=True,
    )


@pytest.fixture
def sample_event(db):
    return Event.objects.create(name="Baronial Twelfth Night", date="2026-01-10")


@pytest.fixture
def sample_recipient(db):
    return Recipient.objects.create(
        sca_name="Bearengaer hinn Raudi",
        mundane_name="Tony Lackey",
        active=True,
    )
