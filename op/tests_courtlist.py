# ABOUTME: Tests for the draft court list planning system.
# ABOUTME: Covers creating draft bestowals, publishing, reordering, and print view.

import datetime

import pytest
from django.urls import reverse

from op.models import Bestowal, Event, Honor, Recipient, Recommendation


@pytest.mark.django_db
class TestCourtListView:
    def test_requires_staff(self, auth_client):
        response = auth_client.get(reverse("op:court_list"))
        assert response.status_code == 403

    def test_renders_for_admin(self, admin_client):
        response = admin_client.get(reverse("op:court_list"))
        assert response.status_code == 200

    def test_shows_future_events(self, admin_client, future_event):
        past = Event.objects.create(
            name="Past Event", date=datetime.date(2020, 1, 1)
        )
        response = admin_client.get(reverse("op:court_list"))
        content = response.content.decode()
        assert future_event.name in content
        assert "Past Event" not in content


@pytest.mark.django_db
class TestCourtListDetail:
    @pytest.fixture
    def draft_bestowal(self, future_event, sample_recipient, sample_honor):
        return Bestowal.objects.create(
            recipient=sample_recipient,
            honor=sample_honor,
            sort_date=future_event.date,
            event=future_event,
            is_draft=True,
            sequence="0",
        )

    def test_requires_staff(self, auth_client, future_event):
        response = auth_client.get(
            reverse("op:court_list_detail", args=[future_event.pk])
        )
        assert response.status_code == 403

    def test_shows_draft_bestowals(self, admin_client, future_event, draft_bestowal):
        response = admin_client.get(
            reverse("op:court_list_detail", args=[future_event.pk])
        )
        assert response.status_code == 200
        content = response.content.decode()
        assert draft_bestowal.recipient.sca_name in content

    def test_shows_scheduled_recommendations(
        self, admin_client, future_event, approved_user, sample_honor
    ):
        Recommendation.objects.create(
            recommender=approved_user,
            nominee_sca_name="Scheduled Person",
            honor=sample_honor,
            justification="Worthy.",
            status=Recommendation.Status.SCHEDULED,
            scheduled_event=future_event,
        )
        response = admin_client.get(
            reverse("op:court_list_detail", args=[future_event.pk])
        )
        content = response.content.decode()
        assert "Scheduled Person" in content

    def test_draft_not_visible_in_public(self, client, future_event, draft_bestowal):
        response = client.get(
            reverse("op:event_detail", args=[future_event.pk])
        )
        content = response.content.decode()
        assert draft_bestowal.recipient.sca_name not in content


@pytest.mark.django_db
class TestAddToCourtList:
    def test_add_draft_bestowal(self, admin_client, future_event, sample_honor):
        recipient = Recipient.objects.create(sca_name="Court Person")
        response = admin_client.post(
            reverse("op:court_list_add", args=[future_event.pk]),
            {
                "recipient": recipient.pk,
                "honor": sample_honor.pk,
                "notes": "Special presentation",
            },
        )
        assert response.status_code == 302
        bestowal = Bestowal.objects.get(
            recipient=recipient, event=future_event
        )
        assert bestowal.is_draft is True
        assert bestowal.notes == "Special presentation"


@pytest.mark.django_db
class TestPublishCourtList:
    @pytest.fixture
    def draft_bestowal(self, future_event, sample_recipient, sample_honor):
        return Bestowal.objects.create(
            recipient=sample_recipient,
            honor=sample_honor,
            sort_date=future_event.date,
            event=future_event,
            is_draft=True,
        )

    def test_publish_makes_public(self, admin_client, future_event, draft_bestowal):
        response = admin_client.post(
            reverse("op:court_list_publish", args=[future_event.pk])
        )
        assert response.status_code == 302
        draft_bestowal.refresh_from_db()
        assert draft_bestowal.is_draft is False

    def test_publish_updates_linked_recommendations(
        self, admin_client, future_event, sample_honor, approved_user
    ):
        recipient = Recipient.objects.create(sca_name="Rec Person")
        Recommendation.objects.create(
            recommender=approved_user,
            nominee_sca_name="Rec Person",
            honor=sample_honor,
            justification="Worthy.",
            status=Recommendation.Status.SCHEDULED,
            scheduled_event=future_event,
        )
        Bestowal.objects.create(
            recipient=recipient,
            honor=sample_honor,
            sort_date=future_event.date,
            event=future_event,
            is_draft=True,
        )
        admin_client.post(
            reverse("op:court_list_publish", args=[future_event.pk])
        )
        rec = Recommendation.objects.get(nominee_sca_name="Rec Person")
        assert rec.status == Recommendation.Status.GIVEN


@pytest.mark.django_db
class TestReorderCourtList:
    def test_reorder(self, admin_client, future_event, sample_honor):
        r1 = Recipient.objects.create(sca_name="First")
        r2 = Recipient.objects.create(sca_name="Second")
        b1 = Bestowal.objects.create(
            recipient=r1, honor=sample_honor, sort_date=future_event.date,
            event=future_event, is_draft=True, sequence="0",
        )
        b2 = Bestowal.objects.create(
            recipient=r2, honor=sample_honor, sort_date=future_event.date,
            event=future_event, is_draft=True, sequence="1",
        )
        # Swap order
        response = admin_client.post(
            reverse("op:court_list_reorder", args=[future_event.pk]),
            {"order": f"{b2.pk},{b1.pk}"},
        )
        assert response.status_code == 200
        b1.refresh_from_db()
        b2.refresh_from_db()
        assert b2.sequence == "0"
        assert b1.sequence == "1"


@pytest.mark.django_db
class TestPrintCourtList:
    def test_print_requires_staff(self, auth_client, future_event):
        response = auth_client.get(
            reverse("op:court_list_print", args=[future_event.pk])
        )
        assert response.status_code == 403

    def test_print_renders(self, admin_client, future_event, sample_honor, sample_recipient):
        Bestowal.objects.create(
            recipient=sample_recipient, honor=sample_honor,
            sort_date=future_event.date, event=future_event,
            is_draft=True, sequence="0",
        )
        response = admin_client.get(
            reverse("op:court_list_print", args=[future_event.pk])
        )
        assert response.status_code == 200
        content = response.content.decode()
        assert sample_recipient.sca_name in content
        assert future_event.name in content
