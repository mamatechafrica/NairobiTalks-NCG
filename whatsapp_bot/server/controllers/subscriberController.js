const dbService = require('../services/dbService');

/**
 * Get all subscribers
 */
async function getAll() {
    return await dbService.getAllSubscribers();
}

/**
 * Get active subscribers only
 */
async function getActive() {
    return await dbService.getActiveSubscribers();
}

module.exports = {
    getAll,
    getActive
};
