# ABOUTME: Tests for authenticated CRUD views (create/edit for events, recipients, honors, bestowals).
# ABOUTME: Covers login requirements, form submissions, formsets, autocomplete, batch entry, and edit links.

import pytest
from django.test import Client
from django.urls import reverse

from op.models import AlternateName, Bestowal, Event, Honor, Recipient


@pytest.mark.django_db
class TestEventCRUD:
    def test_create_event_requires_login(self, client):
        response = client.get(reverse("op:event_create"))
        assert response.status_code == 302
        assert "/accounts/login/" in response.url

    def test_create_event_form_renders(self, auth_client):
        response = auth_client.get(reverse("op:event_create"))
        assert response.status_code == 200
        content = response.content.decode()
        assert "name" in content.lower()

    def test_create_event_success(self, auth_client):
        response = auth_client.post(
            reverse("op:event_create"),
            {"name": "Grand Tournament", "date": "2026-06-15"},
        )
        assert response.status_code == 302
        assert Event.objects.filter(name="Grand Tournament").exists()

    def test_create_event_shows_success_message(self, auth_client):
        response = auth_client.post(
            reverse("op:event_create"),
            {"name": "Test Event", "date": "2026-03-01"},
            follow=True,
        )
        content = response.content.decode()
        assert "created" in content.lower()

    def test_edit_event_requires_login(self, client, sample_event):
        response = client.get(
            reverse("op:event_update", args=[sample_event.pk])
        )
        assert response.status_code == 302
        assert "/accounts/login/" in response.url

    def test_edit_event_form_renders(self, auth_client, sample_event):
        response = auth_client.get(
            reverse("op:event_update", args=[sample_event.pk])
        )
        assert response.status_code == 200
        content = response.content.decode()
        assert "Baronial Twelfth Night" in content

    def test_edit_event_success(self, auth_client, sample_event):
        response = auth_client.post(
            reverse("op:event_update", args=[sample_event.pk]),
            {"name": "Updated Name", "date": "2026-01-11"},
        )
        assert response.status_code == 302
        sample_event.refresh_from_db()
        assert sample_event.name == "Updated Name"

    def test_edit_event_shows_success_message(self, auth_client, sample_event):
        response = auth_client.post(
            reverse("op:event_update", args=[sample_event.pk]),
            {"name": "Updated Again", "date": "2026-01-12"},
            follow=True,
        )
        content = response.content.decode()
        assert "updated" in content.lower()


