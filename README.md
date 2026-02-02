## ♿ Non-Discrimination & Accessibility

NairobiTalks is committed to providing an inclusive and accessible platform for all users.

- We do not discriminate on the basis of race, ethnicity, gender, age, religion, disability, sexual orientation, or any other protected characteristic.
- The platform is designed to meet accessibility standards (WCAG 2.1) and is regularly tested for usability by people of diverse backgrounds and abilities.
- We welcome feedback to further improve accessibility and inclusivity.


<p align="center">
   <img width="180" height="130" alt="NairobiTalksLogo" src="https://github.com/user-attachments/assets/7fafa469-97fb-4709-9491-29f73c2b4a7a" />
</p>

# NairobiTalks

A comprehensive Rails application for managing citizen submissions and community engagement in Nairobi, Kenya. This platform enables citizens to submit feedback, ideas, and concerns while providing administrators with powerful tools to manage, filter, and respond to submissions effectively.

## 🌍 SDG Relevance

NairobiTalks directly supports the following United Nations Sustainable Development Goals (SDGs):

- **SDG 16: Peace, Justice and Strong Institutions** — By enabling transparent citizen engagement, participatory governance, and accountability in local government.
- **SDG 11: Sustainable Cities and Communities** — By empowering residents to contribute ideas and feedback for more inclusive, safe, resilient, and sustainable urban development.


## 📐 Standards & Best Practices

NairobiTalks adheres to the following standards and best practices:

- **Accessibility:** Follows WCAG 2.1 guidelines for accessible web content and inclusive participation.
- **Interoperability:** Uses open standards (RESTful APIs, JSON) for data exchange and integration.
- **Security:** Implements secure authentication, encrypted data storage, and regular vulnerability checks.
- **Data Protection:** Complies with data minimization and user privacy principles.
- **Open Source:** Licensed under MIT, with transparent governance and contribution processes.
- **User-Centered Design:** Prioritizes usability, mobile responsiveness, and clear communication.
- **UI Consistency:** All dashboard cards now use a unified max-width and centered layout for improved readability and accessibility.
- **Bootstrap 5 Best Practices:** Views have been refactored to follow Bootstrap 5 conventions, with improved color contrast and ARIA labeling.
- **No Duplicate Content:** Dashboard sections are streamlined to avoid repetition and enhance user experience.

## 🌟 Features

### Citizen Features

- Submit community ideas, planning documents, and feedback via easy forms
- Track submission status on personal dashboard
- Comment on ideas and participate in discussions
- Vote (upvote/downvote) on ideas with clear tick/X buttons
- View idea details and community engagement

### Administrator Features

- Admin dashboard for managing submissions, users, and planning documents
- Forum management: schedule, moderate, and analyze civic engagement forums (online meetups, text-based discussions)
- Broadcast center: create, send, and track public announcements to citizens
- Filter submissions by status, type, and date
- Perform bulk actions (approve, reject, flag) on multiple submissions
- Update and display submission statuses with visual indicators
- Access analytics and charts for platform activity

### General Platform Features

- Responsive design for desktop and mobile
- Secure authentication for citizens and admins
- Real-time updates for status and voting

## 🛠 Technology Stack

- **Backend**: Ruby on Rails 8.1.1
- **Frontend**: Bootstrap 5, Turbo/Stimulus
- **Database**: SQLite (development), PostgreSQL (production)
- **Authentication**: Devise
- **File Storage**: Active Storage
- **AI Integration**: OpenAI API for content analysis
- **Deployment**: Ready for Kamal deployment

## 🚀 Quick Start

### Prerequisites

- Ruby 3.2.0 or higher
- Rails 8.1.1
- Node.js and Yarn
- PostgreSQL (for production)

### Installation & Setup

1. **Clone the repository**

   ```bash
   git clone https://github.com/mamatechafrica/NairobiTalks-NCG.git
   cd NairobiTalks-NCG
   ```

2. **Install dependencies**

   ```bash
   bundle install
   yarn install
   ```

3. **Database setup**

   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. **Environment configuration**

   ```bash
   cp config/credentials.yml.enc.example config/credentials.yml.enc
   # Edit credentials as needed
   ```

5. **Start the application**

   ```bash
   rails server
   ```

