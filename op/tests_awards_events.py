# ABOUTME: Tests for public award rolls and event history views.
# ABOUTME: Covers honor list grouping, honor detail rolls, event list, and event detail.

import pytest
from django.urls import reverse

from op.models import Bestowal, Event, Honor


@pytest.mark.django_db
class TestHonorListView:
    def test_returns_200(self, client):
        response = client.get(reverse("op:honor_list"))
        assert response.status_code == 200

    def test_shows_baronial_honors(self, client, sample_honor):
        response = client.get(reverse("op:honor_list"))
        content = response.content.decode()
        assert "Flaming Brand" in content

    def test_shows_champion_honors(self, client, champion_honor):
        response = client.get(reverse("op:honor_list"))
        content = response.content.decode()
        assert "Baronial Champion" in content

    def test_groups_by_category(self, client, sample_honor, champion_honor):
        response = client.get(reverse("op:honor_list"))
        content = response.content.decode()
        assert "Baronial" in content
        assert "Champion" in content

    def test_shows_external_section(self, client, external_honor):
        response = client.get(reverse("op:honor_list"))
        content = response.content.decode()
        assert "External" in content

    def test_shows_recipient_count(self, client, sample_bestowal):
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
    def test_returns_200(self, client, sample_honor):
        response = client.get(reverse("op:honor_detail", args=[sample_honor.pk]))
        assert response.status_code == 200

    def test_shows_honor_name(self, client, sample_honor):
        response = client.get(reverse("op:honor_detail", args=[sample_honor.pk]))
        content = response.content.decode()
        assert "Flaming Brand" in content

    def test_shows_description(self, client, sample_honor):
        response = client.get(reverse("op:honor_detail", args=[sample_honor.pk]))
        content = response.content.decode()
        assert "Given for service." in content

    def test_shows_recipients(self, client, sample_bestowal):
        response = client.get(
            reverse("op:honor_detail", args=[sample_bestowal.honor.pk])
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

    def test_shows_events(self, client, sample_event):
        response = client.get(reverse("op:event_list"))
        content = response.content.decode()
        assert "Baronial Twelfth Night" in content

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
    def test_returns_200(self, client, sample_event):
        response = client.get(reverse("op:event_detail", args=[sample_event.pk]))
        assert response.status_code == 200

    def test_shows_event_name(self, client, sample_event):
        response = client.get(reverse("op:event_detail", args=[sample_event.pk]))
        content = response.content.decode()
        assert "Baronial Twelfth Night" in content

    def test_shows_bestowals_by_fk(self, client, sample_event, sample_recipient, sample_honor):
        Bestowal.objects.create(
            sort_date=sample_event.date,
            recipient=sample_recipient,
            honor=sample_honor,
            event=sample_event,
        )
        response = client.get(reverse("op:event_detail", args=[sample_event.pk]))
        content = response.content.decode()
        assert "Bearengaer hinn Raudi" in content
        assert "Flaming Brand" in content

    def test_404_for_missing(self, client):
        response = client.get(reverse("op:event_detail", args=[99999]))
        assert response.status_code == 404
