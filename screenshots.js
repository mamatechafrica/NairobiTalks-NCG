const puppeteer = require('puppeteer');
const fs = require('fs');
const path = require('path');

const BASE_URL = 'http://localhost:3000';

// User pages
const userPages = [
  '/',
  '/landing',
  '/users/sign_up',
  '/users/sign_in',
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

// Admin pages (will need authentication)
const adminPages = [
  '/admin',
  '/admin/login',
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

async function takeScreenshots() {
  const browser = await puppeteer.launch({ 
    headless: false, // Set to true for server environments
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  });
  
  const page = await browser.newPage();
  
  // Set viewport size
  await page.setViewport({ width: 1280, height: 800 });
  
  // Create directories
  if (!fs.existsSync('screenshots')) {
    fs.mkdirSync('screenshots');
  }
  if (!fs.existsSync('screenshots/user')) {
    fs.mkdirSync('screenshots/user');
  }
  if (!fs.existsSync('screenshots/admin')) {
    fs.mkdirSync('screenshots/admin');
  }

  console.log('Taking screenshots of user pages...');
  
  for (const url of userPages) {
    try {
      console.log(`Capturing: ${url}`);
      await page.goto(`${BASE_URL}${url}`, { waitUntil: 'networkidle2', timeout: 30000 });
      await new Promise(resolve => setTimeout(resolve, 2000)); // Wait for any dynamic content to load
      
      const filename = url.replace(/[\/:]/g, '_') + '.png';
      const filepath = path.join('screenshots', 'user', filename);
      
      await page.screenshot({ path: filepath, fullPage: true });
      console.log(`✓ Saved: ${filepath}`);
    } catch (error) {
      console.error(`✗ Error capturing ${url}:`, error.message);
    }
  }

  console.log('\nTaking screenshots of admin pages...');
  
  for (const url of adminPages) {
    try {
      console.log(`Capturing: ${url}`);
      await page.goto(`${BASE_URL}${url}`, { waitUntil: 'networkidle2', timeout: 30000 });
      await new Promise(resolve => setTimeout(resolve, 2000));
      
      const filename = url.replace(/[\/:]/g, '_') + '.png';
      const filepath = path.join('screenshots', 'admin', filename);
      
      await page.screenshot({ path: filepath, fullPage: true });
      console.log(`✓ Saved: ${filepath}`);
    } catch (error) {
      console.error(`✗ Error capturing ${url}:`, error.message);
    }
  }

  await browser.close();
  console.log('\nScreenshot capture complete!');
}

takeScreenshots().catch(console.error);