@pytest.mark.django_db
class TestRecipientCRUD:
    def test_create_recipient_requires_login(self, client):
        response = client.get(reverse("op:recipient_create"))
        assert response.status_code == 302
        assert "/accounts/login/" in response.url

    def test_create_recipient_form_renders(self, auth_client):
        response = auth_client.get(reverse("op:recipient_create"))
        assert response.status_code == 200

    def test_create_recipient_success(self, auth_client, sample_group):
        response = auth_client.post(
            reverse("op:recipient_create"),
            {
                "sca_name": "Ulf the Tall",
                "mundane_name": "Bob Smith",
                "active": "on",
                "group": sample_group.pk,
                # Formset management data (0 altnames)
                "alternate_names-TOTAL_FORMS": "1",
                "alternate_names-INITIAL_FORMS": "0",
                "alternate_names-MIN_NUM_FORMS": "0",
                "alternate_names-MAX_NUM_FORMS": "1000",
                "alternate_names-0-name": "",
            },
        )
        assert response.status_code == 302
        assert Recipient.objects.filter(sca_name="Ulf the Tall").exists()
        r = Recipient.objects.get(sca_name="Ulf the Tall")
        assert r.group == sample_group

    def test_create_recipient_with_altname(self, auth_client):
        response = auth_client.post(
            reverse("op:recipient_create"),
            {
                "sca_name": "Ulf the Tall",
                "active": "on",
                "alternate_names-TOTAL_FORMS": "1",
                "alternate_names-INITIAL_FORMS": "0",
                "alternate_names-MIN_NUM_FORMS": "0",
                "alternate_names-MAX_NUM_FORMS": "1000",
                "alternate_names-0-name": "Ulf Bearslayer",
                "alternate_names-0-is_nickname": "on",
            },
        )
        assert response.status_code == 302
        r = Recipient.objects.get(sca_name="Ulf the Tall")
        assert r.alternate_names.count() == 1
        assert r.alternate_names.first().name == "Ulf Bearslayer"

    def test_edit_recipient_requires_login(self, client, sample_recipient):
        response = client.get(
            reverse("op:recipient_update", args=[sample_recipient.pk])
        )
        assert response.status_code == 302

    def test_edit_recipient_success(self, auth_client, sample_recipient):
        response = auth_client.post(
            reverse("op:recipient_update", args=[sample_recipient.pk]),
            {
                "sca_name": "Bearengaer the Updated",
                "mundane_name": "Tony Lackey",
                "active": "on",
                "alternate_names-TOTAL_FORMS": "0",
                "alternate_names-INITIAL_FORMS": "0",
                "alternate_names-MIN_NUM_FORMS": "0",
                "alternate_names-MAX_NUM_FORMS": "1000",
            },
        )
        assert response.status_code == 302
        sample_recipient.refresh_from_db()
        assert sample_recipient.sca_name == "Bearengaer the Updated"

    def test_duplicate_detection_warns(self, auth_client, sample_recipient):
        response = auth_client.get(
            reverse("op:recipient_duplicate_check"),
            {"sca_name": "Bearengaer hinn"},
            HTTP_HX_REQUEST="true",
        )
        assert response.status_code == 200
        content = response.content.decode()
        assert "Bearengaer hinn Raudi" in content

    def test_duplicate_detection_short_query_no_matches(self, auth_client):
        response = auth_client.get(
            reverse("op:recipient_duplicate_check"),
            {"sca_name": "ab"},
            HTTP_HX_REQUEST="true",
        )
        assert response.status_code == 200
        content = response.content.decode()
        assert "Possible duplicates" not in content


@pytest.mark.django_db
class TestHonorCRUD:
    def test_create_honor_requires_staff(self, auth_client):
        response = auth_client.get(reverse("op:honor_create"))
        assert response.status_code == 403

    def test_create_honor_staff_renders(self, admin_client):
        response = admin_client.get(reverse("op:honor_create"))
        assert response.status_code == 200

    def test_create_honor_staff_success(self, admin_client):
        response = admin_client.post(
            reverse("op:honor_create"),
            {
                "name": "Golden Gryphon",
                "prefix": "Order of the",
                "level": "30",
                "is_active": "on",
                "category": Honor.Category.BARONIAL,
            },
        )
        assert response.status_code == 302
        assert Honor.objects.filter(name="Golden Gryphon").exists()

    def test_edit_honor_requires_staff(self, auth_client, sample_honor):
        response = auth_client.get(
            reverse("op:honor_update", args=[sample_honor.pk])
        )
        assert response.status_code == 403

    def test_edit_honor_staff_success(self, admin_client, sample_honor):
        response = admin_client.post(
            reverse("op:honor_update", args=[sample_honor.pk]),
            {
                "name": "Flaming Brand Updated",
                "prefix": "Award of the",
                "level": "50",
                "is_active": "on",
                "category": Honor.Category.BARONIAL,
            },
        )
        assert response.status_code == 302
        sample_honor.refresh_from_db()
        assert sample_honor.name == "Flaming Brand Updated"


