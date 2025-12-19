const twilioService = require('../services/twilioService');
const dbService = require('../services/dbService');
const railsApi = require('../services/railsApiService');

// Configuration
const USE_RAILS_API = process.env.USE_RAILS_API === 'true';

// Command patterns
const COMMANDS = {
    MENU: /^menu$/i,
    TRACK: /^track\s+(.+)$/i,
    SUBMIT: /^submit\s+(.+)$/i,
    RECENT: /^recent(?:\s+(\d+))?$/i,
    VOTE: /^vote\s+(\d+)\s+(up|down)$/i,
    SUBSCRIBE: /^subscribe$/i,
    UNSUBSCRIBE: /^unsubscribe$/i,
    HELP: /^help$/i,
    STATUS: /^status$/i
};

/**
 * Handle incoming WhatsApp messages
 */
async function handleIncoming(message) {
    const { body, from } = message;
    const trimmedBody = body.trim();

    // Log the message
    await dbService.logMessage({
        phone: from,
        direction: 'incoming',
        content: trimmedBody
    });

    // Check for Twilio sandbox join messages
    if (trimmedBody.toLowerCase().startsWith('join ')) {
        return `Welcome to NairobiTalks! 🇰🇪\n\nSubmit ideas, track submissions, and engage with civic participation.\n\nSend *MENU* to see available options.`;
    }

    // Route to appropriate handler
    if (COMMANDS.MENU.test(trimmedBody)) {
        return getMenuResponse();
    }

    if (COMMANDS.SUBMIT.test(trimmedBody)) {
        const match = trimmedBody.match(COMMANDS.SUBMIT);
        return await handleSubmit(from, match[1]);
    }

    if (COMMANDS.TRACK.test(trimmedBody)) {
        const match = trimmedBody.match(COMMANDS.TRACK);
        return await handleTrack(match[1], from);
    }

    if (COMMANDS.RECENT.test(trimmedBody)) {
        const match = trimmedBody.match(COMMANDS.RECENT);
        const limit = match[1] ? parseInt(match[1]) : 5;
        return await handleRecent(limit);
    }

    if (COMMANDS.VOTE.test(trimmedBody)) {
        const match = trimmedBody.match(COMMANDS.VOTE);
        return await handleVote(match[1], match[2]);
    }

    if (COMMANDS.SUBSCRIBE.test(trimmedBody)) {
        return await handleSubscribe(from);
    }

    if (COMMANDS.UNSUBSCRIBE.test(trimmedBody)) {
        return await handleUnsubscribe(from);
    }

    if (COMMANDS.HELP.test(trimmedBody)) {
        return getHelpResponse();
    }

    if (COMMANDS.STATUS.test(trimmedBody)) {
        return await handleStatus(from);
    }

    // Default response for unrecognized commands
    return getDefaultResponse();
}

/**
 * Main menu response
 */
function getMenuResponse() {
    return `📋 *NairobiTalks Menu*

1️⃣ *SUBMIT <your idea>*
   Share your community idea
   Example: SUBMIT Fix potholes on Moi Avenue

2️⃣ *TRACK <number>* 
   Check submission status
   Example: TRACK NT-2412-XY7Z

3️⃣ *RECENT* 
   View recent community ideas

4️⃣ *VOTE <id> UP/DOWN*
   Vote on an idea
   Example: VOTE 5 UP

5️⃣ *SUBSCRIBE*
   Get civic notifications

6️⃣ *HELP*
   Get assistance

Reply with a command to continue.`;
}

/**
 * Help response
 */
function getHelpResponse() {
    return `ℹ️ *NairobiTalks Help*

This bot connects you to Nairobi County's civic participation platform.

*You can:*
• Submit community ideas
• Track your submissions
• Vote on other ideas
• Receive civic notifications

*Need human assistance?*
Visit: nairobitalks.go.ke

Send *MENU* for commands.`;
}

/**
 * Default response for unrecognized messages
 */
function getDefaultResponse() {
    return `🤔 I didn't understand that message.

Send *MENU* to see available options or *HELP* for assistance.`;
}

/**
 * Handle idea submission - NEW FEATURE
 */
async function handleSubmit(phone, ideaText) {
    try {
        if (USE_RAILS_API) {
            // Submit to Rails API
            const result = await railsApi.submitIdea(phone, ideaText);

            if (result.success) {
                return `✅ *Idea Submitted!*

*Tracking Number:* ${result.data.tracking_number}

Your idea: "${ideaText.substring(0, 50)}${ideaText.length > 50 ? '...' : ''}"

Save your tracking number to check status later with:
*TRACK ${result.data.tracking_number}*

Thank you for participating! 🙏`;
            } else {
                return `⚠️ Failed to submit idea: ${result.error}`;
            }
        } else {
            // Fallback to local database
            const trackingNumber = `NT-${Date.now().toString(36).toUpperCase()}`;
            await dbService.createTrackingItem({
                tracking_number: trackingNumber,
                item_type: 'Citizen Idea',
                status: 'pending',
                description: ideaText,
                phone: phone
            });

            return `✅ *Idea Submitted!*

*Tracking Number:* ${trackingNumber}

Your idea has been recorded. Track status with:
*TRACK ${trackingNumber}*`;
        }
    } catch (error) {
        console.error('Submit error:', error);
        return `⚠️ Error submitting idea. Please try again.`;
    }
}

/**
 * Handle tracking requests
 */
