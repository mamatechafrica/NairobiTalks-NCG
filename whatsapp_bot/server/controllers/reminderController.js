const dbService = require('../services/dbService');

/**
 * Get all reminders
 */
async function getAll() {
    return await dbService.getAllReminders();
}

/**
 * Create a new reminder
 */
async function create(data) {
    const { phone, message, scheduledAt, recurring } = data;

    if (!phone || !message || !scheduledAt) {
        throw new Error('Phone, message, and scheduledAt are required');
    }

    return await dbService.createReminder({
        phone: phone.startsWith('whatsapp:') ? phone : `whatsapp:${phone}`,
        message,
        scheduled_at: scheduledAt,
        recurring: recurring || null
    });
}

/**
 * Delete a reminder
 */
async function deleteReminder(id) {
    return await dbService.deleteReminder(id);
}

/**
 * Get due reminders (called by scheduler)
 */
async function getDueReminders() {
    return await dbService.getDueReminders();
}

/**
 * Mark reminder as sent
 */
async function markSent(id) {
    return await dbService.markReminderSent(id);
}

module.exports = {
    getAll,
    create,
    delete: deleteReminder,
    getDueReminders,
    markSent
};
