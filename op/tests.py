# ABOUTME: Tests for the op (Order of Precedence) app.
# ABOUTME: Covers models, views, and import commands.

import pytest
from django.test import Client

from op.models import SiteConfig


@pytest.mark.django_db
class TestIndexView:
    def test_index_returns_200(self):
        client = Client()
        response = client.get("/")
        assert response.status_code == 200

    def test_index_contains_welcome_text(self):
        client = Client()
        response = client.get("/")
        assert b"Order of Precedence" in response.content


@pytest.mark.django_db
class TestSiteConfig:
    def test_load_creates_default(self):
        config = SiteConfig.load()
        assert config.pk == 1
        assert config.group_name_short == "Flaming Gryphon"

    def test_singleton_enforced(self):
        config1 = SiteConfig(group_name_short="Test1", group_name_long="Test One")
        config1.save()
        config2 = SiteConfig(group_name_short="Test2", group_name_long="Test Two")
        config2.save()
        # Second save overwrites pk=1
        assert SiteConfig.objects.count() == 1
        assert SiteConfig.objects.get(pk=1).group_name_short == "Test2"

    def test_str(self):
        config = SiteConfig.load()
        assert str(config) == "Site Config: Flaming Gryphon"
