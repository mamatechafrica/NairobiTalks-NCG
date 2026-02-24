const puppeteer = require('puppeteer');
const fs = require('fs');
const path = require('path');

const BASE_URL = 'http://localhost:3000';

// Authenticated user pages (need logged-in user)
const authenticatedUserPages = [
  '/profile',
  '/profile/edit',
  '/community_ideas',
  '/community_ideas/new',
  '/planning_documents',
  '/planning_documents/new',
  '/submissions',
  '/submissions/new',
  '/topics',
  '/topics/new',
  '/ideas_explorer',
  '/data/analytics'
];

// Authenticated admin pages (need admin login)
const authenticatedAdminPages = [
  '/admin/dashboard',
  '/admin/analytics',
  '/admin/app_preview',
  '/admin/forum',
  '/admin/community_ideas',
  '/admin/community_ideas/new',
  '/admin/planning_documents',
  '/admin/planning_documents/new',
  '/admin/submissions',
  '/admin/topics',
  '/admin/topics/new',
  '/admin/users',
  '/admin/broadcasts',
  '/admin/broadcasts/new'
];

async function loginAsUser(page, email, password) {
  console.log(`Logging in as ${email}...`);
  await page.goto(`${BASE_URL}/users/sign_in`, { waitUntil: 'networkidle2' });
  await new Promise(resolve => setTimeout(resolve, 2000));
  await page.waitForSelector('input[name="user[email]"]', { timeout: 10000 });
  await page.type('input[name="user[email]"]', email);
  await page.type('input[name="user[password]"]', password);
  await page.click('input[type="submit"]');
  await page.waitForNavigation({ waitUntil: 'networkidle2', timeout: 10000 });
  console.log(`Successfully logged in as ${email}`);
}

async function loginAsAdmin(page, email, password) {
  console.log(`Logging in as admin ${email}...`);
  try {
    await page.goto(`${BASE_URL}/admin/login`, { waitUntil: 'networkidle2', timeout: 10000 });
    await new Promise(resolve => setTimeout(resolve, 2000));
    await page.waitForSelector('input[name="user[email]"]', { timeout: 10000 });
    await page.type('input[name="user[email]"]', email);
    await page.type('input[name="user[password]"]', password);
    await page.click('input[type="submit"]');
    await page.waitForNavigation({ waitUntil: 'networkidle2', timeout: 10000 });
    console.log(`Successfully logged in as admin ${email}`);
  } catch (error) {
    console.log(`Admin login failed, trying regular login with admin user...`);
    await loginAsUser(page, email, password);
    // Now navigate to admin
    await page.goto(`${BASE_URL}/admin`, { waitUntil: 'networkidle2' });
    console.log(`Successfully accessed admin as ${email}`);
  }
}

async function captureScreenshotsForUser(page, pages, directory, prefix) {
  console.log(`\nTaking screenshots for ${prefix} pages...`);
  
  if (!fs.existsSync(`screenshots/${directory}`)) {
    fs.mkdirSync(`screenshots/${directory}`, { recursive: true });
  }

  for (const url of pages) {
    try {
      console.log(`Capturing: ${url}`);
      await page.goto(`${BASE_URL}${url}`, { waitUntil: 'networkidle2', timeout: 30000 });
      await new Promise(resolve => setTimeout(resolve, 3000)); // Wait for dynamic content
      
      const filename = prefix + url.replace(/[\/:]/g, '_') + '.png';
      const filepath = path.join('screenshots', directory, filename);
      
      await page.screenshot({ path: filepath, fullPage: true });
      console.log(`✓ Saved: ${filepath}`);
    } catch (error) {
      console.error(`✗ Error capturing ${url}:`, error.message);
    }
  }
}

// Test accounts from README.md
const ADMIN_EMAIL = 'admin@nairobi.gov';
const ADMIN_PASSWORD = 'admin123';
const RESIDENT_EMAIL = 'resident@nairobi.gov';
const RESIDENT_PASSWORD = 'resident123';

async function takeAuthenticatedScreenshots() {
  // Use pre-configured test accounts from README.md

  const browser = await puppeteer.launch({ 
    headless: false, 
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  });
  
  // Create directories
  if (!fs.existsSync('screenshots')) {
    fs.mkdirSync('screenshots');
  }

  // Capture regular user authenticated pages
  console.log('\n=== CAPTURING RESIDENT USER PAGES ===');
  const userPage = await browser.newPage();
  await userPage.setViewport({ width: 1280, height: 800 });
  
  await loginAsUser(userPage, RESIDENT_EMAIL, RESIDENT_PASSWORD);
  await captureScreenshotsForUser(userPage, authenticatedUserPages, 'user_authenticated', 'resident_');
  await userPage.close();

  // Capture admin authenticated pages
  console.log('\n=== CAPTURING ADMIN USER PAGES ===');
  const adminPage = await browser.newPage();
  await adminPage.setViewport({ width: 1280, height: 800 });
  
  await loginAsAdmin(adminPage, ADMIN_EMAIL, ADMIN_PASSWORD);
  await captureScreenshotsForUser(adminPage, authenticatedAdminPages, 'admin_authenticated', 'admin_');
  
  // Also capture admin pages as regular user (should redirect/ show error)
  console.log('\n=== CAPTURING ADMIN PAGES AS REGULAR USER ===');
  await captureScreenshotsForUser(adminPage, ['/admin'], 'admin_authenticated', 'admin_as_regular_');
  
  await adminPage.close();
  await browser.close();
  
  console.log('\n=== AUTHENTICATED SCREENSHOT CAPTURE COMPLETE ===');
}

takeAuthenticatedScreenshots().catch(console.error);