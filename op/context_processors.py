# ABOUTME: Template context processors for the op app.
# ABOUTME: Makes SiteConfig available in all templates.

from django.http import HttpRequest

from op.models import SiteConfig


def site_config(request: HttpRequest) -> dict[str, SiteConfig]:
    """Add SiteConfig to the template context for all requests."""
    return {"site_config": SiteConfig.load()}