@pytest.mark.django_db
class TestBestovalCRUD:
    def test_create_bestowal_requires_login(self, client):
        response = client.get(reverse("op:bestowal_create"))
        assert response.status_code == 302
        assert "/accounts/login/" in response.url

    def test_create_bestowal_form_renders(self, auth_client):
        response = auth_client.get(reverse("op:bestowal_create"))
        assert response.status_code == 200

    def test_create_bestowal_success(self, auth_client, sample_recipient, sample_honor):
        response = auth_client.post(
            reverse("op:bestowal_create"),
            {
                "recipient": sample_recipient.pk,
                "honor": sample_honor.pk,
                "sort_date": "2026-01-15",
            },
        )
        assert response.status_code == 302
        assert Bestowal.objects.filter(
            recipient=sample_recipient, honor=sample_honor
        ).exists()

    def test_create_bestowal_prefills_recipient(
        self, auth_client, sample_recipient
    ):
        response = auth_client.get(
            reverse("op:bestowal_create") + f"?recipient={sample_recipient.pk}"
        )
        assert response.status_code == 200
        content = response.content.decode()
        assert str(sample_recipient.pk) in content

    def test_create_bestowal_prefills_event(self, auth_client, sample_event):
        response = auth_client.get(
            reverse("op:bestowal_create") + f"?event={sample_event.pk}"
        )
        assert response.status_code == 200

    def test_edit_bestowal_requires_login(
        self, client, sample_recipient, sample_honor
    ):
        b = Bestowal.objects.create(
            recipient=sample_recipient,
            honor=sample_honor,
            sort_date="2026-01-15",
        )
        response = client.get(reverse("op:bestowal_update", args=[b.pk]))
        assert response.status_code == 302

    def test_edit_bestowal_success(
        self, auth_client, sample_recipient, sample_honor
    ):
        b = Bestowal.objects.create(
            recipient=sample_recipient,
            honor=sample_honor,
            sort_date="2026-01-15",
        )
        response = auth_client.post(
            reverse("op:bestowal_update", args=[b.pk]),
            {
                "recipient": sample_recipient.pk,
                "honor": sample_honor.pk,
                "sort_date": "2026-02-20",
                "notes": "Updated note",
            },
        )
        assert response.status_code == 302
        b.refresh_from_db()
        assert b.notes == "Updated note"

    def test_recipient_autocomplete(self, auth_client, sample_recipient):
        response = auth_client.get(
            reverse("op:recipient_autocomplete"),
            {"q": "Bearengaer"},
            HTTP_HX_REQUEST="true",
        )
        assert response.status_code == 200
        content = response.content.decode()
        assert "Bearengaer hinn Raudi" in content

    def test_recipient_autocomplete_short_query(self, auth_client):
        response = auth_client.get(
            reverse("op:recipient_autocomplete"),
            {"q": "a"},
            HTTP_HX_REQUEST="true",
        )
        assert response.status_code == 200
        assert response.content.decode().strip() == ""

    def test_recipient_quick_create_renders(self, auth_client):
        response = auth_client.get(
            reverse("op:recipient_quick_create"),
            HTTP_HX_REQUEST="true",
        )
        assert response.status_code == 200
        content = response.content.decode()
        assert "sca_name" in content

    def test_recipient_quick_create_success(self, auth_client):
        response = auth_client.post(
            reverse("op:recipient_quick_create"),
            {"sca_name": "Brand New Person", "mundane_name": ""},
            HTTP_HX_REQUEST="true",
        )
        assert response.status_code == 200
        assert Recipient.objects.filter(sca_name="Brand New Person").exists()
        content = response.content.decode()
        assert "Brand New Person" in content