async function handleTrack(trackingNumber, phone) {
    try {
        let item = null;

        if (USE_RAILS_API) {
            // Try Rails API first
            try {
                const result = await railsApi.trackIdea(trackingNumber);
                if (result.success) {
                    item = result.data;
                }
            } catch (apiError) {
                console.log('Rails API not available, using local DB');
            }
        }

        // Fallback to local database
        if (!item) {
            item = await dbService.getTrackingItem(trackingNumber.toUpperCase());
        }

        if (!item) {
            return `❌ *Tracking Not Found*

No record found for: ${trackingNumber.toUpperCase()}

Please check the number and try again.`;
        }

        const statusEmoji = {
            'pending': '🟡',
            'submitted': '🟡',
            'under_review': '🔵',
            'processing': '🔵',
            'reviewed': '🟣',
            'approved': '🟢',
            'rejected': '🔴',
            'completed': '✅'
        };

        const status = item.status || item.status_label;

        return `📦 *Tracking Status*

*Number:* ${item.tracking_number || trackingNumber}
*Status:* ${statusEmoji[status] || '⚪'} ${status?.toUpperCase() || 'Unknown'}
*Title:* ${item.title || 'N/A'}
*Description:* ${(item.description || 'N/A').substring(0, 100)}
*Updated:* ${item.updated_at ? new Date(item.updated_at).toLocaleDateString() : 'N/A'}`;
    } catch (error) {
        console.error('Track error:', error);
        return `⚠️ Error checking tracking status. Please try again.`;
    }
}

/**
 * Handle recent ideas - NEW FEATURE
 */
async function handleRecent(limit = 5) {
    try {
        if (USE_RAILS_API) {
            const result = await railsApi.getRecentIdeas(limit);

            if (result.success && result.data.length > 0) {
                let response = `📢 *Recent Community Ideas*\n\n`;

                result.data.forEach((idea, index) => {
                    const voteEmoji = idea.votes >= 0 ? '👍' : '👎';
                    response += `${index + 1}. *${idea.title || 'Untitled'}*\n`;
                    response += `   ${(idea.description || '').substring(0, 50)}...\n`;
                    response += `   ${voteEmoji} ${idea.votes} votes | Ward: ${idea.ward || 'N/A'}\n`;
                    response += `   Vote: *VOTE ${idea.id} UP* or *VOTE ${idea.id} DOWN*\n\n`;
                });

                return response;
            }
        }

        return `📢 *Recent Ideas*

No recent ideas found. Be the first to submit one!

*SUBMIT <your idea>*`;
    } catch (error) {
        console.error('Recent error:', error);
        return `⚠️ Error fetching recent ideas. Please try again.`;
    }
}

/**
 * Handle voting - NEW FEATURE
 */
async function handleVote(ideaId, direction) {
    try {
        if (USE_RAILS_API) {
            const result = await railsApi.voteIdea(ideaId, direction);

            if (result.success) {
                const emoji = direction === 'up' ? '👍' : '👎';
                return `${emoji} *Vote Recorded!*

${result.data.message}

Send *RECENT* to see more ideas.`;
            } else {
                return `⚠️ ${result.error}`;
            }
        }

        return `⚠️ Voting is currently unavailable. Please try again later.`;
    } catch (error) {
        console.error('Vote error:', error);
        return `⚠️ Error recording vote. Please try again.`;
    }
}

/**
 * Handle subscription
 */
async function handleSubscribe(phone) {
    try {
        // Try Rails API if enabled
        if (USE_RAILS_API) {
            try {
                const result = await railsApi.subscribe(phone);
                if (result.success) {
                    // Also subscribe locally for backup
                    await dbService.addSubscriber(phone);
                    return `🎉 *Subscribed to NairobiTalks!*

You'll receive:
• Public participation announcements
• Idea status updates
• Civic engagement opportunities

Send *UNSUBSCRIBE* anytime to stop.`;
                }
            } catch (apiError) {
                console.log('Rails API not available for subscribe');
            }
        }

        // Local subscription
        const existing = await dbService.getSubscriber(phone);

        if (existing && existing.active) {
            return `✅ You're already subscribed to notifications!

Send *UNSUBSCRIBE* to stop receiving notifications.`;
        }

        await dbService.addSubscriber(phone);

        return `🎉 *Subscribed Successfully!*

You'll now receive:
• Community announcements
• Service updates
• Important civic notifications

Send *UNSUBSCRIBE* anytime to stop.`;
    } catch (error) {
        console.error('Subscribe error:', error);
        return `⚠️ Error subscribing. Please try again.`;
    }
}

/**
 * Handle unsubscription
 */
async function handleUnsubscribe(phone) {
    try {
        if (USE_RAILS_API) {
            try {
                await railsApi.unsubscribe(phone);
            } catch (apiError) {
                console.log('Rails API not available for unsubscribe');
            }
        }

        await dbService.removeSubscriber(phone);

        return `👋 *Unsubscribed*

You've been removed from our notification list.

Send *SUBSCRIBE* to rejoin anytime.`;
    } catch (error) {
        console.error('Unsubscribe error:', error);
        return `⚠️ Error unsubscribing. Please try again.`;
    }
}

/**
 * Handle status check
 */
async function handleStatus(phone) {
    try {
        const subscriber = await dbService.getSubscriber(phone);
        const subscriptionStatus = subscriber?.active ? '✅ Active' : '❌ Not subscribed';

        return `📊 *Your Status*

*Phone:* ${phone.replace('whatsapp:', '')}
*Subscription:* ${subscriptionStatus}

Send *SUBSCRIBE* or *UNSUBSCRIBE* to change.`;
    } catch (error) {
        console.error('Status error:', error);
        return `⚠️ Error checking status. Please try again.`;
    }
}

module.exports = {
    handleIncoming
};
