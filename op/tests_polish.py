# ABOUTME: Tests for UI polish, context processor, and multi-group configuration.
# ABOUTME: Verifies SiteConfig context processor and template consistency.

import pytest
from django.test import Client, override_settings

from op.models import SiteConfig


@pytest.mark.django_db
class TestSiteConfigContextProcessor:
    def test_site_config_in_context(self):
        SiteConfig.objects.create(
            pk=1,
            group_name_short="Flaming Gryphon",
            group_name_long="The Barony of the Flaming Gryphon",
        )
        client = Client()
        response = client.get("/")
        assert response.status_code == 200
        assert "site_config" in response.context

    def test_site_config_values_in_template(self):
        SiteConfig.objects.create(
            pk=1,
            group_name_short="Test Group",
            group_name_long="The Barony of Test Group",
        )
        client = Client()
        response = client.get("/")
        content = response.content.decode()
        assert "Test Group" in content

    def test_creates_default_if_missing(self):
        client = Client()
        response = client.get("/")
        assert response.status_code == 200
        # Context processor creates a default SiteConfig
        assert "site_config" in response.context


@pytest.mark.django_db
class TestTemplateNoHardcodedGroupNames:
    """Verify that templates use site_config for group-specific text."""

    def test_base_template_uses_config(self):
        SiteConfig.objects.create(
            pk=1,
            group_name_short="Test Barony",
            group_name_long="The Barony of Test",
        )
        client = Client()
        response = client.get("/")
        content = response.content.decode()
        # The base template should display the group name from config
        assert "Test Barony" in content


@pytest.mark.django_db
class TestNavigationLinks:
    def test_nav_contains_core_links(self):
        client = Client()
        response = client.get("/")
        content = response.content.decode()
        assert "/people/" in content
        assert "/awards/" in content
        assert "/events/" in content

    def test_nav_shows_login_for_anonymous(self):
        client = Client()
        response = client.get("/")
        content = response.content.decode()
        assert "/accounts/login/" in content

    def test_nav_shows_logout_for_authenticated(self, auth_client):
        response = auth_client.get("/")
        content = response.content.decode()
        assert "/accounts/logout/" in content

    def test_nav_shows_admin_links_for_staff(self, admin_client):
        response = admin_client.get("/")
        content = response.content.decode()
        assert "/recommendations/" in content
        assert "/reports/" in content
        assert "/court-list/" in content
