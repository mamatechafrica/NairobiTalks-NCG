const cron = require('node-cron');
const reminderController = require('../controllers/reminderController');
const twilioService = require('./twilioService');
const dbService = require('./dbService');

let scheduledTask = null;

/**
 * Start the reminder scheduler
 * Checks for due reminders every minute
 */
function start() {
    if (scheduledTask) {
        console.log('⚠️ Scheduler already running');
        return;
    }

    // Run every minute
    scheduledTask = cron.schedule('* * * * *', async () => {
        await checkAndSendReminders();
    });

    console.log('⏰ Reminder scheduler started (checking every minute)');
}

/**
 * Stop the scheduler
 */
function stop() {
    if (scheduledTask) {
        scheduledTask.stop();
        scheduledTask = null;
        console.log('⏹️ Reminder scheduler stopped');
    }
}

/**
 * Check for due reminders and send them
 */
async function checkAndSendReminders() {
    try {
        const dueReminders = await reminderController.getDueReminders();

        if (dueReminders.length === 0) {
            return;
        }

        console.log(`📬 Found ${dueReminders.length} due reminder(s)`);

        for (const reminder of dueReminders) {
            try {
                // Send the reminder
                await twilioService.sendMessage(reminder.phone, `⏰ *Reminder*\n\n${reminder.message}`);

                // Mark as sent
                await reminderController.markSent(reminder.id);

                // Log the message
                await dbService.logMessage({
                    phone: reminder.phone,
                    direction: 'outgoing',
                    content: reminder.message,
                    type: 'reminder'
                });

                console.log(`✅ Reminder sent to ${reminder.phone}`);
            } catch (error) {
                console.error(`❌ Failed to send reminder ${reminder.id}:`, error.message);
            }
        }
    } catch (error) {
        console.error('❌ Scheduler error:', error);
    }
}

/**
 * Manually trigger reminder check (for testing)
 */
async function triggerCheck() {
    console.log('🔍 Manually checking reminders...');
    await checkAndSendReminders();
}

module.exports = {
    start,
    stop,
    triggerCheck
};
