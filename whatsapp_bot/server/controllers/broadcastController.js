const dbService = require('../services/dbService');
const twilioService = require('../services/twilioService');

/**
 * Send broadcast message to all active subscribers
 */
async function send(message) {
    const subscribers = await dbService.getActiveSubscribers();

    if (subscribers.length === 0) {
        return { sent: 0, message: 'No active subscribers' };
    }

    const results = {
        sent: 0,
        failed: 0,
        errors: []
    };

    // Send to each subscriber
    for (const subscriber of subscribers) {
        try {
            await twilioService.sendMessage(subscriber.phone, message);
            results.sent++;

            // Log the broadcast
            await dbService.logMessage({
                phone: subscriber.phone,
                direction: 'outgoing',
                content: message,
                type: 'broadcast'
            });
        } catch (error) {
            results.failed++;
            results.errors.push({
                phone: subscriber.phone,
                error: error.message
            });
        }
    }

    // Save broadcast record
    await dbService.saveBroadcast({
        message,
        sent_count: results.sent,
        failed_count: results.failed
    });

    return results;
}

/**
 * Get broadcast history
 */
async function getHistory() {
    return await dbService.getBroadcastHistory();
}

module.exports = {
    send,
    getHistory
};
