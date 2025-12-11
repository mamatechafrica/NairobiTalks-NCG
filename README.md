# NairobiTalks (NCG)

**NairobiTalks** is an open, civic‑tech platform designed to strengthen **public participation, transparency, and trust** between citizens and the Nairobi County Government.

It enables citizens to submit ideas and engage in planning processes (CIDP/ADP), while giving county officials structured tools to review, track, and act on public input in a transparent, auditable way.

> **Core belief**: Civic participation should be accessible, traceable, inclusive, and action‑oriented — not performative.

---

## 🧽 Problem We Are Solving

Public participation processes in Nairobi (and many similar contexts) face recurring challenges:

* Citizens submit ideas but never hear back
* Feedback is fragmented across meetings, PDFs, WhatsApp groups, and emails
* County teams lack a structured workflow to review, approve, or escalate ideas
* Planning documents (CIDP / ADP) are published but hard to access and understand
* No visible link between citizen ideas and funded or implemented projects
* Limited digital tools that work well for low‑bandwidth and mobile‑first users

**NairobiTalks addresses this gap** by creating a single platform that connects:

```text
citizen ideas → review workflows → planning documents → decision outcomes
```

---

## 🌟 What NairobiTalks Enables

### For Citizens (Public, No Login Required)

* 📬 **Submit community ideas** (ward + topic based)
* 👍👎 **Vote on ideas** to surface priorities
* 📄 **Browse CIDP & ADP planning documents**
* 🔎 **Track idea lifecycle** (submitted → under review → approved / rejected)
* 📱 **Mobile‑friendly, low‑friction participation**

> ✅ Citizens never need to create an account to participate.

---

### For County Officials & Admins (Secure Admin Panel)

#### 📊 Admin Dashboard

* Total ideas, documents, votes, system health
* Recent activity feed

#### 💡 Idea Review & Moderation

* Review submissions card‑by‑card or in tables
* Update idea status:

  * Submitted
  * Under Review
  * Reviewed
  * Approved
  * Submitted for Funding
  * Rejected
* Flag delayed reviews
* Leave internal feedback/comments

#### 📄 Planning Document Management

* Upload & manage CIDP / ADP documents
* Assign status (Draft / Approved)
* Associate financial years
* AI‑generated summaries (prototype)

#### 📈 Analytics & Reporting

* Engagement by ward and topic
* Top‑voted ideas
* CSV exports

#### 📣 Broadcast Center *(Planned / Placeholder)*

* Announce public participation sessions
* CIDP / ADP review notices
* Calls for idea submissions or voting

#### 🗣 Forum & Virtual Engagement *(Planned / Placeholder)*

* Future support for discussions
* Zoom / Google Meet sessions
* Calendar‑based participation

---

## 🧹 Key Design Principles

* ✅ Human‑centered & inclusive
* ✅ Mobile‑first
* ✅ Low‑bandwidth friendly
* ✅ Transparent workflows
* ✅ Open by default
* ✅ Extensible for future integrations (WhatsApp, ticketing systems, PFM tools)

---

## 🛠 Technology Stack

* **Backend**: Ruby on Rails 8.1.1
* **Frontend**: Bootstrap 5, Hotwire (Turbo + Stimulus)
* **Database**: SQLite (dev), PostgreSQL (prod)
* **Authentication**: Devise (admin‑only)
* **File Storage**: ActiveStorage
* **AI (Prototype)**: OpenAI API (document summaries)
* **External Data**: Google Sheets (citizen submissions)
* **Deployment**: Kamal‑ready

---

## 🏗 Architecture Overview

### Public Layer

* Idea submission
* Voting
* Document browsing

### Admin Layer (`/admin`)

* Secure, role‑based access
* Sidebar navigation
* Moderation workflows

### Future Integrations

* WhatsApp bots
* County ticketing systems
* Participatory budgeting tools

---

## 🚀 Getting Started

### Prerequisites

* Ruby ≥ 3.2
* Rails 8.1.1
* Node.js + Yarn
* PostgreSQL (production)

### Setup

```bash
git clone https://github.com/mamatechafrica/NairobiTalks-NCG.git
cd NairobiTalks-NCG
bundle install
yarn install
rails db:create db:migrate db:seed
rails server
```

Visit: `http://localhost:3000`
Admin panel: `http://localhost:3000/admin`

---

## 🔐 Security & Data Protection

* Admin‑only authentication (Devise)
* CSRF protection enabled
* Role‑based route protection
* No citizen login required (privacy‑preserving)
* Environment variables for secrets
* Designed to align with data minimization principles

> ⚠️ **Before production**:
>
> * Add rate‑limiting
> * Add CAPTCHA or spam protection
> * Review file upload restrictions
> * Enable audit logging for admin actions

---

## 🌍 Digital Public Goods (DPG) Alignment

NairobiTalks is designed to align with **DPG best practices**:

* ✅ Open‑source license (MIT)
* ✅ Reusable across counties and cities
* ✅ Vendor‑neutral architecture
* ✅ Clear documentation
* ✅ Modular and extensible
* ✅ Designed for public value, not lock‑in

---

## 📦 Open‑Source Readiness Checklist

### 🔧 Repository Hygiene

* [ ] `CODE_OF_CONDUCT.md`
* [ ] `CONTRIBUTING.md`
* [ ] `SECURITY.md`
* [ ] Issue templates
* [ ] Pull Request templates

### 📒 Documentation

* [ ] Architecture diagram
* [ ] Admin user guide
* [ ] Deployment guide
* [ ] Data model documentation

### 🧪 Engineering

* [ ] System + controller tests
* [ ] Background jobs for AI
* [ ] Pagination & caching
* [ ] Remove hard‑coded values

### 🏠 Governance

* [ ] Define maintainer roles
* [ ] Contribution review process
* [ ] Roadmap (`ROADMAP.md`)

---

## 🤝 Contributing

We welcome civic technologists, designers, policymakers, and researchers.

```bash
git checkout -b feature/your-feature
git commit -m "Describe your change"
git push origin feature/your-feature
```

Then open a Pull Request.

---

## 📜 License

MIT License — free to use, adapt, and deploy with attribution.

---

## 🙌 Acknowledgements

* Nairobi County Government
* Civic technologists and public participation advocates
* Open‑source community

---

## ✨ Vision

**NairobiTalks is not just a platform.
It’s infrastructure for democratic participation.**
