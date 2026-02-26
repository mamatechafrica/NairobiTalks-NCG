# Google Sheets Setup for Nairobi Talks Static Demo

## Overview
Create a Google Sheet with the following tabs to power the static demo site with real data.

---

## Sheet 1: "stats" (Homepage stats)

| Column | Example |
|--------|---------|
| ideas | 156 |
| comments | 423 |
| users | 89 |

**URL format:** `https://docs.google.com/spreadsheets/d/YOUR_SHEET_ID/export?format=csv&sheet=stats`

---

## Sheet 2: "ideas" (Community Ideas List)

| title | description | topic | sub_county | status | votes | comments |
|-------|-------------|-------|------------|--------|-------|----------|
| Improve Public Transport in Westlands | Add more bus routes... | Transportation | Westlands | Under Review | 45 | 12 |
| Community Garden in Kibra | Create urban gardens... | Environment | Kibra | New | 32 | 8 |
| Digital Literacy Program for Youth | Free computer training... | Education | Dagoretti North | Approved | 67 | 15 |

---

## Sheet 3: "comments" (Comments on ideas)

| user | body | time |
|------|------|------|
| mary_k | This is a great idea! | 2 hours ago |
| john_d | I fully support this. | 5 hours ago |

---

## Sheet 4: "dashboard" (Admin Dashboard Stats)

| ideas | documents | votes | users |
|-------|-----------|-------|-------|
| 156 | 23 | 1247 | 89 |

---

## Sheet 5: "recent_ideas" (Admin table)

| title | topic | sub_county | status | votes | date |
|-------|-------|------------|--------|-------|------|
| Improve Public Transport | Transportation | Westlands | Under Review | 45 | 2025-02-20 |
| Community Garden | Environment | Kibra | New | 32 | 2025-02-19 |

---

## How to Use

1. **Create a new Google Sheet**
2. **Rename tabs** to: `stats`, `ideas`, `comments`, `dashboard`, `recent_ideas`
3. **Copy the column headers** exactly as shown above
4. **Fill in your data**
5. **Publish to web**: File → Share → Publish to web → Select "Comma-separated values (.csv)" → Publish
6. **Copy the sheet ID** from the URL (between `/d/` and `/edit`)
7. **Update each HTML file** - find `YOUR_SHEET_ID_HERE` and replace with your actual sheet ID

## Sheet ID Location
```
https://docs.google.com/spreadsheets/d/ABC123XYZ456DEF789GHI/edit#gid=0
                              ^^^^^^^^^^^^^^^^
                              This is your sheet ID
```

---

## Notes
- All testers will see the same data
- Refresh the page to see updates from other users
- For voting/comments to persist, someone needs to manually update the sheet (there's no auto-sync from the static site back to the sheet)
