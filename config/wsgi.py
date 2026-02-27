# ABOUTME: WSGI entry point for the Flaming Gryphon OP Django app.
# ABOUTME: Used by gunicorn and other WSGI servers in production.

import os

from django.core.wsgi import get_wsgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings')

application = get_wsgi_application()
