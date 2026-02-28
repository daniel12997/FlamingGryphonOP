# Flaming Gryphon Order of Precedence

A Django web application for tracking the Order of Precedence (OP) of the Barony of the Flaming Gryphon, a chapter of the Society for Creative Anachronism (SCA) in the Middle Kingdom. Manages members, awards/honors, bestowals, recommendations, error reports, and event history, with data spanning from 1970 to present.

## Table of Contents

- [For Users](#for-users)
- [For Administrators](#for-administrators)
- [For Developers](#for-developers)

---

## For Users

### What This App Does

The Order of Precedence tracks which awards and honors have been given to members of the Barony. You can:

- **Search for people** by SCA name, mundane name, or alternate names
- **Browse awards** — see the full roll of recipients for each baronial honor
- **View event history** — see which awards were given at past events
- **Recommend someone for an award** (requires an account)
- **Report an error** if you spot incorrect data (requires an account)

### Getting an Account

1. Visit the site and click **Register**
2. Fill in your username, email, SCA name, and password
3. Wait for an administrator to approve your account
4. Once approved, you can log in and submit recommendations or error reports

### Submitting a Recommendation

1. Log in and click **Recommend** in the navigation
2. Fill in the nominee's SCA name and any other details you know
3. Select which honor you'd like to recommend them for (only honors that accept recommendations are shown)
4. Write your justification explaining why this person deserves the award
5. Submit — your recommendation goes to the baronial administration for review

### Reporting an Error

1. Log in and click **Report Error** in the navigation
2. Describe what's wrong (wrong date, misspelled name, missing award, etc.)
3. Submit — administrators will investigate and update the status
4. Track your reports under **My Reports**

---

## For Administrators

### Deployment

#### Prerequisites

- Docker and Docker Compose (recommended), OR:
- Python 3.12+, PostgreSQL 16+, and [uv](https://docs.astral.sh/uv/)

#### Docker Deployment

```bash
# Clone the repository
git clone <repo-url> && cd WH_op

# Create a .env file with production values
cat > .env <<EOF
SECRET_KEY=your-long-random-secret-key-here
DEBUG=False
ALLOWED_HOSTS=your-domain.example.com
POSTGRES_DB=gryphon_op
POSTGRES_USER=gryphon
POSTGRES_PASSWORD=a-strong-database-password
EOF

# Build and start
docker compose up -d

# Run migrations
docker compose exec web uv run python manage.py migrate

# Create a superuser
docker compose exec web uv run python manage.py createsuperuser

# Import legacy data (if migrating from the old PHP system)
docker compose exec web uv run python manage.py import_legacy_sql legacy_data/gryphony_OP.sql
```

The app runs on port 8000 by default. Put a reverse proxy (nginx, caddy) in front for HTTPS.

#### Environment Variables

| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| `SECRET_KEY` | Yes (prod) | dev placeholder | Django secret key |
| `DEBUG` | No | `True` | Set to `False` in production |
| `ALLOWED_HOSTS` | Yes (prod) | `localhost,127.0.0.1` | Comma-separated hostnames |
| `POSTGRES_DB` | No | `gryphon_op` | Database name |
| `POSTGRES_USER` | No | `gryphon` | Database user |
| `POSTGRES_PASSWORD` | No | `gryphon` | Database password |
| `POSTGRES_HOST` | No | `localhost` | Database host (`db` in Docker) |
| `POSTGRES_PORT` | No | `5432` | Database port |

#### Importing Legacy Data

If migrating from the old PHP/MySQL system:

```bash
# Unzip the SQL dump
unzip gryphony_OP.sql.zip -d legacy_data/

# Run the import
uv run python manage.py import_legacy_sql legacy_data/gryphony_OP.sql
```

The import handles:
- Groups, honors, recipients, alternate names, events, bestowals
- Honor images (extracted from BLOBs to files)
- Site configuration
- Recommendations (with spam filtering and HTML entity decoding)
- Error reports (with status mapping)
- External/Kingdom honors (created as placeholders from bestowal references)

Dirty data (null rows, zero-key references, empty names) is skipped with warnings.

### Administration

#### Django Admin

Visit `/admin/` to access the Django admin interface. From here you can directly edit any record.

#### Approving User Registrations

Visit `/accounts/admin/pending/` to see users awaiting approval. Click Approve to grant access.

#### Managing Recommendations

Visit `/recommendations/` (staff only) to:
- Filter by status (Pending, Scheduled, Given, Declined)
- View full recommendation details and justification
- Schedule a recommendation for a future event
- Mark as given or decline

#### Managing Reports

Visit `/reports/` (staff only) to:
- Filter by status (New, Open, Pending, Resolved, Closed)
- View report details and add resolutions
- Update status as you work through corrections

#### Court List Planning

Visit `/court-list/` (staff only) to plan awards for upcoming events:

1. Select a future event (or create one first)
2. Add draft bestowals — these are invisible to the public
3. Optionally reorder the list
4. Use the **Print View** for a paper copy at the event
5. **Publish** when ready — this makes all awards public and marks linked recommendations as "Given"

#### Recording Awards After an Event

Visit `/bestowals/batch/` (Record Court) to enter multiple awards from a single event at once. Select or create an event, set the date, and add recipient/honor rows.

#### Site Configuration

Edit the site-wide group name, admin contact info, and coronet names via Django admin under **Site Configuration**, or at `/admin/op/siteconfig/`. These values appear in page headers and footers — no code changes needed to rebrand for a different group.

---

## For Developers

### Tech Stack

- **Python 3.12+** managed with **uv**
- **Django 5+** with django-htmx, django-filter, whitenoise
- **PostgreSQL 16** (SQLite in-memory for tests)
- **Docker Compose** for local development
- **HTMX** for interactive UI (live search, autocomplete, dynamic form rows)
- **Pico CSS** classless framework for styling
- **pytest** + pytest-django for testing

### Project Layout

```
WH_op/
├── config/              # Django project settings, URLs, WSGI/ASGI
│   ├── settings.py      # Main settings (env-var driven)
│   ├── settings_test.py # Test overrides (SQLite, fast hashing)
│   └── urls.py          # Root URL configuration
├── accounts/            # Auth app: custom User model, registration, approval
│   ├── models.py        # User with sca_name, is_approved fields
│   ├── backends.py      # ApprovedUserBackend (rejects unapproved users)
│   └── views.py         # Register, pending approval list
├── op/                  # Core OP app
│   ├── models.py        # All domain models (see below)
│   ├── views.py         # Public + authenticated views
│   ├── forms.py         # ModelForms, formsets, status forms
│   ├── urls.py          # URL patterns (namespaced as "op")
│   ├── admin.py         # Django admin registrations
│   ├── context_processors.py  # SiteConfig context processor
│   └── management/commands/
│       └── import_legacy_sql.py  # Legacy MySQL import
├── templates/           # All HTML templates
│   ├── base.html        # Site-wide layout with Pico CSS + HTMX
│   └── op/              # App templates + partials
├── conftest.py          # Shared pytest fixtures (single source of truth)
└── pyproject.toml       # Dependencies and pytest config
```

### Data Models

| Model | Description |
|-------|-------------|
| `SiteConfig` | Singleton site configuration (group name, admin info, coronet) |
| `Group` | Sub-groups within the barony (Havenholde, Hawkes Keye, etc.) |
| `Recipient` | A person in the OP (SCA name, mundane name, registration status) |
| `AlternateName` | Nicknames and former names for a recipient |
| `Honor` | An award, order, or champion position (with category: baronial/champion/external) |
| `HonorImage` | Badge image for an honor |
| `Event` | A calendar event where bestowals happen |
| `Bestowal` | A specific honor granted to a recipient (the core M2M through table) |
| `Recommendation` | An award recommendation with status workflow |
| `Report` | An error/correction report with status workflow |

### Local Development Setup

```bash
# Install dependencies
uv sync

# Start PostgreSQL (via Docker or local install)
docker compose up db -d

# Run migrations
uv run python manage.py migrate

# Create a superuser
uv run python manage.py createsuperuser

# Run the dev server
uv run python manage.py runserver

# Or use Docker for everything
docker compose up
```

### Running Tests

```bash
# Run all tests (uses SQLite in-memory, no Postgres needed)
uv run pytest

# Run with verbose output
uv run pytest -v

# Run a specific test file
uv run pytest op/tests_courtlist.py

# Run a specific test class or method
uv run pytest op/tests_courtlist.py::TestPublishCourtList::test_publish_makes_public

# Run with coverage
uv run coverage run -m pytest && uv run coverage report
```

Tests use `config.settings_test` which swaps PostgreSQL for SQLite in-memory and uses MD5 password hashing for speed.

### Test Fixtures

All shared test data is defined in `conftest.py` at the project root. This is the single source of truth for test fixtures — test files should use these rather than creating their own duplicates.

Key fixtures:
- `approved_user` / `admin_user` — authenticated users
- `auth_client` / `admin_client` — pre-logged-in test clients
- `sample_honor` — baronial honor (Flaming Brand, accepts recommendations)
- `champion_honor` / `external_honor` / `inactive_honor` — other honor types
- `sample_recipient` — a recipient with full registration data
- `sample_altname` — alternate name linked to sample_recipient
- `sample_bestowal` — a bestowal linking sample_recipient and sample_honor
- `sample_event` / `future_event` — past and future events
- `sample_report` — an error report

Test files may define local fixtures for test-specific scenarios (e.g., a `draft_bestowal` in court list tests), but canonical model data lives in conftest.

### Adding a New Model

1. Define the model in `op/models.py`
2. Add a shared fixture in `conftest.py`
3. Register it in `op/admin.py`
4. Create a migration: `uv run python manage.py makemigrations op`
5. Write tests first (TDD), then implement views/forms/templates
6. Add URL patterns in `op/urls.py`

### Adding a New View

1. Write failing tests in the appropriate `op/tests_*.py` file
2. Add the view class or function in `op/views.py`
3. Create a form in `op/forms.py` if needed
4. Add the URL pattern in `op/urls.py`
5. Create the template in `templates/op/`
6. Run tests to confirm everything passes

### Multi-Group Support

The app is designed to work for any SCA group, not just Flaming Gryphon:

- All group-specific text comes from `SiteConfig` (editable via Django admin)
- Templates use `{{ site_config.group_name_short }}` — no hardcoded group names
- Honors, groups, and events are all data-driven
- To set up for a new group: update SiteConfig, import your own data

### Key URLs

| URL | Access | Description |
|-----|--------|-------------|
| `/` | Public | Home page with recent bestowals |
| `/people/` | Public | Person search |
| `/people/<pk>/` | Public | Person detail with bestowal history |
| `/awards/` | Public | Honor list grouped by category |
| `/awards/<pk>/` | Public | Honor roll of recipients |
| `/events/` | Public | Event list |
| `/events/<pk>/` | Public | Event detail with bestowals |
| `/recommendations/new/` | Login | Submit a recommendation |
| `/recommendations/` | Staff | Manage recommendations |
| `/reports/new/` | Login | Submit an error report |
| `/reports/` | Staff | Manage reports |
| `/reports/mine/` | Login | View your own reports |
| `/bestowals/batch/` | Login | Record Court (batch entry) |
| `/court-list/` | Staff | Court list planning |
| `/accounts/register/` | Public | Account registration |
| `/accounts/login/` | Public | Login |
| `/admin/` | Superuser | Django admin interface |
