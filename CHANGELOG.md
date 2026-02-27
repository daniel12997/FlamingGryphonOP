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
- Legacy SQL import management command (`import_legacy_sql`) for phpMyAdmin dump files
- SQL INSERT parser handling quoted strings, NULL, escaped quotes, and hex BLOBs
- HTML entity decoding and MySQL escape normalization for legacy text data
- Category mapping: BAR->BARONIAL, FGCH->CHAMPION, bfg->BARONIAL
- Automatic creation of external Honor placeholders for Kingdom-level awards
- HonorImage hex BLOB extraction to media files during import
- SiteConfig population from legacy op_configuration table
- Dirty data handling: skips null rows, zero keys, empty altnames, missing recipients
- Public home page with quick search box and recent bestowals table
- Person search page (`/people/`) with search by SCA name, mundane name, and alternate names
- HTMX live search with 300ms debounce on person list
- Person detail page (`/people/<pk>/`) showing bestowals, alternate names, and registration info
- Navigation links (Home, People) in base template
- Pagination on person list (25 per page)
