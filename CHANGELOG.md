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
- Core domain models: Recipient, AlternateName, Honor, HonorImage, Event, Bestowal, Group
- Optional group FK on Recipient (null for legacy data, populated going forward)
- Honor model with legacy_key field for cross-referencing external Kingdom awards
- Django admin registration for all models with search, filters, and inlines
