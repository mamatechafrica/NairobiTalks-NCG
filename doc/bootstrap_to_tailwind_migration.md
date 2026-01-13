Bootstrap → Tailwind Migration Audit

Goal: Replace Bootstrap usage with Tailwind CSS and tokens to standardize styling and component design.

High-level plan:
1. Audit & list files using Bootstrap classes (below).
2. Replace global layout includes (Bootstrap CSS/JS removed). ✅
3. Replace components in priority order: navigation, buttons & badges, cards, forms, modals, grids.
4. Add visual regression tests and a11y checks.
5. Iterate per PR (one component per PR).

Files with Bootstrap usage (initial non-exhaustive audit):
- `app/views/layouts/application.html.erb` — nav, footer, flash, grid classes
- `app/views/layouts/admin_sidebar.html.erb` — admin nav & many nav item classes
- `app/views/pages/landing.html.erb` — grid/col/card usage
- `app/views/community_ideas/_idea_card.html.erb` — card, buttons (uses btn-like patterns)
- `app/views/community_ideas/_voting_cards.html.erb` — carousel controls & buttons
- `app/views/community_ideas/show.html.erb` — comment list uses card classes
- `app/views/submissions/new.html.erb` — form uses bootstrap structure
- `app/views/users/*` — profile/dashboard pages use grid/layout classes
- `app/views/admin/*` — many admin pages use `btn`, `card`, `table`, `badge`, etc.

Recommended component mapping examples:
- `btn`, `btn-primary`, `btn-outline` → Tailwind `inline-flex px-4 py-2 rounded-md bg-primary text-primary-foreground` etc.
- `row` / `col-*` → Tailwind grid/flex utilities (e.g., `grid grid-cols-1 md:grid-cols-3 gap-4`)
- `card` → Tailwind utilities + tokenized classes (e.g., `bg-card shadow-elevation-1 rounded-lg p-4`)
- `modal` → Use Stimulus controller to manage focus + Tailwind modal classes

Testing & QA:
- Add a visual regression step for migrated pages (Percy or pa11y) to ensure no regressions when swapping classes.
- Add axe-core checks for accessibility during PRs.

How I can help next (pick one):
- Implement an initial PR to migrate the global navbar to Tailwind (quick, visible win).
- Generate a complete file list with exact bootstrap classes used (for the designer to provide replacements).
- Start migrating admin sidebar to Tailwind (desktop-first) and create a small Tailwind component in `app/components` or partials.

If you want, I can start with the navbar migration (desktop + mobile) as the first PR — shall I proceed?