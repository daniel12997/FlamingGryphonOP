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
- Custom User model with SCA name and admin-approved registration
- Custom auth backend rejecting unapproved users at login
- Registration form creating unapproved users pending admin review
- Login/logout using Django's built-in auth views with custom templates
- Admin pending-user approval view (`/accounts/pending/`)
- Login/Logout links in base template navigation
- Award list page (`/awards/`) grouped by category (Baronial, Champion, External) with recipient counts
- Award detail page (`/awards/<pk>/`) with roll of recipients ordered by date
- Event list page (`/events/`) showing chronological event history, most recent first
- Event detail page (`/events/<pk>/`) showing all bestowals at that event
- Navigation links for Awards and Events in base template
- Authenticated Event CRUD (`/events/new/`, `/events/<pk>/edit/`) with login required
- Authenticated Recipient CRUD (`/people/new/`, `/people/<pk>/edit/`) with inline AlternateName formset
- Fuzzy duplicate detection on recipient creation via HTMX (uses difflib.SequenceMatcher)
- Staff-only Honor CRUD (`/awards/new/`, `/awards/<pk>/edit/`) with UserPassesTestMixin
- Authenticated Bestowal CRUD (`/bestowals/new/`, `/bestowals/<pk>/edit/`) with recipient autocomplete
- HTMX recipient autocomplete endpoint (`/people/autocomplete/`) searching SCA name, mundane name, and alternate names
- HTMX quick-create recipient endpoint (`/people/quick-create/`) for inline creation from bestowal form
- Batch bestowal entry ("Record Court") at `/bestowals/batch/` for recording multiple awards at a single event
- HTMX dynamic row addition for batch bestowal formset
- Pre-fill support on bestowal form via `?recipient=` and `?event=` query parameters
- Edit and "Add Award" links on recipient detail page (authenticated users only)
- Edit and "Add Bestowal" links on event detail page (authenticated users only)
- Edit link on honor detail page (staff only)
- "Record Court" navigation link for authenticated users
- `op/forms.py` with ModelForms for Event, Recipient, Honor, Bestowal, and batch entry formsets
- Shared pytest fixtures for auth clients in root conftest.py
