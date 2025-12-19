const dbService = require('../services/dbService');

/**
 * Get all tracking items
 */
async function getAll() {
    return await dbService.getAllTrackingItems();
}

/**
 * Create a new tracking item
 */
async function create(data) {
    const { trackingNumber, itemType, status, description, phone } = data;

    if (!trackingNumber) {
        throw new Error('Tracking number is required');
    }

    return await dbService.createTrackingItem({
        tracking_number: trackingNumber.toUpperCase(),
        item_type: itemType || 'General',
        status: status || 'pending',
        description: description || '',
        phone: phone || null
    });
}

/**
 * Update a tracking item
 */
async function update(id, data) {
    const { status, description } = data;
    return await dbService.updateTrackingItem(id, { status, description });
}

/**
 * Delete a tracking item
 */
async function deleteItem(id) {
    return await dbService.deleteTrackingItem(id);
}

module.exports = {
    getAll,
    create,
    update,
    delete: deleteItem
};
