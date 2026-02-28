# ABOUTME: Tests for the error/correction reporting system.
# ABOUTME: Covers report submission, admin management, status transitions, and user's own reports.

import pytest
from django.urls import reverse

from op.models import Report


@pytest.mark.django_db
class TestReportModel:
    def test_create(self, approved_user):
        report = Report.objects.create(
            reporter=approved_user,
            subject="Wrong date on bestowal",
            description="The date for Flaming Brand should be 2018, not 2019.",
        )
        assert report.reporter == approved_user
        assert report.status == Report.Status.NEW
        assert report.created_date is not None
        assert report.last_updated is not None

    def test_str(self, approved_user):
        report = Report.objects.create(
            reporter=approved_user,
            subject="Wrong date",
            description="Details.",
        )
        assert "Wrong date" in str(report)

    def test_status_choices(self):
        assert Report.Status.NEW == "NEW"
        assert Report.Status.OPEN == "OPEN"
        assert Report.Status.PENDING == "PENDING"
        assert Report.Status.RESOLVED == "RESOLVED"
        assert Report.Status.CLOSED_NO_RESOLUTION == "CLOSED_NO_RESOLUTION"

    def test_legacy_fields(self, approved_user):
        report = Report.objects.create(
            reporter=approved_user,
            subject="Old report",
            description="From legacy system.",
            legacy_reporter_sca_name="Lord Historical",
            legacy_reporter_email="old@example.com",
        )
        assert report.legacy_reporter_sca_name == "Lord Historical"
        assert report.legacy_reporter_email == "old@example.com"


@pytest.mark.django_db
class TestReportCreate:
    def test_create_requires_login(self, client):
        response = client.get(reverse("op:report_create"))
        assert response.status_code == 302
        assert "/accounts/login/" in response.url

    def test_create_form_renders(self, auth_client):
        response = auth_client.get(reverse("op:report_create"))
        assert response.status_code == 200
        content = response.content.decode()
        assert "subject" in content

    def test_create_success(self, auth_client, approved_user):
        response = auth_client.post(
            reverse("op:report_create"),
            {
                "subject": "Misspelled name",
                "description": "The name Bearengaer is spelled wrong.",
            },
        )
        assert response.status_code == 302
        report = Report.objects.get(subject="Misspelled name")
        assert report.reporter == approved_user
        assert report.status == Report.Status.NEW

    def test_create_shows_success_message(self, auth_client):
        response = auth_client.post(
            reverse("op:report_create"),
            {
                "subject": "Test report",
                "description": "Test description.",
            },
            follow=True,
        )
        content = response.content.decode()
        assert "submitted" in content.lower() or "created" in content.lower()


@pytest.mark.django_db
class TestReportList:
    def test_list_requires_staff(self, auth_client):
        response = auth_client.get(reverse("op:report_list"))
        assert response.status_code == 403

    def test_list_renders_for_admin(self, admin_client):
        response = admin_client.get(reverse("op:report_list"))
        assert response.status_code == 200

    def test_list_shows_reports(self, admin_client, approved_user):
        Report.objects.create(
            reporter=approved_user,
            subject="Listed Report",
            description="Test.",
        )
        response = admin_client.get(reverse("op:report_list"))
        content = response.content.decode()
        assert "Listed Report" in content

    def test_list_filter_by_status(self, admin_client, approved_user):
        Report.objects.create(
            reporter=approved_user,
            subject="New One",
            description="Test.",
            status=Report.Status.NEW,
        )
        Report.objects.create(
            reporter=approved_user,
            subject="Resolved One",
            description="Test.",
            status=Report.Status.RESOLVED,
        )
        response = admin_client.get(
            reverse("op:report_list"), {"status": "NEW"}
        )
        content = response.content.decode()
        assert "New One" in content
        assert "Resolved One" not in content


@pytest.mark.django_db
class TestReportDetail:
    @pytest.fixture
    def report(self, approved_user):
        return Report.objects.create(
            reporter=approved_user,
            subject="Detail Report",
            description="Something is wrong.",
        )

    def test_detail_requires_staff(self, auth_client, report):
        response = auth_client.get(
            reverse("op:report_detail", args=[report.pk])
        )
        assert response.status_code == 403

    def test_detail_renders_for_admin(self, admin_client, report):
        response = admin_client.get(
            reverse("op:report_detail", args=[report.pk])
        )
        assert response.status_code == 200
        content = response.content.decode()
        assert "Detail Report" in content
        assert "Something is wrong" in content

    def test_update_status(self, admin_client, report):
        response = admin_client.post(
            reverse("op:report_update_status", args=[report.pk]),
            {"status": "RESOLVED", "resolution": "Fixed the date."},
        )
        assert response.status_code == 302
        report.refresh_from_db()
        assert report.status == Report.Status.RESOLVED
        assert report.resolution == "Fixed the date."

    def test_closed_no_resolution(self, admin_client, report):
        response = admin_client.post(
            reverse("op:report_update_status", args=[report.pk]),
            {"status": "CLOSED_NO_RESOLUTION", "resolution": ""},
        )
        assert response.status_code == 302
        report.refresh_from_db()
        assert report.status == Report.Status.CLOSED_NO_RESOLUTION


@pytest.mark.django_db
class TestMyReports:
    def test_my_reports_requires_login(self, client):
        response = client.get(reverse("op:my_reports"))
        assert response.status_code == 302
        assert "/accounts/login/" in response.url

    def test_my_reports_shows_own_reports(self, auth_client, approved_user):
        Report.objects.create(
            reporter=approved_user,
            subject="My Report",
            description="I found a problem.",
        )
        response = auth_client.get(reverse("op:my_reports"))
        assert response.status_code == 200
        content = response.content.decode()
        assert "My Report" in content

    def test_my_reports_hides_other_reports(self, auth_client, admin_user):
        Report.objects.create(
            reporter=admin_user,
            subject="Admin Report",
            description="Admin found a problem.",
        )
        response = auth_client.get(reverse("op:my_reports"))
        content = response.content.decode()
        assert "Admin Report" not in content
