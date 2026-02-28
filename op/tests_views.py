# ABOUTME: Tests for public-facing views (person search, detail, home page).
# ABOUTME: Covers search by SCA name, alternate names, pagination, and HTMX partials.

import pytest
from django.urls import reverse

from op.models import Recipient


@pytest.mark.django_db
class TestIndexView:
    def test_index_returns_200(self, client):
        response = client.get(reverse("op:index"))
        assert response.status_code == 200

    def test_index_has_search_link(self, client):
        response = client.get(reverse("op:index"))
        content = response.content.decode()
        assert reverse("op:recipient_list") in content

    def test_index_shows_recent_bestowals(self, client, sample_bestowal):
        response = client.get(reverse("op:index"))
        content = response.content.decode()
        assert "Bearengaer hinn Raudi" in content
        assert "Flaming Brand" in content


@pytest.mark.django_db
class TestRecipientListView:
    def test_list_returns_200(self, client):
        response = client.get(reverse("op:recipient_list"))
        assert response.status_code == 200

    def test_list_shows_recipients(self, client, sample_recipient):
        response = client.get(reverse("op:recipient_list"))
        content = response.content.decode()
        assert "Bearengaer hinn Raudi" in content

    def test_search_by_sca_name(self, client, sample_recipient):
        response = client.get(reverse("op:recipient_list"), {"q": "Bearengaer"})
        content = response.content.decode()
        assert "Bearengaer hinn Raudi" in content

    def test_search_no_results(self, client, sample_recipient):
        response = client.get(reverse("op:recipient_list"), {"q": "Zzzzzz"})
        content = response.content.decode()
        assert "Bearengaer" not in content

    def test_search_by_mundane_name(self, client, sample_recipient):
        response = client.get(reverse("op:recipient_list"), {"q": "Lackey"})
        content = response.content.decode()
        assert "Bearengaer hinn Raudi" in content

    def test_search_by_alternate_name(self, client, sample_altname):
        response = client.get(reverse("op:recipient_list"), {"q": "Bear the Bold"})
        content = response.content.decode()
        assert "Bearengaer hinn Raudi" in content

    def test_search_case_insensitive(self, client, sample_recipient):
        response = client.get(reverse("op:recipient_list"), {"q": "bearengaer"})
        content = response.content.decode()
        assert "Bearengaer hinn Raudi" in content

    def test_pagination(self, client):
        for i in range(30):
            Recipient.objects.create(sca_name=f"Person {i:03d}", active=True)
        response = client.get(reverse("op:recipient_list"))
        content = response.content.decode()
        # Should have pagination controls
        assert "page" in content.lower() or "next" in content.lower()

    def test_htmx_returns_partial(self, client, sample_recipient):
        response = client.get(
            reverse("op:recipient_list"),
            {"q": "Bear"},
            HTTP_HX_REQUEST="true",
        )
        assert response.status_code == 200
        content = response.content.decode()
        # HTMX response should NOT include full page chrome (no <html> tag)
        assert "<html" not in content
        assert "Bearengaer" in content


@pytest.mark.django_db
class TestRecipientDetailView:
    def test_detail_returns_200(self, client, sample_recipient):
        response = client.get(reverse("op:recipient_detail", args=[sample_recipient.pk]))
        assert response.status_code == 200

    def test_detail_shows_sca_name(self, client, sample_recipient):
        response = client.get(reverse("op:recipient_detail", args=[sample_recipient.pk]))
        content = response.content.decode()
        assert "Bearengaer hinn Raudi" in content

    def test_detail_shows_mundane_name(self, client, sample_recipient):
        response = client.get(reverse("op:recipient_detail", args=[sample_recipient.pk]))
        content = response.content.decode()
        assert "Tony Lackey" in content

    def test_detail_shows_bestowals(self, client, sample_bestowal):
        response = client.get(
            reverse("op:recipient_detail", args=[sample_bestowal.recipient.pk])
        )
        content = response.content.decode()
        assert "Flaming Brand" in content
        assert "1st Court Baronage" in content

    def test_detail_shows_alternate_names(self, client, sample_altname):
        response = client.get(
            reverse("op:recipient_detail", args=[sample_altname.recipient.pk])
        )
        content = response.content.decode()
        assert "Bear the Bold" in content

    def test_detail_shows_registration_status(self, client, sample_recipient):
        response = client.get(reverse("op:recipient_detail", args=[sample_recipient.pk]))
        content = response.content.decode()
        assert "Per pale azure and Or" in content

    def test_detail_404_for_missing(self, client):
        response = client.get(reverse("op:recipient_detail", args=[99999]))
        assert response.status_code == 404
