const express = require('express');
const router = express.Router();
const messageController = require('../controllers/messageController');
const twilioService = require('../services/twilioService');
const privacy = require('../services/privacyService');

// Twilio sends POST requests to this endpoint when a message is received
router.post('/', async (req, res) => {
    try {
        // Extract message details from Twilio webhook
        const { Body, From, To, MessageSid, ProfileName } = req.body;

        // Privacy-safe logging (no full phone numbers in logs!)
        console.log(`📨 Message from ${privacy.anonymizeForLog(From)}: "${Body}"`);

        if (!Body || !From) {
            return res.status(400).send('Missing required fields');
        }

        // Process the message and get response
        const response = await messageController.handleIncoming({
            body: Body,
            from: From,
            to: To,
            messageSid: MessageSid,
            profileName: ProfileName
        });

        // Send response using Twilio SDK (more reliable for sandbox)
        try {
            await twilioService.sendMessage(From, response);
            console.log(`✅ Response sent to ${privacy.anonymizeForLog(From)}`);
        } catch (sendError) {
            console.error(`❌ Failed to send response to ${privacy.anonymizeForLog(From)}:`, sendError.message);
        }

        // Respond to webhook with empty TwiML (acknowledge receipt)
        res.set('Content-Type', 'text/xml');
        res.send(`<?xml version="1.0" encoding="UTF-8"?><Response></Response>`);
    } catch (error) {
        console.error('❌ Webhook error:', error);
        res.status(500).send('Internal server error');
    }
});

// Health check endpoint for webhook verification
router.get('/', (req, res) => {
    res.json({
        status: 'Webhook endpoint active',
        timestamp: new Date().toISOString()
    });
});

module.exports = router;
