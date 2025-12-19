// ============ API BASE ============
const API_BASE = '/api';

// ============ APP STATE ============
let currentSection = 'dashboard';

// ============ INITIALIZATION ============
document.addEventListener('DOMContentLoaded', () => {
    initNavigation();
    checkServerStatus();
    refreshData();
    initForms();
});

// ============ NAVIGATION ============
function initNavigation() {
    document.querySelectorAll('.nav-item').forEach(item => {
        item.addEventListener('click', () => {
            const section = item.dataset.section;
            showSection(section);
        });
    });
}

function showSection(sectionName) {
    // Update navigation
    document.querySelectorAll('.nav-item').forEach(item => {
        item.classList.toggle('active', item.dataset.section === sectionName);
    });

    // Update sections
    document.querySelectorAll('.section').forEach(section => {
        section.classList.toggle('active', section.id === `section-${sectionName}`);
    });

    // Update title
    const titles = {
        dashboard: 'Dashboard',
        tracking: 'Tracking Management',
        reminders: 'Reminder Scheduler',
        broadcast: 'Broadcast Messages',
        subscribers: 'Subscribers',
        messages: 'Message Log'
    };
    document.getElementById('pageTitle').textContent = titles[sectionName] || 'Dashboard';

    currentSection = sectionName;

    // Refresh section data
    loadSectionData(sectionName);
}

// ============ SERVER STATUS ============
async function checkServerStatus() {
    const statusEl = document.getElementById('serverStatus');
    try {
        const res = await fetch('/health');
        if (res.ok) {
            statusEl.classList.add('connected');
            statusEl.querySelector('.status-text').textContent = 'Connected';
        }
    } catch (error) {
        statusEl.querySelector('.status-text').textContent = 'Disconnected';
    }
}

// ============ DATA LOADING ============
async function refreshData() {
    await Promise.all([
        loadStats(),
        loadSectionData(currentSection)
    ]);
}

async function loadStats() {
    try {
        const res = await fetch(`${API_BASE}/stats`);
        const data = await res.json();

        if (data.success) {
            document.getElementById('stat-subscribers').textContent = data.data.subscribers;
            document.getElementById('stat-tracking').textContent = data.data.trackingItems;
            document.getElementById('stat-reminders').textContent = data.data.pendingReminders;
            document.getElementById('stat-messages').textContent = data.data.totalMessages;
        }
    } catch (error) {
        console.error('Failed to load stats:', error);
    }
}

async function loadSectionData(section) {
    switch (section) {
        case 'tracking':
            await loadTracking();
            break;
        case 'reminders':
            await loadReminders();
            break;
        case 'subscribers':
            await loadSubscribers();
            break;
        case 'messages':
            await loadMessages();
            break;
    }
}

