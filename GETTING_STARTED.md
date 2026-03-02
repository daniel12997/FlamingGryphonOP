# Getting Started

Two paths: **deploying the app** (production or staging) or **running it locally for development**.

---

## Deploying the App

### Prerequisites

- Docker and Docker Compose (recommended), OR Python 3.12+, PostgreSQL 16+, and [uv](https://docs.astral.sh/uv/)
- A domain name with DNS pointed at your server (for production HTTPS)

### 1. Clone the repo

```bash
git clone <repo-url>
cd FlamingGryphonOP
```

### 2. Generate a secret key

```bash
python3 -c "import secrets; print(secrets.token_urlsafe(50))"
```

### 3. Create a `.env` file

```bash
cat > .env <<EOF
SECRET_KEY=paste-your-generated-key-here
DEBUG=False
ALLOWED_HOSTS=your-domain.example.com
POSTGRES_DB=gryphon_op
POSTGRES_USER=gryphon
POSTGRES_PASSWORD=a-strong-database-password
EOF
```

### 4. Pull and start

The pre-built image is published to GitHub Container Registry on every commit to `master`.

```bash
docker compose -f docker-compose.prod.yml pull
docker compose -f docker-compose.prod.yml up -d
```

> Alternatively, if you want to build from source: `docker compose up -d` (uses `docker-compose.yml` which builds locally).

### 5. Create a superuser

Migrations and static file collection run automatically on container start. Just create the superuser:

```bash
docker compose -f docker-compose.prod.yml exec web python manage.py createsuperuser
```

### 6. Configure the site for your group

Log in to `/admin/op/siteconfig/` and fill in:

- **Group name** (short and long form) — appears in the page header and footer
- **Admin contact email**
- **Coronet names** — the current Baron and Baroness (or equivalent)

No code changes are needed to rebrand the site for a different SCA group.

### 7. Load data

**Migrating from the old PHP/MySQL system:**

```bash
# Unzip the SQL dump
unzip gryphony_OP.sql.zip -d legacy_data/

# Import (handles recipients, honors, bestowals, events, recommendations, reports)
docker compose -f docker-compose.prod.yml exec web python manage.py import_legacy_sql legacy_data/gryphony_OP.sql
```

**Starting fresh (no legacy data):**

Use the Django admin at `/admin/` to create:
1. **Groups** — sub-groups within your barony (e.g. Havenholde, Hawkes Keye)
2. **Honors** — awards and orders your barony gives out
3. **Recipients** and **Bestowals** as needed, or use the batch entry at `/bestowals/batch/`

### Updating to a new version

Every push to `master` publishes a new `latest` image. To update your server:

```bash
docker compose -f docker-compose.prod.yml pull
docker compose -f docker-compose.prod.yml up -d
```

Migrations run automatically on startup.

To pin to a specific release instead of `latest`, edit `docker-compose.prod.yml` and change the image tag to a version tag (e.g. `ghcr.io/daniel12997/flaminggryphonop:v1.2.3`).

### 8. Set up a reverse proxy

The app runs on port 8000. Put nginx or Caddy in front for HTTPS termination.

**Minimal Caddy example (`Caddyfile`):**

```
your-domain.example.com {
    reverse_proxy localhost:8000
}
```

**Minimal nginx example:**

```nginx
server {
    listen 80;
    server_name your-domain.example.com;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name your-domain.example.com;
    # ssl_certificate / ssl_certificate_key configured by certbot or similar

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

---

## Local Development Setup

### Prerequisites

- [uv](https://docs.astral.sh/uv/) — Python package manager
- Docker and Docker Compose (for the local Postgres container)

### 1. Clone and install dependencies

```bash
git clone <repo-url>
cd FlamingGryphonOP
uv sync
```

### 2. Start the database

```bash
docker compose up db -d
```

> **Port conflict?** If port 5432 is already in use, stop your local Postgres (`sudo systemctl stop postgresql`) or remap the port in `docker-compose.yml` (change `"5432:5432"` to `"5433:5432"`) and prefix migrate/runserver commands with `POSTGRES_PORT=5433`.

### 3. Migrate and create a superuser

```bash
DEBUG=True uv run python manage.py migrate
DEBUG=True uv run python manage.py createsuperuser
```

> `DEBUG` must be `True` for local dev — it defaults to `False`, which requires a real `SECRET_KEY`.

### 4. Run the dev server

```bash
DEBUG=True uv run python manage.py runserver
```

The app is now at [http://localhost:8000](http://localhost:8000).

Alternatively, `docker compose up` runs the full stack (web + db) with `DEBUG=True` already set.

### 5. Run the tests

```bash
# All tests — uses SQLite in-memory, no Postgres needed
uv run pytest

# Verbose output
uv run pytest -v

# Single file or test
uv run pytest op/tests_courtlist.py
uv run pytest op/tests_courtlist.py::TestPublishCourtList::test_publish_makes_public

# With coverage
uv run coverage run -m pytest && uv run coverage report
```

### 6. Type checking

```bash
uv run mypy accounts/ op/ config/
```

---

## Environment Variables Reference

| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| `SECRET_KEY` | Yes (prod) | dev placeholder | Django secret key |
| `DEBUG` | No | `False` | Set to `True` for local development |
| `ALLOWED_HOSTS` | Yes (prod) | `localhost,127.0.0.1` | Comma-separated hostnames |
| `POSTGRES_DB` | No | `gryphon_op` | Database name |
| `POSTGRES_USER` | No | `gryphon` | Database user |
| `POSTGRES_PASSWORD` | No | `gryphon` | Database password |
| `POSTGRES_HOST` | No | `localhost` | Database host (`db` in Docker) |
| `POSTGRES_PORT` | No | `5432` | Database port |
