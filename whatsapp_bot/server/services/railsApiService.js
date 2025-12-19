/**
 * NairobiTalks Rails API Service
 * Connects WhatsApp bot to the main Rails platform
 */

const RAILS_API_BASE = process.env.RAILS_API_URL || 'http://localhost:3000/api/v1/whatsapp';
const API_KEY = process.env.RAILS_API_KEY || '';

/**
 * Make a request to the Rails API
 */
async function apiRequest(method, endpoint, data = null) {
    const url = `${RAILS_API_BASE}${endpoint}`;

    const options = {
        method: method,
        headers: {
            'Content-Type': 'application/json',
            'X-API-Key': API_KEY
        }
    };

    if (data && (method === 'POST' || method === 'PUT' || method === 'PATCH')) {
        options.body = JSON.stringify(data);
    }

    try {
        const response = await fetch(url, options);
        const json = await response.json();

        if (!response.ok) {
            throw new Error(json.error || `API error: ${response.status}`);
        }

        return json;
    } catch (error) {
        console.error(`Rails API error [${method} ${endpoint}]:`, error.message);
        throw error;
    }
}

// ============ IDEAS ============

/**
 * Submit a new idea via WhatsApp
 */
async function submitIdea(phone, description, ward = null, topic = null) {
    return await apiRequest('POST', '/submit_idea', {
        phone: phone,
        description: description,
        ward: ward,
        topic: topic
    });
}

/**
 * Track status of an idea
 */
async function trackIdea(trackingId) {
    return await apiRequest('GET', `/track/${encodeURIComponent(trackingId)}`);
}

/**
 * Get recent ideas
 */
async function getRecentIdeas(limit = 5, ward = null) {
    let endpoint = `/recent_ideas?limit=${limit}`;
    if (ward) endpoint += `&ward=${encodeURIComponent(ward)}`;
    return await apiRequest('GET', endpoint);
}

/**
 * Vote on an idea
 */
async function voteIdea(ideaId, direction) {
    return await apiRequest('POST', '/vote', {
        idea_id: ideaId,
        direction: direction
    });
}

// ============ NOTIFICATIONS ============

/**
 * Subscribe phone to notifications
 */
async function subscribe(phone, ward = null) {
    return await apiRequest('POST', '/subscribe', {
        phone: phone,
        ward: ward
    });
}

/**
 * Unsubscribe from notifications
 */
async function unsubscribe(phone) {
    return await apiRequest('DELETE', `/unsubscribe?phone=${encodeURIComponent(phone)}`);
}

/**
 * Get subscribers for broadcast
 */
async function getSubscribers(ward = null) {
    let endpoint = '/subscribers';
    if (ward) endpoint += `?ward=${encodeURIComponent(ward)}`;
    return await apiRequest('GET', endpoint);
}

/**
 * Get broadcast recipients
 */
async function getBroadcastRecipients(message, ward = null) {
    return await apiRequest('POST', '/broadcast', {
        message: message,
        ward: ward
    });
}

// ============ HEALTH ============

/**
 * Check Rails API health
 */
async function checkHealth() {
    return await apiRequest('GET', '/health');
}

module.exports = {
    // Ideas
    submitIdea,
    trackIdea,
    getRecentIdeas,
    voteIdea,
    // Notifications
    subscribe,
    unsubscribe,
    getSubscribers,
    getBroadcastRecipients,
    // Health
    checkHealth
};
