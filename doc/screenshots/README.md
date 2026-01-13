This folder contains screenshots captured from the app for design review.

How the script works

- Run: `bin/rails runner script/capture_screenshots.rb` or `bin/rails screenshots:capture`
- Desktop screenshots for admin pages are saved under `doc/screenshots/desktop/`
- Mobile screenshots for public pages are saved under `doc/screenshots/mobile/`
- A `doc/screenshots/manifest.json` is produced listing all captured paths and files.

Requirements

- Chrome and ChromeDriver installed (matching versions). Selenium/Capybara is used.
- Ruby + Rails environment available. Run in development environment with dev DB seeded or allow the script to create sample records.

Admin login

- The script uses `SCREENSHOT_ADMIN_EMAIL` and `SCREENSHOT_ADMIN_PASSWORD` environment variables if set, otherwise defaults to `admin@local.test` / `password`. If the admin user does not exist, the script will create one with that credential.

Notes about fallbacks:

- If Selenium/Chrome is not available or saving screenshots fails, the script will save an HTML snapshot for each route under `doc/screenshots/mobile/` or `doc/screenshots/desktop/` with the same base filename and `.html` extension. These HTML files are useful for design review if PNG generation does not work in your environment.

Notes

- The script attempts to substitute `:id` route segments with existing records when possible (e.g., `CommunityIdea`). If it cannot determine a sample record for a dynamic route, that route may be skipped.
- The script tries to login via `GET /admin/login` for admin pages; if your app uses custom admin auth, you may need to adjust the script.
