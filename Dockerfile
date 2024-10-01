FROM python:3.10-slim


RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates


ADD https://astral.sh/uv/install.sh /uv-installer.sh


RUN sh /uv-installer.sh && rm /uv-installer.sh


ENV PATH="/root/.cargo/bin/:$PATH"

WORKDIR /app

ENV UV_COMPILE_BYTECODE=1

ENV UV_LINK_MODE=copy


RUN --mount=type=cache,target=/root/.cache/uv \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync --frozen --no-install-project --no-dev


COPY . .


RUN uv sync --frozen --no-cache


EXPOSE 8000


CMD ["/app/.venv/bin/python", "manage.py", "runserver", "0.0.0.0:8000"]