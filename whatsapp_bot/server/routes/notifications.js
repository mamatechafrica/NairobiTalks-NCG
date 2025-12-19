const express = require('express');
const router = express.Router();
const twilioService = require('../services/twilioService');

// POST /notifications/status-update
// Receive status update notifications from Rails
router.post('/status-update', async (req, res) => {
    try {
        const { phone, tracking_number, status, title, message } = req.body;

        if (!phone || !tracking_number || !status) {
            return res.status(400).json({
                error: 'Missing required fields: phone, tracking_number, status'
            });
        }

        // Format the notification message
        const statusEmojis = {
            'submitted': '🟡',
            'under_review': '🔵',
            'reviewed': '🟣',
            'approved': '🟢',
            'rejected': '🔴',
            'completed': '✅'
        };

        const emoji = statusEmojis[status] || '📢';
        const notificationMessage = `${emoji} *Status Update*

Tracking: ${tracking_number}
${title ? `Idea: ${title}\n` : ''}
New Status: *${status.toUpperCase().replace('_', ' ')}*

${message || 'Your submission has been updated. Send TRACK ' + tracking_number + ' for details.'}`;

        // Send WhatsApp message
        await twilioService.sendMessage(phone, notificationMessage);

        console.log(`✅ Notification sent to ${phone} for ${tracking_number}`);

        res.json({
            success: true,
            message: 'Notification sent successfully',
            tracking_number,
            recipient: phone
        });

    } catch (error) {
        console.error('❌ Notification error:', error);
        res.status(500).json({
            error: 'Failed to send notification',
            details: error.message
        });
    }
});

// POST /notifications/broadcast
// Send broadcast message to multiple numbers
router.post('/broadcast', async (req, res) => {
    try {
        const { message, recipients } = req.body;

        if (!message || !recipients || !Array.isArray(recipients)) {
            return res.status(400).json({
                error: 'Missing required fields: message, recipients (array)'
            });
        }

        const results = {
            total: recipients.length,
            sent: 0,
            failed: 0,
            errors: []
        };

        for (const phone of recipients) {
            try {
                await twilioService.sendMessage(phone, message);
                results.sent++;
            } catch (error) {
                results.failed++;
                results.errors.push({
                    phone,
                    error: error.message
                });
            }
        }

        console.log(`📢 Broadcast sent: ${results.sent}/${results.total} successful`);

        res.json({
            success: true,
            results
        });

    } catch (error) {
        console.error('❌ Broadcast error:', error);
        res.status(500).json({
            error: 'Failed to send broadcast',
            details: error.message
        });
    }
});

module.exports = router;