Visit [http://localhost:3000](http://localhost:3000) to access the application.

## 👤 User Accounts & Roles

### Pre-configured Test Accounts

The application comes with two pre-configured test accounts for demonstration and testing:

#### 🛡️ Administrator Account
- **Email**: `admin@nairobi.gov`
- **Password**: `admin123`
- **Role**: System Administrator
- **Access**: Full admin control panel

**Administrator Capabilities:**
- ✅ Access admin dashboard (`/admin`)
- ✅ Manage all user accounts (view, edit, delete, promote/demote)
- ✅ Moderate community ideas (approve, reject, edit)
- ✅ Manage citizen submissions
- ✅ Create and manage planning documents
- ✅ Send broadcasts to citizens
- ✅ View analytics and platform statistics
- ✅ Enable two-factor authentication (2FA)
- ✅ Complete audit trail of all admin actions

#### 👨‍💼 Citizen/Resident Account
- **Email**: `resident@nairobi.gov`
- **Password**: `resident123`
- **Role**: Registered Citizen
- **Access**: Standard citizen features

**Citizen Capabilities:**
- ✅ Submit community ideas and feedback
- ✅ Vote on ideas (upvote/downvote)
- ✅ Comment on community discussions
- ✅ View personal dashboard (`/profile`)
- ✅ Track own submissions and activity
- ✅ Edit personal profile information
- ✅ View platform content and announcements

### Role-based Access Control

| Feature | Admin | Citizen |
|----------|--------|---------|
| Admin Dashboard | ✅ | ❌ |
| User Management | ✅ | ❌ |
| Content Moderation | ✅ | ❌ |
| View Own Content | ✅ | ✅ |
| Edit Own Content | ✅ | ✅ |
| Submit Ideas | ✅ | ✅ |
| Vote & Comment | ✅ | ✅ |
| Broadcast Messages | ✅ | ❌ |
| View Analytics | ✅ | Limited |
| 2FA Setup | ✅ | ❌ |

### Security Features

- **Session Timeout**: 30 minutes of inactivity
- **Admin Logging**: All admin actions are automatically logged with IP address and user agent
- **Two-Factor Authentication**: Available for admin accounts
- **Authorization**: Role-based access control using Pundit policies
- **Audit Trail**: Complete audit history of administrative actions

### Getting Started

1. **Login** at `/users/sign_in` with either test account
2. **Admin users**: Navigate to `/admin` for management interface
3. **Citizen users**: Visit `/profile` for personal dashboard
4. **Public access**: Browse community content from homepage

For detailed testing scenarios, see [TEST_USERS.md](TEST_USERS.md).

## ☁️ Kamal + Google Cloud Deployment

This project ships with a `kamal.yml` manifest tuned for Google Cloud (see the repo root). Kamal will build the Docker image defined in `Dockerfile`, wire environment variables, and deploy to Cloud Run (or GKE) with minimal ceremony.

1. **Install the CLI tools**

   ```bash
   curl -sSL https://github.com/rails/kamal/releases/latest/download/kamal-linux-amd64 -o /usr/local/bin/kamal
   chmod +x /usr/local/bin/kamal
   gcloud auth login && gcloud config set project YOUR_GCP_PROJECT_ID
   ```

2. **Provision Google Cloud resources**

   - Enable Cloud Run (or App Engine) and, if needed, set up Cloud SQL for PostgreSQL.
   - Store secrets such as `DATABASE_URL`, `SECRET_KEY_BASE`, and third-party API keys in Secret Manager and grant the Kamal service account access.

3. **Customize Kamal configuration (optional)**

   - Update `kamal.yml` to change memory, instance class, or run command.
   - Use `kamal secrets set` or the GCP console to inject `RAILS_ENV=production`, `PORT`, and any runtime values.

4. **Deploy to GCP**

   ```bash
   kamal deploy --platform gcp --region us-central1 --config kamal.yml
   ```

5. **Run database tasks**

   ```bash
   kamal run -- bundle exec rails db:migrate
   kamal run -- bundle exec rails db:seed
   ```

6. **Monitor the running service**

   - Tail logs via `kamal logs --platform gcp --service web`.
   - Update secrets with `kamal secrets set` as values rotate.

### Sample Kamal secrets commands

Use these commands as a template and replace the placeholder values with your project-specific secrets:

```bash
kamal secrets set --platform gcp --service web DATABASE_URL="postgresql://USER:PASSWORD@HOST:5432/DB_NAME"
kamal secrets set --platform gcp --service web SECRET_KEY_BASE="$(bundle exec rails secret)"
kamal secrets set --platform gcp --service web OPENAI_API_KEY="sk-..."
kamal secrets set --platform gcp --service web RAILS_MASTER_KEY="your-master-key"
```

Rerun these commands whenever a secret rotates, then redeploy so the new values take effect.

### Deployment helper script

Run the bundled `scripts/kamal_deploy.sh` helper (make it executable the first time with `chmod +x scripts/kamal_deploy.sh`) to run Kamal deploy plus migrations/seeds in one go:

```bash
bash scripts/kamal_deploy.sh
```

The script defaults to `--platform gcp --region us-central1` but you can override `KAMAL_ARGS` inside the script before running it. Because `config/puma.rb` already binds to `0.0.0.0` on the injected `PORT`, the Kamal-deployed service can safely sit behind Cloud Run’s load balancer without extra tweaks.

## 🗂️ Project Structure & Architecture

The application is organized into three main modules:

- **Admin Module** (`admin` branch): Administrative interface for managing submissions, users, and broadcasts
- **Public Module** (`main` branch): Public-facing citizen submission forms and engagement
- **API Module** (`api` branch): RESTful API for external integrations

Key directories:

- `app/controllers/` — Rails controllers for business logic
- `app/models/` — Data models and associations
- `app/views/` — User interface templates
- `app/assets/` — Stylesheets, images, and JavaScript
- `config/` — Application configuration and routes
- `db/` — Database schema and seeds

## 🔧 Development

### Running Tests

```bash
rails test
```

### Code Quality

```bash
rubocop
brakeman
```

### Database Management

```bash
rails db:migrate
rails db:rollback
```

## 🤝 Contributing

We welcome contributions from everyone! To contribute:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

Please read our [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) and [GOVERNANCE.md](GOVERNANCE.md) before contributing.

## © Ownership & Copyright

Copyright (c) 2025 Nairobi County Government & Contributors.
All rights reserved. This project is open source under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📄 License

## 🙏 Acknowledgments

- Built for the Nairobi County Government
- Powered by Ruby on Rails and modern web technologies
- Designed to enhance citizen participation in local governance

## 📞 Support

For support or questions, please contact the development team or create an issue in this repository.

---

**NairobiTalks** - Connecting Citizens with Their Government
