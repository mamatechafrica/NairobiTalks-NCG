require('dotenv').config();
const express = require('express');
const cors = require('cors');
const path = require('path');

// Import routes
const webhookRoutes = require('./routes/webhook');
const apiRoutes = require('./routes/api');

// Import services
const schedulerService = require('./services/schedulerService');
const dbService = require('./services/dbService');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Serve dashboard static files
app.use(express.static(path.join(__dirname, '../dashboard')));

// API Routes
app.use('/webhook', webhookRoutes);
app.use('/api', apiRoutes);

// Dashboard route
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '../dashboard/index.html'));
});

// Health check
app.get('/health', (req, res) => {
    res.json({ status: 'ok', timestamp: new Date().toISOString() });
});

// Initialize database and start server
async function startServer() {
    try {
        // Initialize database
        await dbService.initialize();
        console.log('✅ Database initialized');

        // Start scheduler for reminders
        schedulerService.start();
        console.log('✅ Reminder scheduler started');

        // Start server
        app.listen(PORT, () => {
            console.log(`\n🚀 CivicTech WhatsApp Bot running on port ${PORT}`);
            console.log(`📊 Dashboard: http://localhost:${PORT}`);
            console.log(`🔗 Webhook URL: http://localhost:${PORT}/webhook`);
            console.log('\n💡 Use ngrok to expose this server for Twilio webhooks');
        });
    } catch (error) {
        console.error('❌ Failed to start server:', error);
        process.exit(1);
    }
}

startServer();
