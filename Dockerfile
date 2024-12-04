### Frontend build

FROM node:16-alpine AS frontend-builder

COPY ./frontend /app/frontend

WORKDIR /app/frontend

RUN npm install
RUN npm run build --prod

### Backend build

FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim AS backend-builder

ENV UV_COMPILE_BYTECODE=1 UV_LINK_MODE=copy

COPY ./backend /app

WORKDIR /app

RUN ls .

RUN uv sync

RUN ls .

### Final image

FROM python:3.12-slim-bookworm

COPY --from=frontend-builder /app/backend/wwwroot/js /app/wwwroot/js
COPY --from=backend-builder --chown=app:app /app /app

ENV PATH="/app/.venv/bin:$PATH"

WORKDIR /app

CMD ["waitress-serve", "--host", "0.0.0.0", "app:app"]