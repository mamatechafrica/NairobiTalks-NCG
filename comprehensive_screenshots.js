const puppeteer = require('puppeteer');
const fs = require('fs');
const path = require('path');

const BASE_URL = 'http://localhost:3000';

async function captureAllScreenshots() {
  const browser = await puppeteer.launch({ 
    headless: false, 
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  });
  
  const page = await browser.newPage();
  await page.setViewport({ width: 1280, height: 800 });
  
  // Create directories
  if (!fs.existsSync('screenshots')) {
    fs.mkdirSync('screenshots');
  }
  if (!fs.existsSync('screenshots/public')) {
    fs.mkdirSync('screenshots/public');
  }
  if (!fs.existsSync('screenshots/authenticated')) {
    fs.mkdirSync('screenshots/authenticated');
  }

  // Public pages (no login required)
  const publicPages = [
    { url: '/', name: 'landing_page' },
    { url: '/landing', name: 'landing_alt' },
    { url: '/users/sign_up', name: 'signup_page' },
    { url: '/users/sign_in', name: 'signin_page' },
    { url: '/community_ideas', name: 'public_community_ideas' },
    { url: '/planning_documents', name: 'public_planning_documents' },
    { url: '/admin/login', name: 'admin_login_page' }
  ];

  console.log('=== CAPTURING PUBLIC PAGES ===');
  for (const pageConfig of publicPages) {
    try {
      console.log(`Capturing: ${pageConfig.url}`);
      await page.goto(`${BASE_URL}${pageConfig.url}`, { waitUntil: 'networkidle2', timeout: 15000 });
      await new Promise(resolve => setTimeout(resolve, 2000));
      
      const filepath = path.join('screenshots', 'public', `${pageConfig.name}.png`);
      await page.screenshot({ path: filepath, fullPage: true });
      console.log(`✓ Saved: ${filepath}`);
    } catch (error) {
      console.error(`✗ Error capturing ${pageConfig.url}:`, error.message);
    }
  }

  // Try to login as resident and capture authenticated pages
  console.log('\n=== TRYING RESIDENT LOGIN ===');
  try {
    await page.goto(`${BASE_URL}/users/sign_in`, { waitUntil: 'networkidle2' });
    await new Promise(resolve => setTimeout(resolve, 2000));
    
    // Try different selectors for email input
    const emailSelectors = [
      'input[name="user[email]"]',
      'input[type="email"]',
      '#user_email',
      'input[placeholder*="Email"]',
      'input[placeholder*="email"]'
    ];
    
    let emailInput = null;
    for (const selector of emailSelectors) {
      try {
        await page.waitForSelector(selector, { timeout: 2000 });
        emailInput = await page.$(selector);
        if (emailInput) {
          console.log(`Found email input with selector: ${selector}`);
          break;
        }
      } catch (e) {
        // Continue to next selector
      }
    }

    if (emailInput) {
      await emailInput.type('resident@nairobi.gov');
      
      // Try different selectors for password input
      const passwordSelectors = [
        'input[name="user[password]"]',
        'input[type="password"]',
        '#user_password',
        'input[placeholder*="Password"]',
        'input[placeholder*="password"]'
      ];
      
      let passwordInput = null;
      for (const selector of passwordSelectors) {
        try {
          await page.waitForSelector(selector, { timeout: 2000 });
          passwordInput = await page.$(selector);
          if (passwordInput) {
            console.log(`Found password input with selector: ${selector}`);
            break;
          }
        } catch (e) {
          // Continue to next selector
        }
      }

      if (passwordInput) {
        await passwordInput.type('resident123');
        
        // Try to find and click submit button
        const submitSelectors = [
          'input[type="submit"]',
          'button[type="submit"]',
          '.btn-primary',
          '.btn',
          'button:contains("Log in")',
          'button:contains("Sign in")'
        ];
        
        for (const selector of submitSelectors) {
          try {
            await page.waitForSelector(selector, { timeout: 2000 });
            await page.click(selector);
            console.log(`Clicked submit with selector: ${selector}`);
            break;
          } catch (e) {
            // Continue to next selector
          }
        }

        await new Promise(resolve => setTimeout(resolve, 3000));
        
        // Check if login was successful by looking for logout link or profile link
        const isLoggedIn = await page.evaluate(() => {
          return document.body.innerText.includes('Sign out') || 
                 document.body.innerText.includes('Logout') ||
                 document.body.innerText.includes('Profile') ||
                 window.location.pathname.includes('/profile');
        });

        if (isLoggedIn) {
          console.log('✓ Resident login successful!');
          
          // Capture authenticated resident pages
          const residentPages = [
            { url: '/profile', name: 'resident_profile' },
            { url: '/community_ideas', name: 'resident_community_ideas' },
            { url: '/community_ideas/new', name: 'resident_new_community_idea' },
            { url: '/planning_documents', name: 'resident_planning_documents' },
            { url: '/submissions', name: 'resident_submissions' },
            { url: '/submissions/new', name: 'resident_new_submission' }
          ];

          console.log('\n=== CAPTURING RESIDENT AUTHENTICATED PAGES ===');
          for (const pageConfig of residentPages) {
            try {
              console.log(`Capturing: ${pageConfig.url}`);
              await page.goto(`${BASE_URL}${pageConfig.url}`, { waitUntil: 'networkidle2', timeout: 15000 });
              await new Promise(resolve => setTimeout(resolve, 2000));
              
              const filepath = path.join('screenshots', 'authenticated', `${pageConfig.name}.png`);
              await page.screenshot({ path: filepath, fullPage: true });
              console.log(`✓ Saved: ${filepath}`);
            } catch (error) {
              console.error(`✗ Error capturing ${pageConfig.url}:`, error.message);
            }
          }
        } else {
          console.log('✗ Resident login failed');
        }
      }
    }
  } catch (error) {
    console.error('Resident login error:', error.message);
  }

  // Try to access admin pages (even if login fails, we'll see what's displayed)
  console.log('\n=== TRYING ADMIN PAGES ===');
  const adminPages = [
    { url: '/admin', name: 'admin_dashboard' },
    { url: '/admin/dashboard', name: 'admin_dashboard_alt' },
    { url: '/admin/users', name: 'admin_users' },
    { url: '/admin/community_ideas', name: 'admin_community_ideas' },
    { url: '/admin/submissions', name: 'admin_submissions' },
    { url: '/admin/analytics', name: 'admin_analytics' }
  ];

  for (const pageConfig of adminPages) {
    try {
      console.log(`Capturing: ${pageConfig.url}`);
      await page.goto(`${BASE_URL}${pageConfig.url}`, { waitUntil: 'networkidle2', timeout: 15000 });
      await new Promise(resolve => setTimeout(resolve, 2000));
      
      const filepath = path.join('screenshots', 'authenticated', `${pageConfig.name}.png`);
      await page.screenshot({ path: filepath, fullPage: true });
      console.log(`✓ Saved: ${filepath}`);
    } catch (error) {
      console.error(`✗ Error capturing ${pageConfig.url}:`, error.message);
    }
  }

  await browser.close();
  console.log('\n=== SCREENSHOT CAPTURE COMPLETE ===');
  
  // Summary
  const publicCount = fs.readdirSync('screenshots/public').length;
  const authCount = fs.readdirSync('screenshots/authenticated').length;
  console.log(`\nSummary:`);
  console.log(`- Public pages: ${publicCount} screenshots`);
  console.log(`- Authenticated pages: ${authCount} screenshots`);
  console.log(`- Total: ${publicCount + authCount} screenshots`);
}

captureAllScreenshots().catch(console.error);