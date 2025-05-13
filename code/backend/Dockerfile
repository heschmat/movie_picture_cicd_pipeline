# Stage 1: Build dependencies
FROM public.ecr.aws/docker/library/python:3.10-alpine AS builder

WORKDIR /app

# Install system dependencies needed for building Python packages
RUN apk add --no-cache \
    build-base \
    gcc \
    libffi-dev \
    openssl-dev \
    python3-dev \
    musl-dev \
    linux-headers

# Set up virtualenv properly
RUN python -m venv /venv

# Use the venv's pip directly for installation
ENV PATH="/venv/bin:$PATH"

# Install Python dependencies
COPY Pipfile* ./
RUN pip install pipenv && \
    pipenv requirements > requirements.txt && \
    pip install -r requirements.txt && \
    pip install gunicorn

FROM public.ecr.aws/docker/library/python:3.10-alpine

ENV FLASK_RUN_HOST=0.0.0.0
WORKDIR /app

# Add a non-root user
RUN adduser -u 1000 -D app && \
    apk add --no-cache libffi openssl

# Copy installed dependencies from builder
COPY --from=builder /venv /venv
ENV PATH="/venv/bin:$PATH"

# Copy application code
COPY . .

EXPOSE 5000

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
