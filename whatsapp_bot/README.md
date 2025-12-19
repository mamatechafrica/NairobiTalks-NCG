# NairobiTalks WhatsApp Bot

This is the Node.js microservice that powers the WhatsApp interface for NairobiTalks.

## Setup

1.  **Install Dependencies:**
    ```bash
    npm install
    ```

2.  **Environment Variables:**
    Ensure `.env` exists with:
    - `TWILIO_ACCOUNT_SID`
    - `TWILIO_AUTH_TOKEN`
    - `USE_RAILS_API=true`
    - `RAILS_API_URL=http://localhost:3001/api/v1/whatsapp`

3.  **Run:**
    ```bash
    npm start
    ```

## Integration
This bot communicates with the Rails app (parent directory) via the API defined in `server/services/railsApiService.js`.