// ============ TRACKING ============
async function loadTracking() {
    try {
        const res = await fetch(`${API_BASE}/tracking`);
        const data = await res.json();

        const tbody = document.querySelector('#trackingTable tbody');
        tbody.innerHTML = '';

        if (data.success && data.data.length > 0) {
            data.data.forEach(item => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td><strong>${item.tracking_number}</strong></td>
                    <td>${item.item_type}</td>
                    <td><span class="status-badge status-${item.status}">${item.status}</span></td>
                    <td>${item.description || '-'}</td>
                    <td>${formatDate(item.updated_at)}</td>
                    <td>
                        <button class="btn btn-danger" onclick="deleteTracking(${item.id})">Delete</button>
                    </td>
                `;
                tbody.appendChild(row);
            });
        } else {
            tbody.innerHTML = '<tr><td colspan="6" style="text-align: center; color: var(--text-secondary);">No tracking items yet</td></tr>';
        }
    } catch (error) {
        console.error('Failed to load tracking:', error);
    }
}

async function deleteTracking(id) {
    if (!confirm('Are you sure you want to delete this tracking item?')) return;

    try {
        const res = await fetch(`${API_BASE}/tracking/${id}`, { method: 'DELETE' });
        const data = await res.json();

        if (data.success) {
            showToast('Tracking item deleted', 'success');
            loadTracking();
            loadStats();
        }
    } catch (error) {
        showToast('Failed to delete', 'error');
    }
}

// ============ REMINDERS ============
async function loadReminders() {
    try {
        const res = await fetch(`${API_BASE}/reminders`);
        const data = await res.json();

        const tbody = document.querySelector('#remindersTable tbody');
        tbody.innerHTML = '';

        if (data.success && data.data.length > 0) {
            data.data.forEach(item => {
                const row = document.createElement('tr');
                const status = item.sent ? 'Sent' : 'Pending';
                const statusClass = item.sent ? 'status-completed' : 'status-pending';
                row.innerHTML = `
                    <td>${item.phone_masked || 'N/A'} <small style="color: var(--accent-purple);">[${item.phone_hash || '?'}]</small></td>
                    <td>${truncate(item.message, 50)}</td>
                    <td>${formatDate(item.scheduled_at)}</td>
                    <td><span class="status-badge ${statusClass}">${status}</span></td>
                    <td>
                        <button class="btn btn-danger" onclick="deleteReminder(${item.id})">Delete</button>
                    </td>
                `;
                tbody.appendChild(row);
            });
        } else {
            tbody.innerHTML = '<tr><td colspan="5" style="text-align: center; color: var(--text-secondary);">No reminders scheduled</td></tr>';
        }
    } catch (error) {
        console.error('Failed to load reminders:', error);
    }
}

async function deleteReminder(id) {
    if (!confirm('Are you sure you want to delete this reminder?')) return;

    try {
        const res = await fetch(`${API_BASE}/reminders/${id}`, { method: 'DELETE' });
        const data = await res.json();

        if (data.success) {
            showToast('Reminder deleted', 'success');
            loadReminders();
            loadStats();
        }
    } catch (error) {
        showToast('Failed to delete', 'error');
    }
}

// ============ SUBSCRIBERS ============
async function loadSubscribers() {
    try {
        const res = await fetch(`${API_BASE}/subscribers`);
        const data = await res.json();

        const tbody = document.querySelector('#subscribersTable tbody');
        tbody.innerHTML = '';

        if (data.success && data.data.length > 0) {
            data.data.forEach(item => {
                const row = document.createElement('tr');
                const statusClass = item.active ? 'status-active' : 'status-inactive';
                const statusText = item.active ? 'Active' : 'Inactive';
                row.innerHTML = `
                    <td>${item.phone_masked || 'N/A'} <small style="color: var(--accent-purple);">[${item.phone_hash || '?'}]</small></td>
                    <td><span class="status-badge ${statusClass}">${statusText}</span></td>
                    <td>${formatDate(item.created_at)}</td>
                `;
                tbody.appendChild(row);
            });
        } else {
            tbody.innerHTML = '<tr><td colspan="3" style="text-align: center; color: var(--text-secondary);">No subscribers yet. Users can subscribe by sending SUBSCRIBE.</td></tr>';
        }
    } catch (error) {
        console.error('Failed to load subscribers:', error);
    }
}

// ============ MESSAGES ============
async function loadMessages() {
    try {
        const res = await fetch(`${API_BASE}/messages`);
        const data = await res.json();

        const tbody = document.querySelector('#messagesTable tbody');
        tbody.innerHTML = '';

        if (data.success && data.data.length > 0) {
            data.data.forEach(item => {
                const row = document.createElement('tr');
                const dirClass = item.direction === 'incoming' ? 'direction-incoming' : 'direction-outgoing';
                const dirIcon = item.direction === 'incoming' ? '📥' : '📤';
                row.innerHTML = `
                    <td>${formatDate(item.created_at)}</td>
                    <td class="${dirClass}">${dirIcon} ${item.direction}</td>
                    <td>${item.phone_masked || 'N/A'} <small style="color: var(--accent-purple);">[${item.phone_hash || '?'}]</small></td>
                    <td>${truncate(item.content, 80)}</td>
                `;
                tbody.appendChild(row);
            });
        } else {
            tbody.innerHTML = '<tr><td colspan="4" style="text-align: center; color: var(--text-secondary);">No messages yet</td></tr>';
        }
    } catch (error) {
        console.error('Failed to load messages:', error);
    }
}

// ============ FORMS ============
function initForms() {
    // Tracking form
    document.getElementById('trackingForm').addEventListener('submit', async (e) => {
        e.preventDefault();

        const data = {
            trackingNumber: document.getElementById('trackingNumber').value,
            itemType: document.getElementById('itemType').value,
            status: document.getElementById('trackingStatus').value,
            description: document.getElementById('trackingDesc').value,
            phone: document.getElementById('trackingPhone').value
        };

        try {
            const res = await fetch(`${API_BASE}/tracking`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(data)
            });
            const result = await res.json();

            if (result.success) {
                showToast('Tracking item added!', 'success');
                e.target.reset();
                loadTracking();
                loadStats();
            } else {
                showToast(result.error || 'Failed to add', 'error');
            }
        } catch (error) {
            showToast('Failed to add tracking item', 'error');
        }
    });

    // Reminder form
    document.getElementById('reminderForm').addEventListener('submit', async (e) => {
        e.preventDefault();

        const data = {
            phone: document.getElementById('reminderPhone').value,
            scheduledAt: document.getElementById('reminderTime').value,
            message: document.getElementById('reminderMessage').value
        };

        try {
            const res = await fetch(`${API_BASE}/reminders`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(data)
            });
            const result = await res.json();

            if (result.success) {
                showToast('Reminder scheduled!', 'success');
                e.target.reset();
                loadReminders();
                loadStats();
            } else {
                showToast(result.error || 'Failed to schedule', 'error');
            }
        } catch (error) {
            showToast('Failed to schedule reminder', 'error');
        }
    });

    // Broadcast form
    document.getElementById('broadcastForm').addEventListener('submit', async (e) => {
        e.preventDefault();

        const message = document.getElementById('broadcastMessage').value;

        if (!confirm(`Send this message to all subscribers?\n\n"${message.substring(0, 100)}..."`)) {
            return;
        }

        try {
            const res = await fetch(`${API_BASE}/broadcast`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ message })
            });
            const result = await res.json();

            if (result.success) {
                const resultEl = document.getElementById('broadcastResult');
                resultEl.classList.remove('hidden');
                resultEl.querySelector('.result-text').textContent =
                    `Sent to ${result.data.sent} subscriber(s). Failed: ${result.data.failed}`;

                showToast('Broadcast sent!', 'success');
                e.target.reset();
                loadStats();
            } else {
                showToast(result.error || 'Failed to broadcast', 'error');
            }
        } catch (error) {
            showToast('Failed to send broadcast', 'error');
        }
    });
}

// ============ UTILITIES ============
function formatDate(dateStr) {
    if (!dateStr) return '-';
    const date = new Date(dateStr);
    return date.toLocaleString('en-KE', {
        day: '2-digit',
        month: 'short',
        year: 'numeric',
        hour: '2-digit',
        minute: '2-digit'
    });
}

function truncate(str, maxLength) {
    if (!str) return '-';
    return str.length > maxLength ? str.substring(0, maxLength) + '...' : str;
}

function showToast(message, type = 'info') {
    const toast = document.getElementById('toast');
    toast.querySelector('.toast-message').textContent = message;
    toast.className = `toast ${type}`;

    setTimeout(() => {
        toast.classList.add('hidden');
    }, 3000);
}
