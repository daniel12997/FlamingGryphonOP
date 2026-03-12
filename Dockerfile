# ABOUTME: Multistage Dockerfile for the Flaming Gryphon OP Django app.
# ABOUTME: Uses uv for dependency management with a slim production image.

# Stage 1: Build dependencies
FROM python:3.12-slim-bookworm AS builder

COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

WORKDIR /app

COPY pyproject.toml uv.lock ./

RUN uv sync --frozen --no-cache --no-dev

# Stage 2: Runtime
FROM python:3.12-slim-bookworm

COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq5 \
    unzip \
    && rm -rf /var/lib/apt/lists/*

RUN useradd --create-home --shell /bin/bash app

WORKDIR /app

COPY --from=builder /app/.venv /app/.venv

COPY . /app

# Unzip legacy SQL if present so entrypoint can auto-import it
RUN if [ -f /app/gryphony_OP.sql.zip ]; then \
        unzip /app/gryphony_OP.sql.zip -d /tmp && \
        rm /app/gryphony_OP.sql.zip; \
    fi

# Move Midrealm fixture to /tmp so it survives the volume mounts at runtime
RUN if [ -f /app/legacy_data/midrealm_op.json ]; then \
        mv /app/legacy_data/midrealm_op.json /tmp/midrealm_op.json; \
    fi

# Give the app user write access to staticfiles (populated at container start)
RUN mkdir -p /app/staticfiles && chown app:app /app/staticfiles

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER app

ENV PATH="/app/.venv/bin:$PATH"

EXPOSE 8000

ENTRYPOINT ["/entrypoint.sh"]
