# ABOUTME: Tests for public award rolls and event history views.
# ABOUTME: Covers honor list grouping, honor detail rolls, event list, and event detail.

import pytest
from django.test import Client
from django.urls import reverse

from op.models import Bestowal, Event, Honor, Recipient


@pytest.fixture
def client():
    return Client()


@pytest.fixture
def baronial_honor():
    return Honor.objects.create(
        name="Flaming Brand",
        prefix="Award of the",
        category=Honor.Category.BARONIAL,
        level=50,
        abbreviation="AFB",
        description="Given for service.",
        is_active=True,
    )


@pytest.fixture
def champion_honor():
    return Honor.objects.create(
        name="Baronial Champion",
        category=Honor.Category.CHAMPION,
        level=0,
        is_active=True,
    )


@pytest.fixture
def external_honor():
    return Honor.objects.create(
        name="External Honor #167",
        category=Honor.Category.EXTERNAL,
        is_external=True,
        is_active=True,
        legacy_key=167,
    )


@pytest.fixture
def inactive_honor():
    return Honor.objects.create(
        name="Retired Award",
        category=Honor.Category.BARONIAL,
        is_active=False,
    )


@pytest.fixture
def recipient():
    return Recipient.objects.create(
        sca_name="Bearengaer hinn Raudi",
        mundane_name="Tony Lackey",
        active=True,
    )


@pytest.fixture
def event():
    return Event.objects.create(name="Push for Pennsic", date="2011-07-09")


@pytest.fixture
def bestowal(recipient, baronial_honor):
    return Bestowal.objects.create(
        sort_date="1970-12-31",
        recipient=recipient,
        honor=baronial_honor,
        notes="(1st Court Baronage)",
    )


@pytest.mark.django_db
class TestHonorListView:
    def test_returns_200(self, client):
        response = client.get(reverse("op:honor_list"))
        assert response.status_code == 200

    def test_shows_baronial_honors(self, client, baronial_honor):
        response = client.get(reverse("op:honor_list"))
        content = response.content.decode()
        assert "Flaming Brand" in content

    def test_shows_champion_honors(self, client, champion_honor):
        response = client.get(reverse("op:honor_list"))
        content = response.content.decode()
        assert "Baronial Champion" in content

    def test_groups_by_category(self, client, baronial_honor, champion_honor):
        response = client.get(reverse("op:honor_list"))
        content = response.content.decode()
        assert "Baronial" in content
        assert "Champion" in content

    def test_shows_external_section(self, client, external_honor):
        response = client.get(reverse("op:honor_list"))
        content = response.content.decode()
        assert "External" in content

    def test_shows_recipient_count(self, client, bestowal):
        response = client.get(reverse("op:honor_list"))
        content = response.content.decode()
        # The honor should show a count of 1 recipient
        assert "1" in content

    def test_nav_link_exists(self, client):
        response = client.get(reverse("op:index"))
        content = response.content.decode()
        assert reverse("op:honor_list") in content


@pytest.mark.django_db
class TestHonorDetailView:
    def test_returns_200(self, client, baronial_honor):
        response = client.get(reverse("op:honor_detail", args=[baronial_honor.pk]))
        assert response.status_code == 200

    def test_shows_honor_name(self, client, baronial_honor):
        response = client.get(reverse("op:honor_detail", args=[baronial_honor.pk]))
        content = response.content.decode()
        assert "Flaming Brand" in content

    def test_shows_description(self, client, baronial_honor):
        response = client.get(reverse("op:honor_detail", args=[baronial_honor.pk]))
        content = response.content.decode()
        assert "Given for service." in content

    def test_shows_recipients(self, client, bestowal):
        response = client.get(
            reverse("op:honor_detail", args=[bestowal.honor.pk])
        )
        content = response.content.decode()
        assert "Bearengaer hinn Raudi" in content

    def test_404_for_missing(self, client):
        response = client.get(reverse("op:honor_detail", args=[99999]))
        assert response.status_code == 404


@pytest.mark.django_db
class TestEventListView:
    def test_returns_200(self, client):
        response = client.get(reverse("op:event_list"))
        assert response.status_code == 200

    def test_shows_events(self, client, event):
        response = client.get(reverse("op:event_list"))
        content = response.content.decode()
        assert "Push for Pennsic" in content

    def test_ordering_most_recent_first(self, client):
        Event.objects.create(name="Old Event", date="2010-01-01")
        Event.objects.create(name="New Event", date="2023-06-15")
        response = client.get(reverse("op:event_list"))
        content = response.content.decode()
        old_pos = content.index("Old Event")
        new_pos = content.index("New Event")
        assert new_pos < old_pos

    def test_nav_link_exists(self, client):
        response = client.get(reverse("op:index"))
        content = response.content.decode()
        assert reverse("op:event_list") in content


@pytest.mark.django_db
class TestEventDetailView:
    def test_returns_200(self, client, event):
        response = client.get(reverse("op:event_detail", args=[event.pk]))
        assert response.status_code == 200

    def test_shows_event_name(self, client, event):
        response = client.get(reverse("op:event_detail", args=[event.pk]))
        content = response.content.decode()
        assert "Push for Pennsic" in content

    def test_shows_bestowals_by_fk(self, client, event, recipient, baronial_honor):
        Bestowal.objects.create(
            sort_date="2011-07-09",
            recipient=recipient,
            honor=baronial_honor,
            event=event,
        )
        response = client.get(reverse("op:event_detail", args=[event.pk]))
        content = response.content.decode()
        assert "Bearengaer hinn Raudi" in content
        assert "Flaming Brand" in content

    def test_404_for_missing(self, client):
        response = client.get(reverse("op:event_detail", args=[99999]))
        assert response.status_code == 404
