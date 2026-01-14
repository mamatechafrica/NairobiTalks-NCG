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
- **Frontend**: Tailwind CSS, Turbo/Stimulus

> Note: This project is migrating off Bootstrap and standardizing on Tailwind CSS for component consistency.
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

## 🚢 Deploying to Fly.io

This app can be deployed to Fly.io. See `DEPLOY_FLY.md` for step-by-step instructions, secrets to set, and recommended options for persistent uploads.


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
# Run Rails unit and system tests (Minitest)
rails test

# Run Cucumber BDD features
bundle exec cucumber

# Run Cucumber with JavaScript-enabled scenarios (tag with @javascript)
bundle exec cucumber --tags "@javascript"

Notes for Cucumber BDD:

- Use the Warden helper `login_as(user, scope: :user)` in step defs or features to sign in admin users programmatically for more stable tests.
- For programmatic POSTs that require CSRF tokens, use the helper in `features/support/csrf_helper.rb` and the step `When I submit a POST to "/path" with params:` which will automatically attach the current page's authenticity token.

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