@pytest.mark.django_db
class TestBatchBestowal:
    def test_batch_requires_login(self, client):
        response = client.get(reverse("op:batch_bestowal"))
        assert response.status_code == 302
        assert "/accounts/login/" in response.url

    def test_batch_form_renders(self, auth_client):
        response = auth_client.get(reverse("op:batch_bestowal"))
        assert response.status_code == 200
        content = response.content.decode()
        assert "Record Court" in content

    def test_batch_creates_multiple_bestowals(
        self, auth_client, sample_event, sample_honor
    ):
        r1 = Recipient.objects.create(sca_name="Person One")
        r2 = Recipient.objects.create(sca_name="Person Two")
        response = auth_client.post(
            reverse("op:batch_bestowal"),
            {
                "event": sample_event.pk,
                "date": "2026-03-01",
                "form-TOTAL_FORMS": "5",
                "form-INITIAL_FORMS": "0",
                "form-MIN_NUM_FORMS": "0",
                "form-MAX_NUM_FORMS": "1000",
                "form-0-recipient": r1.pk,
                "form-0-honor": sample_honor.pk,
                "form-0-notes": "",
                "form-1-recipient": r2.pk,
                "form-1-honor": sample_honor.pk,
                "form-1-notes": "special note",
                "form-2-recipient": "",
                "form-2-honor": "",
                "form-2-notes": "",
                "form-3-recipient": "",
                "form-3-honor": "",
                "form-3-notes": "",
                "form-4-recipient": "",
                "form-4-honor": "",
                "form-4-notes": "",
            },
        )
        assert response.status_code == 302
        assert Bestowal.objects.filter(event=sample_event).count() == 2
        b2 = Bestowal.objects.get(recipient=r2, event=sample_event)
        assert b2.notes == "special note"

    def test_batch_creates_new_event(self, auth_client, sample_honor):
        r1 = Recipient.objects.create(sca_name="Person Three")
        response = auth_client.post(
            reverse("op:batch_bestowal"),
            {
                "event": "",
                "new_event_name": "Brand New Event",
                "date": "2026-04-01",
                "form-TOTAL_FORMS": "5",
                "form-INITIAL_FORMS": "0",
                "form-MIN_NUM_FORMS": "0",
                "form-MAX_NUM_FORMS": "1000",
                "form-0-recipient": r1.pk,
                "form-0-honor": sample_honor.pk,
                "form-0-notes": "",
                "form-1-recipient": "",
                "form-1-honor": "",
                "form-1-notes": "",
                "form-2-recipient": "",
                "form-2-honor": "",
                "form-2-notes": "",
                "form-3-recipient": "",
                "form-3-honor": "",
                "form-3-notes": "",
                "form-4-recipient": "",
                "form-4-honor": "",
                "form-4-notes": "",
            },
        )
        assert response.status_code == 302
        assert Event.objects.filter(name="Brand New Event").exists()
        event = Event.objects.get(name="Brand New Event")
        assert Bestowal.objects.filter(event=event).count() == 1

    def test_batch_add_row_htmx(self, auth_client):
        response = auth_client.get(
            reverse("op:batch_add_row"),
            {"form_index": "5"},
            HTTP_HX_REQUEST="true",
        )
        assert response.status_code == 200
        content = response.content.decode()
        assert "form-5" in content


@pytest.mark.django_db
class TestEditLinks:
    def test_anonymous_no_edit_link_on_recipient(self, client, sample_recipient):
        response = client.get(
            reverse("op:recipient_detail", args=[sample_recipient.pk])
        )
        content = response.content.decode()
        assert "/edit/" not in content

    def test_authenticated_sees_edit_link_on_recipient(
        self, auth_client, sample_recipient
    ):
        response = auth_client.get(
            reverse("op:recipient_detail", args=[sample_recipient.pk])
        )
        content = response.content.decode()
        assert f"/people/{sample_recipient.pk}/edit/" in content

    def test_authenticated_sees_add_award_link(
        self, auth_client, sample_recipient
    ):
        response = auth_client.get(
            reverse("op:recipient_detail", args=[sample_recipient.pk])
        )
        content = response.content.decode()
        assert f"recipient={sample_recipient.pk}" in content

    def test_anonymous_no_edit_link_on_event(self, client, sample_event):
        response = client.get(
            reverse("op:event_detail", args=[sample_event.pk])
        )
        content = response.content.decode()
        assert "/edit/" not in content

    def test_authenticated_sees_edit_link_on_event(
        self, auth_client, sample_event
    ):
        response = auth_client.get(
            reverse("op:event_detail", args=[sample_event.pk])
        )
        content = response.content.decode()
        assert f"/events/{sample_event.pk}/edit/" in content

    def test_anonymous_no_edit_link_on_honor(self, client, sample_honor):
        response = client.get(
            reverse("op:honor_detail", args=[sample_honor.pk])
        )
        content = response.content.decode()
        assert "/edit/" not in content

    def test_staff_sees_edit_link_on_honor(self, admin_client, sample_honor):
        response = admin_client.get(
            reverse("op:honor_detail", args=[sample_honor.pk])
        )
        content = response.content.decode()
        assert f"/awards/{sample_honor.pk}/edit/" in content

    def test_nav_has_record_court_for_authenticated(self, auth_client):
        response = auth_client.get(reverse("op:index"))
        content = response.content.decode()
        assert "Record Court" in content

    def test_nav_no_record_court_for_anonymous(self, client):
        response = client.get(reverse("op:index"))
        content = response.content.decode()
        assert "Record Court" not in content
