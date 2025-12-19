const twilio = require('twilio');

// Initialize Twilio client
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const whatsappNumber = process.env.TWILIO_WHATSAPP_NUMBER || 'whatsapp:+14155238886';

let client = null;

/**
 * Get Twilio client (lazy initialization)
 */
function getClient() {
    if (!client) {
        if (!accountSid || !authToken || accountSid === 'your_account_sid_here') {
            console.warn('⚠️ Twilio credentials not configured. Messages will not be sent.');
            return null;
        }
        client = twilio(accountSid, authToken);
    }
    return client;
}

/**
 * Send a WhatsApp message
 * @param {string} to - Recipient phone (with or without whatsapp: prefix)
 * @param {string} body - Message content
 */
async function sendMessage(to, body) {
    const twilioClient = getClient();

    if (!twilioClient) {
        console.log(`📤 [MOCK] Message to ${to}: ${body.substring(0, 50)}...`);
        return { sid: 'MOCK_' + Date.now() };
    }

    // Ensure proper format
    const toNumber = to.startsWith('whatsapp:') ? to : `whatsapp:${to}`;

    try {
        const message = await twilioClient.messages.create({
            body: body,
            from: whatsappNumber,
            to: toNumber
        });

        console.log(`📤 Message sent: ${message.sid}`);
        return message;
    } catch (error) {
        console.error('❌ Twilio send error:', error.message);
        throw error;
    }
}

/**
 * Get message status
 * @param {string} messageSid - Twilio message SID
 */
async function getMessageStatus(messageSid) {
    const twilioClient = getClient();

    if (!twilioClient) {
        return { status: 'mock' };
    }

    const message = await twilioClient.messages(messageSid).fetch();
    return {
        status: message.status,
        errorCode: message.errorCode,
        errorMessage: message.errorMessage
    };
}

module.exports = {
    sendMessage,
    getMessageStatus,
    getClient
};
