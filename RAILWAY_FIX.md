# Railway Deployment Fix Guide

## 502 Error Solution

The 502 error on Railway is typically caused by:

1. **Missing health check endpoint** ✅ Added `/up` route
2. **Incorrect port binding** ✅ Fixed Puma config  
3. **Missing master key** ✅ Script handles this
4. **Database not ready** ✅ Added db:prepare

## Step-by-Step Fix

### 1. Railway Settings
- Go to your Railway project
- **Settings** → **Variables**
- Add these environment variables:
  ```
  RAILS_MASTER_KEY=your_master_key_here
  DATABASE_URL=your_postgres_connection_string
  RAILS_ENV=production
  RACK_ENV=production
  RAILS_SERVE_STATIC_FILES=enabled
  PORT=8080
  ```

### 2. Get Master Key
```bash
# On your local machine
cat config/master.key
```

### 3. Redeploy
- Push changes to GitHub
- In Railway: **Settings** → **New Deployment** → **Redeploy**

### 4. Check Logs
- Go to **Logs** tab in Railway
- Look for startup errors

## Common 502 Causes & Solutions

**If still failing:**

1. **Assets not precompiled** → Check `bin/rails assets:precompile` works locally
2. **Database connection** → Test DATABASE_URL locally first  
3. **Port binding** → Ensure Puma binds to 0.0.0.0:8080
4. **Missing dependencies** → Check `bundle install` works

## Quick Test Command
```bash
# Test locally in production mode
RAILS_ENV=production PORT=8080 bundle exec puma -C config/puma.rb
```

This should fix the 502 error. The key is proper environment variables and ensuring the health check works!