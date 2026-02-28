# ABOUTME: Tests for the recommendation submission and management system.
# ABOUTME: Covers form submission, admin management, status transitions, and access control.

import pytest
from django.urls import reverse

from op.models import Event, Honor, Recommendation


@pytest.mark.django_db
class TestRecommendationCreate:
    def test_create_requires_login(self, client):
        response = client.get(reverse("op:recommendation_create"))
        assert response.status_code == 302
        assert "/accounts/login/" in response.url

    def test_create_form_renders(self, auth_client, sample_honor):
        response = auth_client.get(reverse("op:recommendation_create"))
        assert response.status_code == 200
        content = response.content.decode()
        assert "nominee_sca_name" in content

    def test_only_recommendable_honors_shown(self, auth_client, sample_honor, db):
        # sample_honor has accepts_recommendations=True
        non_rec_honor = Honor.objects.create(
            name="Champion Position",
            category=Honor.Category.CHAMPION,
            accepts_recommendations=False,
        )
        response = auth_client.get(reverse("op:recommendation_create"))
        content = response.content.decode()
        assert sample_honor.name in content
        assert non_rec_honor.name not in content

    def test_create_success(self, auth_client, sample_honor, approved_user):
        response = auth_client.post(
            reverse("op:recommendation_create"),
            {
                "nominee_sca_name": "Valiant Person",
                "nominee_mundane_name": "John Doe",
                "honor": sample_honor.pk,
                "justification": "They have served admirably for many years.",
            },
        )
        assert response.status_code == 302
        rec = Recommendation.objects.get(nominee_sca_name="Valiant Person")
        assert rec.recommender == approved_user
        assert rec.honor == sample_honor
        assert rec.status == Recommendation.Status.PENDING

    def test_recommender_auto_set(self, auth_client, sample_honor, approved_user):
        auth_client.post(
            reverse("op:recommendation_create"),
            {
                "nominee_sca_name": "Test Person",
                "honor": sample_honor.pk,
                "justification": "Great contributor.",
            },
        )
        rec = Recommendation.objects.get(nominee_sca_name="Test Person")
        assert rec.recommender == approved_user

    def test_create_shows_success_message(self, auth_client, sample_honor):
        response = auth_client.post(
            reverse("op:recommendation_create"),
            {
                "nominee_sca_name": "Test Person",
                "honor": sample_honor.pk,
                "justification": "Great contributor.",
            },
            follow=True,
        )
        content = response.content.decode()
        assert "submitted" in content.lower() or "created" in content.lower()


@pytest.mark.django_db
class TestRecommendationList:
    def test_list_requires_staff(self, auth_client):
        response = auth_client.get(reverse("op:recommendation_list"))
        assert response.status_code == 403

    def test_list_renders_for_admin(self, admin_client):
        response = admin_client.get(reverse("op:recommendation_list"))
        assert response.status_code == 200

    def test_list_shows_recommendations(
        self, admin_client, approved_user, sample_honor
    ):
        Recommendation.objects.create(
            recommender=approved_user,
            nominee_sca_name="Listed Person",
            honor=sample_honor,
            justification="Test.",
        )
        response = admin_client.get(reverse("op:recommendation_list"))
        content = response.content.decode()
        assert "Listed Person" in content

    def test_list_filter_by_status(
        self, admin_client, approved_user, sample_honor
    ):
        Recommendation.objects.create(
            recommender=approved_user,
            nominee_sca_name="Pending One",
            honor=sample_honor,
            justification="Test.",
            status=Recommendation.Status.PENDING,
        )
        Recommendation.objects.create(
            recommender=approved_user,
            nominee_sca_name="Given One",
            honor=sample_honor,
            justification="Test.",
            status=Recommendation.Status.GIVEN,
        )
        response = admin_client.get(
            reverse("op:recommendation_list"), {"status": "PENDING"}
        )
        content = response.content.decode()
        assert "Pending One" in content
        assert "Given One" not in content


@pytest.mark.django_db
class TestRecommendationDetail:
    @pytest.fixture
    def recommendation(self, approved_user, sample_honor):
        return Recommendation.objects.create(
            recommender=approved_user,
            nominee_sca_name="Detail Person",
            honor=sample_honor,
            justification="Very deserving individual.",
        )

    def test_detail_requires_staff(self, auth_client, recommendation):
        response = auth_client.get(
            reverse("op:recommendation_detail", args=[recommendation.pk])
        )
        assert response.status_code == 403

    def test_detail_renders_for_admin(self, admin_client, recommendation):
        response = admin_client.get(
            reverse("op:recommendation_detail", args=[recommendation.pk])
        )
        assert response.status_code == 200
        content = response.content.decode()
        assert "Detail Person" in content
        assert "Very deserving individual" in content

    def test_schedule_for_event(self, admin_client, recommendation):
        event = Event.objects.create(name="Future Event", date="2026-06-01")
        response = admin_client.post(
            reverse("op:recommendation_update_status", args=[recommendation.pk]),
            {"status": "SCHEDULED", "scheduled_event": event.pk},
        )
        assert response.status_code == 302
        recommendation.refresh_from_db()
        assert recommendation.status == Recommendation.Status.SCHEDULED
        assert recommendation.scheduled_event == event

    def test_mark_as_given(self, admin_client, recommendation):
        response = admin_client.post(
            reverse("op:recommendation_update_status", args=[recommendation.pk]),
            {"status": "GIVEN"},
        )
        assert response.status_code == 302
        recommendation.refresh_from_db()
        assert recommendation.status == Recommendation.Status.GIVEN

    def test_decline(self, admin_client, recommendation):
        response = admin_client.post(
            reverse("op:recommendation_update_status", args=[recommendation.pk]),
            {"status": "DECLINED"},
        )
        assert response.status_code == 302
        recommendation.refresh_from_db()
        assert recommendation.status == Recommendation.Status.DECLINED
