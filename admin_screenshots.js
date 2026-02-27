const puppeteer = require('puppeteer');
const fs = require('fs');
const path = require('path');

const BASE_URL = 'http://localhost:3000';

async function captureAdminScreenshots() {
  const browser = await puppeteer.launch({ 
    headless: false, 
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  });
  
  const page = await browser.newPage();
  await page.setViewport({ width: 1280, height: 800 });

  console.log('=== ATTEMPTING ADMIN LOGIN ===');
  
  try {
    // First try regular login with admin credentials
    await page.goto(`${BASE_URL}/users/sign_in`, { waitUntil: 'networkidle2' });
    await new Promise(resolve => setTimeout(resolve, 2000));
    
    await page.type('input[name="user[email]"]', 'admin@nairobi.gov');
    await page.type('input[name="user[password]"]', 'admin123');
    await page.click('input[type="submit"]');
    await new Promise(resolve => setTimeout(resolve, 3000));
    
    // Check if admin has access to admin panel
    try {
      await page.goto(`${BASE_URL}/admin`, { waitUntil: 'networkidle2', timeout: 10000 });
      console.log('✓ Admin access successful!');
      
      // Capture all admin pages
      const adminPages = [
        { url: '/admin', name: 'admin_dashboard' },
        { url: '/admin/dashboard', name: 'admin_dashboard_main' },
        { url: '/admin/analytics', name: 'admin_analytics' },
        { url: '/admin/app_preview', name: 'admin_app_preview' },
        { url: '/admin/forum', name: 'admin_forum' },
        { url: '/admin/community_ideas', name: 'admin_community_ideas' },
        { url: '/admin/community_ideas/new', name: 'admin_new_community_idea' },
        { url: '/admin/planning_documents', name: 'admin_planning_documents' },
        { url: '/admin/planning_documents/new', name: 'admin_new_planning_document' },
        { url: '/admin/submissions', name: 'admin_submissions' },
        { url: '/admin/topics', name: 'admin_topics' },
        { url: '/admin/topics/new', name: 'admin_new_topic' },
        { url: '/admin/users', name: 'admin_users' },
        { url: '/admin/broadcasts', name: 'admin_broadcasts' },
        { url: '/admin/broadcasts/new', name: 'admin_new_broadcast' }
      ];

      console.log('\n=== CAPTURING ADMIN AUTHENTICATED PAGES ===');
      if (!fs.existsSync('screenshots/admin_authenticated')) {
        fs.mkdirSync('screenshots/admin_authenticated', { recursive: true });
      }

      for (const pageConfig of adminPages) {
        try {
          console.log(`Capturing: ${pageConfig.url}`);
          await page.goto(`${BASE_URL}${pageConfig.url}`, { waitUntil: 'networkidle2', timeout: 15000 });
          await new Promise(resolve => setTimeout(resolve, 2000));
          
          const filepath = path.join('screenshots', 'admin_authenticated', `${pageConfig.name}.png`);
          await page.screenshot({ path: filepath, fullPage: true });
          console.log(`✓ Saved: ${filepath}`);
        } catch (error) {
          console.error(`✗ Error capturing ${pageConfig.url}:`, error.message);
        }
      }
      
    } catch (error) {
      console.log('Admin access denied:', error.message);
    }
    
  } catch (error) {
    console.error('Login failed:', error.message);
  }

  await browser.close();
  console.log('\n=== ADMIN SCREENSHOT CAPTURE COMPLETE ===');
  
  if (fs.existsSync('screenshots/admin_authenticated')) {
    const adminCount = fs.readdirSync('screenshots/admin_authenticated').length;
    console.log(`Admin pages captured: ${adminCount} screenshots`);
  }
}

captureAdminScreenshots().catch(console.error);