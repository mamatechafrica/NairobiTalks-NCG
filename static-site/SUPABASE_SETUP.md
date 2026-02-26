# Supabase Setup for Nairobi Talks

## Overview
Supabase is an open-source Firebase alternative powered by PostgreSQL. It provides:
- Real-time database
- User authentication
- Row-level security

---

## Step 1: Create Supabase Project

1. Go to [supabase.com](https://supabase.com) and sign in
2. Click "New Project"
3. Fill in details:
   - **Name:** Nairobi Talks
   - **Database Password:** (create a strong password)
   - **Region:** (select closest to you)
4. Wait for project to provision (~2 minutes)

---

## Step 2: Get Credentials

1. Go to **Project Settings** (gear icon) → **API**
2. Copy:
   - **Project URL** (e.g., `https://xyzabc.supabase.co`)
   - **anon public** key (e.g., `eyJhbGciOiJIUzI1NiIs...`)

---

## Step 3: Create Database Tables

Go to **SQL Editor** in Supabase and run this:

```sql
-- Enable real-time
ALTER PUBLICATION supabase_realtime ADD TABLE ideas;
ALTER PUBLICATION supabase_realtime ADD TABLE comments;
ALTER PUBLICATION supabase_realtime ADD TABLE votes;
ALTER PUBLICATION supabase_realtime ADD TABLE users;

-- Create users table
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email TEXT UNIQUE NOT NULL,
  name TEXT,
  role TEXT DEFAULT 'user',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create ideas table
CREATE TABLE ideas (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT NOT NULL,
  description TEXT,
  topic TEXT,
  sub_county TEXT,
  ward TEXT,
  status TEXT DEFAULT 'new',
  votes_up INTEGER DEFAULT 0,
  votes_down INTEGER DEFAULT 0,
  user_id UUID REFERENCES users(id),
  is_anonymous BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create comments table
CREATE TABLE comments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  idea_id UUID REFERENCES ideas(id) ON DELETE CASCADE,
  user_id UUID REFERENCES users(id),
  body TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create votes table
CREATE TABLE votes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  idea_id UUID REFERENCES ideas(id) ON DELETE CASCADE,
  user_id UUID REFERENCES users(id),
  vote_type TEXT CHECK (vote_type IN ('up', 'down')),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(idea_id, user_id)
);

-- Create indexes
CREATE INDEX idx_ideas_status ON ideas(status);
CREATE INDEX idx_ideas_topic ON ideas(topic);
CREATE INDEX idx_ideas_sub_county ON ideas(sub_county);
CREATE INDEX idx_comments_idea ON comments(idea_id);
CREATE INDEX idx_votes_idea ON votes(idea_id);

-- Insert sample data
INSERT INTO users (email, name, role) VALUES 
  ('admin@nairobi.gov', 'Admin User', 'admin'),
  ('john@example.com', 'John Doe', 'user'),
  ('sarah@example.com', 'Sarah Kimani', 'user');

INSERT INTO ideas (title, description, topic, sub_county, ward, status, votes_up, votes_down) VALUES
  ('Improve Public Transport in Westlands', 'Add more bus routes and dedicated lanes to reduce commute times for thousands of commuters.', 'Transportation', 'Westlands', 'Westlands', 'under_review', 45, 3),
  ('Community Garden in Kibra', 'Create urban gardens to improve food security and provide community spaces for residents.', 'Environment', 'Kibra', 'Laini Saba', 'new', 32, 8),
  ('Digital Literacy Program for Youth', 'Free computer training for unemployed youth to improve their job prospects.', 'Education', 'Dagoretti North', 'Kilimani', 'approved', 67, 2),
  ('Better Street Lighting in Eastleigh', 'Install LED street lights to improve safety in commercial areas.', 'Infrastructure', 'Starehe', 'Nairobi Central', 'under_review', 28, 5),
  ('Mobile Health Clinics', 'Bring basic healthcare services to underserved areas of Nairobi.', 'Health', 'Embakasi', 'Kware', 'new', 51, 9),
  ('Recycling Program for Residential Areas', 'Implement weekly recycling collection to reduce waste.', 'Environment', 'Langata', 'Karen', 'implemented', 89, 4);

INSERT INTO comments (idea_id, user_id, body) 
SELECT 
  i.id,
  u.id,
  c.body
FROM ideas i
CROSS JOIN (VALUES 
  ('This is a great idea! Westlands traffic is terrible in the mornings.'),
  ('I fully support this. Public transport improvement is badly needed.')
) AS c(body)
LEFT JOIN users u ON u.email = 'john@example.com'
WHERE i.title = 'Improve Public Transport in Westlands'
LIMIT 2;
```

---

## Step 4: Update Your Static Site

### Option A: Use Supabase JS Client

In each HTML file, replace the JavaScript to use Supabase:

```html
<script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2"></script>
<script>
  // Replace with your credentials
  const supabaseUrl = 'YOUR_SUPABASE_URL';
  const supabaseKey = 'YOUR_SUPABASE_ANON_KEY';
  
  const { createClient } = supabase;
  const _supabase = createClient(supabaseUrl, supabaseKey);

  // Example: Fetch ideas
  async function loadIdeas() {
    const { data, error } = await _supabase
      .from('ideas')
      .select('*')
      .order('created_at', { ascending: false });
    
    if (error) console.error('Error:', error);
    return data || [];
  }
</script>
```

### Option B: Keep Demo Mode (no database)

If you don't want to set up Supabase yet, keep using the demo data in the JavaScript. The site works the same way - just no data persistence.

---

## Step 5: Enable Anonymous Access (Optional)

For public voting without login, update Row Level Security:

```sql
-- Disable RLS for demo (not recommended for production)
ALTER TABLE ideas DISABLE ROW LEVEL SECURITY;
ALTER TABLE comments DISABLE ROW LEVEL SECURITY;
ALTER TABLE votes DISABLE ROW LEVEL SECURITY;
ALTER TABLE users DISABLE ROW LEVEL SECURITY;
```

---

## Environment Variables for Production

When deploying, use environment variables:

```html
<script>
  const supabaseUrl = window.location.hostname === 'localhost' 
    ? 'http://localhost:54321'  // Local development
    : 'https://your-project.supabase.co';  // Production
    
  const supabaseKey = window.ENV?.SUPABASE_KEY || 'your-anon-key';
</script>
```

---

## Troubleshooting

**CORS errors?** Add your domain to Supabase → Settings → API → Trusted domains

**Data not loading?** Check browser console for errors

**Real-time not working?** Ensure RLS policies allow anonymous access
