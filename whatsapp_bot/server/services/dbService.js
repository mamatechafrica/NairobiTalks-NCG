const Database = require('better-sqlite3');
const path = require('path');
const fs = require('fs');

let db = null;

/**
 * Initialize database and create tables
 */
function initialize() {
    const dataDir = path.join(__dirname, '../data');

    // Ensure data directory exists
    if (!fs.existsSync(dataDir)) {
        fs.mkdirSync(dataDir, { recursive: true });
    }

    const dbPath = path.join(dataDir, 'civicbot.db');
    db = new Database(dbPath);

    // Enable foreign keys
    db.pragma('foreign_keys = ON');

    // Create tables
    db.exec(`
        -- Subscribers table
        CREATE TABLE IF NOT EXISTS subscribers (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            phone TEXT UNIQUE NOT NULL,
            active INTEGER DEFAULT 1,
            created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
            updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
        );

        -- Tracking items table
        CREATE TABLE IF NOT EXISTS tracking_items (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            tracking_number TEXT UNIQUE NOT NULL,
            item_type TEXT DEFAULT 'General',
            status TEXT DEFAULT 'pending',
            description TEXT,
            phone TEXT,
            created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
            updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
        );

        -- Reminders table
        CREATE TABLE IF NOT EXISTS reminders (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            phone TEXT NOT NULL,
            message TEXT NOT NULL,
            scheduled_at DATETIME NOT NULL,
            recurring TEXT,
            sent INTEGER DEFAULT 0,
            created_at DATETIME DEFAULT CURRENT_TIMESTAMP
        );

        -- Message logs table
        CREATE TABLE IF NOT EXISTS messages (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            phone TEXT NOT NULL,
            direction TEXT NOT NULL,
            content TEXT NOT NULL,
            type TEXT DEFAULT 'chat',
            created_at DATETIME DEFAULT CURRENT_TIMESTAMP
        );

        -- Broadcasts table
        CREATE TABLE IF NOT EXISTS broadcasts (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            message TEXT NOT NULL,
            sent_count INTEGER DEFAULT 0,
            failed_count INTEGER DEFAULT 0,
            created_at DATETIME DEFAULT CURRENT_TIMESTAMP
        );

        -- Create indexes
        CREATE INDEX IF NOT EXISTS idx_tracking_number ON tracking_items(tracking_number);
        CREATE INDEX IF NOT EXISTS idx_subscriber_phone ON subscribers(phone);
        CREATE INDEX IF NOT EXISTS idx_reminders_scheduled ON reminders(scheduled_at);
    `);

    return true;
}

// ============ SUBSCRIBER OPERATIONS ============
function addSubscriber(phone) {
    const stmt = db.prepare(`
        INSERT INTO subscribers (phone, active) VALUES (?, 1)
        ON CONFLICT(phone) DO UPDATE SET active = 1, updated_at = CURRENT_TIMESTAMP
    `);
    return stmt.run(phone);
}

function removeSubscriber(phone) {
    const stmt = db.prepare(`
        UPDATE subscribers SET active = 0, updated_at = CURRENT_TIMESTAMP WHERE phone = ?
    `);
    return stmt.run(phone);
}

function getSubscriber(phone) {
    const stmt = db.prepare('SELECT * FROM subscribers WHERE phone = ?');
    return stmt.get(phone);
}

function getAllSubscribers() {
    const stmt = db.prepare('SELECT * FROM subscribers ORDER BY created_at DESC');
    return stmt.all();
}

function getActiveSubscribers() {
    const stmt = db.prepare('SELECT * FROM subscribers WHERE active = 1');
    return stmt.all();
}

// ============ TRACKING OPERATIONS ============
function createTrackingItem(data) {
    const stmt = db.prepare(`
        INSERT INTO tracking_items (tracking_number, item_type, status, description, phone)
        VALUES (@tracking_number, @item_type, @status, @description, @phone)
    `);
    const result = stmt.run(data);
    return { id: result.lastInsertRowid, ...data };
}

