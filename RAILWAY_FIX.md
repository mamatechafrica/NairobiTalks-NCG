# Fly.io Deployment Guide

This repository is prepared for deployment to Fly.io. Replace `your-app-name` with the app name you create with `flyctl`.

## Quick steps

1. Install Fly CLI: `curl -L https://fly.io/install.sh | sh` (or follow https://fly.io/docs/getting-started/installing/)
2. Authenticate: `flyctl auth login`
3. Create or choose an app: `flyctl launch --name your-app-name` (or run `flyctl apps create your-app-name`)
4. Set required secrets (at minimum):

```bash
flyctl secrets set RAILS_MASTER_KEY=$(cat config/master.key) DATABASE_URL="your_postgres_connection_string"
```

5. Deploy:

```bash
flyctl deploy
```

## Notes & tips

- This project contains a Dockerfile and a `Procfile` — Fly will use the Dockerfile by default if present.
- Ensure `config/puma.rb` binds to the port Fly provides (Fly sets `$PORT`). The default config in this repo is compatible.
- For a managed Postgres database, use `flyctl postgres create` and then attach it to the app, or provide an external `DATABASE_URL`.

## Local production test

To test the app locally in production mode with the port Fly will expect:

```bash
RAILS_ENV=production PORT=8080 bundle exec puma -C config/puma.rb
```

## Cleanup

The previous deployment guide has been replaced. If you need other service-specific steps later, create a separate document.