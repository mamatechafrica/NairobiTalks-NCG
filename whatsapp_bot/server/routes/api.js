const express = require('express');
const router = express.Router();
const trackingController = require('../controllers/trackingController');
const reminderController = require('../controllers/reminderController');
const broadcastController = require('../controllers/broadcastController');
const subscriberController = require('../controllers/subscriberController');
const dbService = require('../services/dbService');
const privacy = require('../services/privacyService');

/**
 * Apply privacy masking to data containing phone numbers
 */
function maskPhoneInData(data) {
    if (Array.isArray(data)) {
        return data.map(item => maskPhoneInData(item));
    }
    if (data && typeof data === 'object') {
        const masked = { ...data };
        if (masked.phone) {
            masked.phone_masked = privacy.maskPhone(masked.phone);
            masked.phone_hash = privacy.hashPhone(masked.phone);
            delete masked.phone; // Remove full phone number
        }
        return masked;
    }
    return data;
}

// ============ TRACKING ENDPOINTS ============
// Get all tracking items
router.get('/tracking', async (req, res) => {
    try {
        const items = await trackingController.getAll();
        res.json({ success: true, data: maskPhoneInData(items) });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});

// Create tracking item
router.post('/tracking', async (req, res) => {
    try {
        const item = await trackingController.create(req.body);
        res.json({ success: true, data: maskPhoneInData(item) });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});

// Update tracking item
router.put('/tracking/:id', async (req, res) => {
    try {
        const item = await trackingController.update(req.params.id, req.body);
        res.json({ success: true, data: item });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});

// Delete tracking item
router.delete('/tracking/:id', async (req, res) => {
    try {
        await trackingController.delete(req.params.id);
        res.json({ success: true });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});

// ============ REMINDER ENDPOINTS ============
// Get all reminders (privacy masked)
router.get('/reminders', async (req, res) => {
    try {
        const reminders = await reminderController.getAll();
        res.json({ success: true, data: maskPhoneInData(reminders) });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});

// Create reminder
router.post('/reminders', async (req, res) => {
    try {
        const reminder = await reminderController.create(req.body);
        res.json({ success: true, data: maskPhoneInData(reminder) });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});

// Delete reminder
router.delete('/reminders/:id', async (req, res) => {
    try {
        await reminderController.delete(req.params.id);
        res.json({ success: true });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});

// ============ SUBSCRIBER ENDPOINTS ============
// Get all subscribers (privacy masked)
router.get('/subscribers', async (req, res) => {
    try {
        const subscribers = await subscriberController.getAll();
        res.json({ success: true, data: maskPhoneInData(subscribers) });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});

// ============ BROADCAST ENDPOINTS ============
// Send broadcast message
router.post('/broadcast', async (req, res) => {
    try {
        const { message } = req.body;
        if (!message) {
            return res.status(400).json({ success: false, error: 'Message is required' });
        }
        const result = await broadcastController.send(message);
        res.json({ success: true, data: result });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});

// ============ STATS ENDPOINT ============
router.get('/stats', async (req, res) => {
    try {
        const stats = await dbService.getStats();
        res.json({ success: true, data: stats });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});

// ============ MESSAGE LOG (privacy masked) ============
router.get('/messages', async (req, res) => {
    try {
        const messages = await dbService.getMessages(50);
        res.json({ success: true, data: maskPhoneInData(messages) });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});

module.exports = router;
