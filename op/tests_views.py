# ABOUTME: Tests for public-facing views (person search, detail, home page).
# ABOUTME: Covers search by SCA name, alternate names, pagination, and HTMX partials.

import pytest
from django.test import Client
from django.urls import reverse

from op.models import AlternateName, Bestowal, Honor, Recipient


@pytest.fixture
def client():
    return Client()


@pytest.fixture
def honor():
    return Honor.objects.create(
        name="Flaming Brand",
        prefix="Award of the",
        category=Honor.Category.BARONIAL,
        level=50,
        is_active=True,
    )


@pytest.fixture
def recipient():
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
def recipient_with_altname(recipient):
    AlternateName.objects.create(
        recipient=recipient,
        name="Bear the Bold",
        is_nickname=True,
    )
    return recipient


@pytest.fixture
def bestowal(recipient, honor):
    return Bestowal.objects.create(
        sort_date="1970-12-31",
        display_date="?",
        recipient=recipient,
        honor=honor,
        notes="(1st Court Baronage)",
    )


@pytest.mark.django_db
class TestIndexView:
    def test_index_returns_200(self, client):
        response = client.get(reverse("op:index"))
        assert response.status_code == 200

    def test_index_has_search_link(self, client):
        response = client.get(reverse("op:index"))
        content = response.content.decode()
        assert reverse("op:recipient_list") in content

    def test_index_shows_recent_bestowals(self, client, bestowal):
        response = client.get(reverse("op:index"))
        content = response.content.decode()
        assert "Bearengaer hinn Raudi" in content
        assert "Flaming Brand" in content


@pytest.mark.django_db
class TestRecipientListView:
    def test_list_returns_200(self, client):
        response = client.get(reverse("op:recipient_list"))
        assert response.status_code == 200

    def test_list_shows_recipients(self, client, recipient):
        response = client.get(reverse("op:recipient_list"))
        content = response.content.decode()
        assert "Bearengaer hinn Raudi" in content

    def test_search_by_sca_name(self, client, recipient):
        response = client.get(reverse("op:recipient_list"), {"q": "Bearengaer"})
        content = response.content.decode()
        assert "Bearengaer hinn Raudi" in content

    def test_search_no_results(self, client, recipient):
        response = client.get(reverse("op:recipient_list"), {"q": "Zzzzzz"})
        content = response.content.decode()
        assert "Bearengaer" not in content

    def test_search_by_mundane_name(self, client, recipient):
        response = client.get(reverse("op:recipient_list"), {"q": "Lackey"})
        content = response.content.decode()
        assert "Bearengaer hinn Raudi" in content

    def test_search_by_alternate_name(self, client, recipient_with_altname):
        response = client.get(reverse("op:recipient_list"), {"q": "Bear the Bold"})
        content = response.content.decode()
        assert "Bearengaer hinn Raudi" in content

    def test_search_case_insensitive(self, client, recipient):
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

    def test_htmx_returns_partial(self, client, recipient):
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
    def test_detail_returns_200(self, client, recipient):
        response = client.get(reverse("op:recipient_detail", args=[recipient.pk]))
        assert response.status_code == 200

    def test_detail_shows_sca_name(self, client, recipient):
        response = client.get(reverse("op:recipient_detail", args=[recipient.pk]))
        content = response.content.decode()
        assert "Bearengaer hinn Raudi" in content

    def test_detail_shows_mundane_name(self, client, recipient):
        response = client.get(reverse("op:recipient_detail", args=[recipient.pk]))
        content = response.content.decode()
        assert "Tony Lackey" in content

    def test_detail_shows_bestowals(self, client, bestowal):
        response = client.get(
            reverse("op:recipient_detail", args=[bestowal.recipient.pk])
        )
        content = response.content.decode()
        assert "Flaming Brand" in content
        assert "1st Court Baronage" in content

    def test_detail_shows_alternate_names(self, client, recipient_with_altname):
        response = client.get(
            reverse("op:recipient_detail", args=[recipient_with_altname.pk])
        )
        content = response.content.decode()
        assert "Bear the Bold" in content

    def test_detail_shows_registration_status(self, client, recipient):
        response = client.get(reverse("op:recipient_detail", args=[recipient.pk]))
        content = response.content.decode()
        assert "Per pale azure and Or" in content

    def test_detail_404_for_missing(self, client):
        response = client.get(reverse("op:recipient_detail", args=[99999]))
        assert response.status_code == 404
