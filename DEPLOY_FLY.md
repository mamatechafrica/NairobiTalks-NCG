# Deploying to Fly.io 🚀

This project includes a production-ready `Dockerfile`. The steps below walk through creating a Fly app, provisioning a Postgres DB, configuring secrets, and deploying.

## Prerequisites

- Install flyctl: https://fly.io/docs/hands-on/install-flyctl/
- Be logged in: `flyctl auth login`
- Have `git` and Docker installed locally

## Quick deploy steps

1. Create an app (replace `<app-name>`):

   flyctl apps create <app-name>

2. Provision Postgres and attach it to your app (recommended):

   # create a postgres instance
   flyctl postgres create --name <your-db-name> --region <region>

   # attach the postgres instance to your app
   flyctl postgres attach --postgres-app <your-db-name> --app <app-name>

   This will configure `DATABASE_URL` for your app.

3. Set required secrets (examples):

   # get SECRET_KEY_BASE locally
   SECRET_KEY_BASE=$(bin/rails secret)

   # set secrets on fly
   flyctl secrets set RAILS_MASTER_KEY="$(cat config/master.key)" SECRET_KEY_BASE="$SECRET_KEY_BASE" RAILS_ENV=production

   Note: If you don't have `config/master.key`, create/edit credentials locally via `bin/rails credentials:edit` and then copy the generated key.

4. (Optional) Configure persistent uploads:

   - Use S3 (recommended): set AWS credentials in Rails credentials and set `RAILS_MASTER_KEY` on Fly.
   - Or create a Fly volume and mount it in `fly.toml`:

     flyctl volumes create uploads --size 1 --region <region>

     Then add to `fly.toml`:

     [[mounts]]
       source = "uploads"
       destination = "/rails/storage"

5. Deploy:

   flyctl deploy

   On deploy the `release_command` in `fly.toml` runs `bin/rails db:migrate`.

6. Run one-off tasks (if needed):

   # run a console
   flyctl ssh console -a <app-name>

   # run a one-off migration (if you prefer):
   flyctl ssh console -a <app-name> -- bin/rails db:migrate

## Common env vars to set

- `RAILS_MASTER_KEY` — Rails credentials master key
- `SECRET_KEY_BASE` — Rails secret (use `bin/rails secret` to generate)
- `RAILS_ENV=production`
- Any SMTP / S3 / third-party credentials used by your app

## Troubleshooting

- Logs: `flyctl logs -a <app-name>`
- Interactive shell: `flyctl ssh console -a <app-name>`

---

If you'd like, I can:

- Add a Fly volume mount to `fly.toml` (if you plan to use local disk storage)
- Add a README section linking to `DEPLOY_FLY.md`
- Help run a dry deploy (you will need to run `flyctl` locally and provide credentials)
