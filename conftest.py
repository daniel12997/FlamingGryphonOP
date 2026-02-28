# ABOUTME: Root conftest for pytest-django configuration.
# ABOUTME: Single source of truth for shared test fixtures across all test files.

import datetime

import pytest
from django.contrib.auth import get_user_model
from django.test import Client

from op.models import AlternateName, Bestowal, Event, Group, Honor, Recipient, Report

User = get_user_model()


# --- Auth fixtures ---


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


# --- Domain model fixtures ---


@pytest.fixture
def sample_group(db):
    return Group.objects.create(name="Havenholde", designator="Marche of")


@pytest.fixture
def sample_honor(db):
    """A baronial honor that accepts recommendations (the common case)."""
    return Honor.objects.create(
        name="Flaming Brand",
        prefix="Award of the",
        category=Honor.Category.BARONIAL,
        level=50,
        abbreviation="AFB",
        description="Given for service.",
        is_active=True,
        accepts_recommendations=True,
    )


@pytest.fixture
def champion_honor(db):
    return Honor.objects.create(
        name="Baronial Champion",
        category=Honor.Category.CHAMPION,
        level=0,
        is_active=True,
    )


@pytest.fixture
def external_honor(db):
    return Honor.objects.create(
        name="External Honor #167",
        category=Honor.Category.EXTERNAL,
        is_external=True,
        is_active=True,
        legacy_key=167,
    )


@pytest.fixture
def inactive_honor(db):
    return Honor.objects.create(
        name="Retired Award",
        category=Honor.Category.BARONIAL,
        is_active=False,
    )


@pytest.fixture
def sample_event(db):
    return Event.objects.create(
        name="Baronial Twelfth Night",
        date=datetime.date(2026, 1, 10),
    )


@pytest.fixture
def sample_recipient(db):
    return Recipient.objects.create(
        sca_name="Bearengaer hinn Raudi",
        mundane_name="Tony Lackey",
        gender="M",
        active=True,
        name_registered=True,
        device_registered=True,
        device_blazon="Per pale azure and Or",
    )


@pytest.fixture
def sample_altname(sample_recipient):
    return AlternateName.objects.create(
        recipient=sample_recipient,
        name="Bear the Bold",
        is_nickname=True,
    )


@pytest.fixture
def sample_bestowal(sample_recipient, sample_honor):
    return Bestowal.objects.create(
        sort_date=datetime.date(1970, 12, 31),
        display_date="?",
        recipient=sample_recipient,
        honor=sample_honor,
        notes="(1st Court Baronage)",
    )


@pytest.fixture
def sample_report(approved_user):
    return Report.objects.create(
        reporter=approved_user,
        subject="Wrong date on bestowal",
        description="The date for Flaming Brand should be 2018, not 2019.",
    )


@pytest.fixture
def future_event(db):
    return Event.objects.create(
        name="Future Tournament",
        date=datetime.date(2027, 6, 1),
    )
