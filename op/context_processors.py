# ABOUTME: Template context processors for the op app.
# ABOUTME: Makes SiteConfig available in all templates.

from op.models import SiteConfig


def site_config(request):
    """Add SiteConfig to the template context for all requests."""
    return {"site_config": SiteConfig.load()}
