# Changelog

All notable changes to the Flaming Gryphon Order of Precedence project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

### Added
- Django project scaffolding with `config/`, `op/`, and `accounts/` apps
- SiteConfig singleton model replacing legacy key-value configuration
- Docker Compose setup with PostgreSQL 16 and Django/gunicorn
- Multistage Dockerfile using uv for dependency management
- Base HTML template with Pico CSS and HTMX
- pytest-django test configuration with SQLite in-memory for tests
- Whitenoise for static file serving
