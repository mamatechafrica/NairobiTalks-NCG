const crypto = require('crypto');

/**
 * Privacy utilities for protecting user data
 */

// Secret salt for hashing (should be in .env in production)
const HASH_SALT = process.env.PRIVACY_SALT || 'civictech-privacy-salt-2024';

/**
 * Mask a phone number for display
 * Example: +254792798789 → +254***789
 * @param {string} phone - Full phone number
 * @returns {string} Masked phone number
 */
function maskPhone(phone) {
    if (!phone) return 'Unknown';

    // Remove whatsapp: prefix if present
    const cleanPhone = phone.replace('whatsapp:', '');

    if (cleanPhone.length < 6) return '***';

    // Show first 4 and last 3 characters
    const prefix = cleanPhone.slice(0, 4);
    const suffix = cleanPhone.slice(-3);
    return `${prefix}***${suffix}`;
}

/**
 * Generate a short hash ID for a phone number
 * Example: +254792798789 → "a3f7b2"
 * @param {string} phone - Full phone number
 * @returns {string} 6-character hash ID
 */
function hashPhone(phone) {
    if (!phone) return 'unknown';

    const cleanPhone = phone.replace('whatsapp:', '');
    const hash = crypto
        .createHmac('sha256', HASH_SALT)
        .update(cleanPhone)
        .digest('hex');

    return hash.slice(0, 6).toUpperCase();
}

/**
 * Get a privacy-safe identifier combining mask and hash
 * Example: +254792798789 → "+254***789 (A3F7B2)"
 * @param {string} phone - Full phone number
 * @returns {string} Privacy-safe identifier
 */
function getPrivacyId(phone) {
    return `${maskPhone(phone)} [${hashPhone(phone)}]`;
}

/**
 * Anonymize a phone number for logs
 * Uses hash only for maximum privacy
 * @param {string} phone - Full phone number
 * @returns {string} Anonymous ID
 */
function anonymizeForLog(phone) {
    return `User-${hashPhone(phone)}`;
}

module.exports = {
    maskPhone,
    hashPhone,
    getPrivacyId,
    anonymizeForLog
};