function getTrackingItem(trackingNumber) {
    const stmt = db.prepare('SELECT * FROM tracking_items WHERE tracking_number = ?');
    return stmt.get(trackingNumber);
}

function getAllTrackingItems() {
    const stmt = db.prepare('SELECT * FROM tracking_items ORDER BY updated_at DESC');
    return stmt.all();
}

function updateTrackingItem(id, data) {
    const stmt = db.prepare(`
        UPDATE tracking_items 
        SET status = COALESCE(?, status), 
            description = COALESCE(?, description),
            updated_at = CURRENT_TIMESTAMP
        WHERE id = ?
    `);
    return stmt.run(data.status, data.description, id);
}

function deleteTrackingItem(id) {
    const stmt = db.prepare('DELETE FROM tracking_items WHERE id = ?');
    return stmt.run(id);
}

// ============ REMINDER OPERATIONS ============
function createReminder(data) {
    const stmt = db.prepare(`
        INSERT INTO reminders (phone, message, scheduled_at, recurring)
        VALUES (@phone, @message, @scheduled_at, @recurring)
    `);
    const result = stmt.run(data);
    return { id: result.lastInsertRowid, ...data };
}

function getAllReminders() {
    const stmt = db.prepare('SELECT * FROM reminders ORDER BY scheduled_at ASC');
    return stmt.all();
}

function getDueReminders() {
    const stmt = db.prepare(`
        SELECT * FROM reminders 
        WHERE sent = 0 AND datetime(scheduled_at) <= datetime('now', 'localtime')
    `);
    return stmt.all();
}

function markReminderSent(id) {
    const stmt = db.prepare('UPDATE reminders SET sent = 1 WHERE id = ?');
    return stmt.run(id);
}

function deleteReminder(id) {
    const stmt = db.prepare('DELETE FROM reminders WHERE id = ?');
    return stmt.run(id);
}

// ============ MESSAGE LOGGING ============
function logMessage(data) {
    const stmt = db.prepare(`
        INSERT INTO messages (phone, direction, content, type)
        VALUES (@phone, @direction, @content, @type)
    `);
    return stmt.run({ type: 'chat', ...data });
}

function getMessages(limit = 50) {
    const stmt = db.prepare('SELECT * FROM messages ORDER BY created_at DESC LIMIT ?');
    return stmt.all(limit);
}

// ============ BROADCAST OPERATIONS ============
function saveBroadcast(data) {
    const stmt = db.prepare(`
        INSERT INTO broadcasts (message, sent_count, failed_count)
        VALUES (@message, @sent_count, @failed_count)
    `);
    return stmt.run(data);
}

function getBroadcastHistory() {
    const stmt = db.prepare('SELECT * FROM broadcasts ORDER BY created_at DESC LIMIT 50');
    return stmt.all();
}

// ============ STATS ============
function getStats() {
    const subscriberCount = db.prepare('SELECT COUNT(*) as count FROM subscribers WHERE active = 1').get();
    const trackingCount = db.prepare('SELECT COUNT(*) as count FROM tracking_items').get();
    const reminderCount = db.prepare('SELECT COUNT(*) as count FROM reminders WHERE sent = 0').get();
    const messageCount = db.prepare('SELECT COUNT(*) as count FROM messages').get();

    return {
        subscribers: subscriberCount.count,
        trackingItems: trackingCount.count,
        pendingReminders: reminderCount.count,
        totalMessages: messageCount.count
    };
}

module.exports = {
    initialize,
    // Subscribers
    addSubscriber,
    removeSubscriber,
    getSubscriber,
    getAllSubscribers,
    getActiveSubscribers,
    // Tracking
    createTrackingItem,
    getTrackingItem,
    getAllTrackingItems,
    updateTrackingItem,
    deleteTrackingItem,
    // Reminders
    createReminder,
    getAllReminders,
    getDueReminders,
    markReminderSent,
    deleteReminder,
    // Messages
    logMessage,
    getMessages,
    // Broadcasts
    saveBroadcast,
    getBroadcastHistory,
    // Stats
    getStats
};
