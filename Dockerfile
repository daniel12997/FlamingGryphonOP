# ABOUTME: Multistage Dockerfile for the Flaming Gryphon OP Django app.
# ABOUTME: Uses uv for dependency management with a slim production image.

# Stage 1: Build dependencies
FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim AS builder

WORKDIR /app

COPY pyproject.toml uv.lock ./

RUN uv sync --frozen --no-cache --no-dev

# Stage 2: Runtime
FROM python:3.12-slim-bookworm

COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq5 \
    && rm -rf /var/lib/apt/lists/*

RUN useradd --create-home --shell /bin/bash app

WORKDIR /app

COPY --from=builder /app/.venv /app/.venv

COPY . /app

# SECRET_KEY is required by settings even for collectstatic; use a build-time
# placeholder that is never persisted as an ENV var in the final image.
RUN SECRET_KEY=build-time-placeholder uv run python manage.py collectstatic --noinput

USER app

ENV PATH="/app/.venv/bin:$PATH"

EXPOSE 8000

CMD ["gunicorn", "config.wsgi:application", "--bind", "0.0.0.0:8000"]
