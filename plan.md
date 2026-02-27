# Flaming Gryphon Order of Precedence — Django Web App Plan

## Context

Porting a legacy PHP/MySQL SCA Order of Precedence system for the Barony of the Flaming Gryphon to a Django web app. The only artifact from the old system is a MySQL database dump (`gryphony_OP.sql.zip`). The new app will provide public browsing of members, awards, and events, plus authenticated management of records, recommendations, error reporting, and a draft court list system.

**Key data discovery:** 99 external honorkeys (Kingdom-level awards from the Midrealm) are referenced in bestowals but not defined in the local `op_honors` table. The old app fetched these from `api.midrealm.org/honor/` at runtime. The Midrealm Kingdom OP is at https://midrealm.org/order-of-precedence/ — we plan to obtain a local copy of Kingdom honor data and periodically sync it, rather than calling an API at runtime. During import, external honors are created as placeholders and backfilled later.

**Legacy data quirks discovered:**
- `op_recipients` has NO group affiliation — only `op_recommendations` has a free-text `shire` field
- `op_bestowals.event` is free-text (varchar 50), NOT a FK to `op_calendar` — only 361 of 2,079 bestowals have event text, with inconsistent naming (typos like "Baronila Twelfth Night", "Grant Tournament" vs "Grand Tournament")
- `op_calendar` only has 38 events starting from 2011
- Dirty data: 3 bestowals with reckey=0, 3 with honorkey=0, 1 fully null row (ID=2071), HTML entities in recommendations (`&quot;`, `&Atilde;&deg;`), escaped quotes (`\''`), empty altname on row 282, category value `'bfg'` on honorkey 296
- `op_recevents` is a many-to-many junction between recommendations and events (42 rows)
- `op_recommendations` stores recommender info as inline text (yourscaname, youremail, etc.), not as a FK
- `op_sources` table exists but is empty
- `op_reportStatus` has "Closed (no resolution)" as a status value

## Tech Stack

- **Python 3.12+** managed via **uv**
- **Django 5.x** with **django-htmx**, **django-filter**, **whitenoise**
- **PostgreSQL** via **psycopg**
- **Docker Compose** (Django + Postgres)
- **HTMX** for interactive UI sprinkles
- **TDD** throughout

## App Structure

Single Django project (`config/`) with two apps:
- **`op/`** — Core domain: recipients, honors, bestowals, events, groups, site config
- **`accounts/`** — Auth: admin-approved registration, roles (admin vs. user)

## Implementation Steps

Each step is a self-contained prompt that builds on the previous one. Steps end with working, wired-together code.

---

### Step 1: Project Scaffolding

Set up the Django project with uv, Docker Compose, and basic config.

```text
Create a new Django project in /home/parker/repos/WH_op using uv.

1. Run `uv init` to create pyproject.toml
2. Add dependencies: django, psycopg[binary], django-htmx, django-filter, whitenoise, gunicorn
3. Add dev dependencies: pytest, pytest-django, factory-boy, coverage
4. Run `django-admin startproject config .` to create the Django project in the repo root
5. Create two Django apps: `op` and `accounts`
6. Configure settings:
   - Use environment variables for SECRET_KEY, DEBUG, DATABASE_URL
   - PostgreSQL as the database backend
   - Add django_htmx, django_filters, whitenoise to INSTALLED_APPS/middleware
   - Set up static files with whitenoise
   - Set TIME_ZONE to 'America/New_York' (Ohio barony)
7. Create Docker Compose with:
   - `db` service: postgres:16-alpine, persistent volume, port 5432
   - `web` service: builds from Dockerfile, depends on db, port 8000
   - Use the multistage uv Dockerfile pattern from CLAUDE.md docs
8. Create a .env.example with all required env vars
9. Create .gitignore for Python/Django
10. Add a pytest.ini / conftest.py for pytest-django
11. Create a SiteConfig model in op/ that replaces the old op_configuration key-value table with proper fields (group_name_short, group_name_long, admin_name, admin_email, coronet)
12. Write a test that the app boots and the index page returns 200

All files must start with a 2-line ABOUTME comment.
Commit: "feat: scaffold Django project with Docker Compose and basic config"
```

---

### Step 2: Core Data Models

Define the domain models mapping from the legacy schema.

```text
Create Django models in op/models.py mapping the legacy database schema.

Models to create:

1. **Recipient** (was op_recipients)
   - sca_name (CharField 250), mundane_name (CharField 250, blank)
   - gender (CharField choices M/F/blank), active (BooleanField)
   - group (FK to Group, null, blank — optional; legacy data has no group on recipients)
   - name_registered (BooleanField), device_registered (BooleanField)
   - device_blazon (TextField, blank)
   - __str__ returns sca_name

2. **AlternateName** (was op_altnames)
   - recipient (FK to Recipient), name (CharField 120)
   - is_nickname (BooleanField), is_former_name (BooleanField), is_registered (BooleanField)

3. **Honor** (was op_honors)
   - legacy_key (PositiveIntegerField, unique, null — preserves original honorkey for cross-referencing)
   - name (CharField 120), prefix (CharField 30, blank — was "type" like "Award of the")
   - description (TextField, blank), abbreviation (CharField 15, blank)
   - level (IntegerField, default=0), is_active (BooleanField — was "status")
   - category (CharField choices: BARONIAL, CHAMPION, EXTERNAL — maps BAR/FGCH plus external Kingdom awards; also handle legacy 'bfg' as BARONIAL)
   - accepts_recommendations (BooleanField — was "rec")
   - is_external (BooleanField, default=False — for Kingdom-level honors imported from bestowals)

4. **HonorImage** (was op_honorimages)
   - honor (FK to Honor), image (ImageField — store as files, not BLOBs)

5. **Event** (was op_calendar)
   - name (CharField 120), date (DateField)
   - __str__ returns "name (date)"

6. **Bestowal** (was op_bestowals)
   - sort_date (DateField, null — legacy has one fully null row)
   - display_date (CharField 13, blank — for uncertain dates like "2/?/84")
   - sequence (CharField 5, blank — ordering within a date)
   - event_name (CharField 50, blank — legacy free-text event name)
   - event (FK to Event, null — link to calendar event when possible)
   - recipient (FK to Recipient), honor (FK to Honor)
   - notes (CharField 255, blank)
   - is_draft (BooleanField, default=False — for the court list planning feature)

7. **Group** (was op_groups)
   - name (CharField 120, unique), designator (CharField 120, blank — "Marche of", "College of")

Write model tests:
- Test creating each model and its __str__
- Test FK relationships (bestowal -> recipient, bestowal -> honor, etc.)
- Test that AlternateName correctly links to Recipient
- Test Recipient group FK is optional (null is valid)

Run migrations. Commit: "feat: add core domain models for OP system"
```

---

### Step 3: Data Import Management Command

Create a management command to import legacy MySQL data.

```text
Create a Django management command `op/management/commands/import_legacy_sql.py` that:

1. Takes the path to gryphony_OP.sql (already unzipped) as an argument
2. Parses INSERT statements using regex (the SQL is simple phpMyAdmin format)
3. Imports in this order (respecting FK dependencies):
   a. op_groups -> Group
   b. op_honors -> Honor
      - Mapping: type->prefix, catagory->category (BAR->BARONIAL, FGCH->CHAMPION, 'bfg'->BARONIAL), status->is_active, rec->accepts_recommendations
      - Preserve original honorkey in legacy_key field
   c. op_recipients -> Recipient (mapping: scaname->sca_name, mname->mundane_name)
      - Group field left null (legacy recipients have no group affiliation)
   d. op_altnames -> AlternateName
      - Mapping: altname->name, nickname->is_nickname, formername->is_former_name, registered->is_registered
      - Skip rows with empty name (row 282)
   e. op_calendar -> Event
   f. op_bestowals -> Bestowal
      - For honorkeys not in op_honors (99 external Kingdom-level awards), create Honor entries with is_external=True, category=EXTERNAL, name="External Honor #<key>"
      - Skip fully null rows (ID=2071: NULL sortdate, reckey=0, honorkey=0)
      - Handle reckey=0 rows: skip or log warning (3 rows reference non-existent recipients)
      - Attempt to fuzzy-match free-text event names to op_calendar entries (e.g., normalize "Baronila Twelfth Night" -> "Baronial Twelfth Night" if a close match exists)
   g. op_honorimages -> extract BLOB data to files, create HonorImage entries
   h. op_configuration -> SiteConfig (map key-value pairs to model fields, skip path-related keys like libdir/cssdir/imgdir/admdir/incdir/scriptdir)

4. Skip auth tables (op_users, op_collection, op_permission, op_collection2permission, op_user2collection) — we'll use Django's auth
5. Skip op_sources (empty table)
6. Skip op_recommendations and op_reports for now (imported in Steps 8 and 9)
7. Skip op_recevents for now (imported with recommendations in Step 8)
8. Use transactions for atomicity
9. Print progress counts per table
10. Handle encoding quirks: decode HTML entities (&quot; -> ", &Atilde;&deg; -> ð, etc.), normalize escaped quotes (\'' -> ')

Write tests:
- Test parsing a few sample INSERT statements
- Test the honor category mapping (BAR, FGCH, bfg)
- Test handling of external honorkeys (creates placeholder Honor)
- Test HTML entity decoding
- Test skipping dirty data rows

Commit: "feat: add legacy SQL import management command"
```

---

### Step 3.5: Import Verification Command

Verify data parity between the SQL dump and the imported Django data.

```text
Create a Django management command `op/management/commands/verify_import.py` that:

1. Takes the path to gryphony_OP.sql as an argument (same as import command)
2. Counts rows in the SQL dump vs Django models for each table:
   - op_groups (6) vs Group
   - op_honors (20) vs Honor (excluding external honors)
   - op_recipients (640) vs Recipient
   - op_altnames (46) vs AlternateName
   - op_calendar (38) vs Event
   - op_bestowals (2079) vs Bestowal (reports expected skips)
   - op_honorimages (5) vs HonorImage
   - op_configuration (11 total, ~5 relevant) vs SiteConfig fields
3. Reports the count of external honors created (expected: ~99)
4. FK integrity check: every Bestowal's recipient_id and honor_id point to real records
5. Spot-check: picks 5 random recipients and prints their SCA name + bestowal count from both sources
6. Lists all skipped/orphaned rows with reasons (null data, reckey=0, etc.)
7. Exits with code 0 if all counts match (within expected skips), code 1 if mismatches found

Write tests:
- Test verification passes after a clean import
- Test verification catches a missing recipient

Commit: "feat: add import verification command"
```

---

### Step 4: Public Views — Person Search & Detail

Build the public-facing person lookup.

```text
Create public views for browsing recipients in op/views.py and templates.

1. Create a base template (templates/base.html) with:
   - Site name from SiteConfig
   - Navigation: Home, People, Awards, Events
   - HTMX script tag
   - Simple, clean CSS (can use Pico CSS or similar classless framework)

2. **Home page** (op/views.py: IndexView)
   - Welcome text, quick search box, recent bestowals
   - URL: /

3. **Person search** (op/views.py: RecipientListView)
   - Search by SCA name (includes alternate names), mundane name
   - Filter by active/inactive
   - Filter by group (optional — many recipients will have no group)
   - Paginated results
   - HTMX: live search as you type
   - URL: /people/

4. **Person detail** (op/views.py: RecipientDetailView)
   - SCA name, mundane name, alternate names, group (if set)
   - All bestowals ordered by date (with honor name, date, event, notes)
   - Registration status (name, device, blazon)
   - URL: /people/<pk>/

5. Wire up URL patterns in op/urls.py and include in config/urls.py

Write tests:
- Test index page loads
- Test person search with various queries
- Test person detail shows bestowals
- Test search finds people by alternate names
- Test group filter works (including showing recipients with no group)

Commit: "feat: add public person search and detail views"
```

---

### Step 5: Public Views — Award Rolls & Event History

Build award browsing and event history pages.

```text
Create views for browsing awards and events.

1. **Award list** (op/views.py: HonorListView)
   - List all active honors grouped by category (Baronial Awards, Champion Positions)
   - Separate section for External/Kingdom honors
   - Show name, prefix, abbreviation, description
   - Count of recipients for each
   - URL: /awards/

2. **Award detail / roll** (op/views.py: HonorDetailView)
   - Honor name, description, badge image if available
   - Full roll of recipients who have received this honor, ordered by date
   - For champion positions: show chronological list of holders
   - URL: /awards/<pk>/

3. **Event list** (op/views.py: EventListView)
   - Chronological list of events, most recent first
   - URL: /events/

4. **Event detail** (op/views.py: EventDetailView)
   - Event name, date
   - All bestowals that happened at this event (linked via FK or matching event_name)
   - URL: /events/<pk>/

Write tests:
- Test award list groups correctly
- Test award roll shows recipients
- Test event list ordering
- Test event detail shows bestowals

Commit: "feat: add public award rolls and event history views"
```

---

### Step 6: Authentication — Admin-Approved Registration

Build the account request and approval system.

```text
Create the accounts app with admin-approved registration.

1. **User model** (accounts/models.py)
   - Extend Django's AbstractUser or use a profile model
   - Add: sca_name (CharField), is_approved (BooleanField, default=False)
   - Users cannot log in until is_approved=True

2. **Registration view** (accounts/views.py: RegisterView)
   - Form: username, email, sca_name, password
   - On submit: create user with is_approved=False
   - Show "Your account request has been submitted" message
   - URL: /accounts/register/

3. **Login/Logout** — use Django's built-in auth views
   - Custom login template that checks is_approved and shows message if not approved
   - URL: /accounts/login/, /accounts/logout/

4. **Admin approval** — use Django admin or a simple admin-only view
   - List pending users (is_approved=False)
   - Approve/deny buttons
   - URL: /accounts/admin/pending/

5. **Custom auth backend** that rejects unapproved users at login

6. Update base template navigation to show login/logout/register links

Write tests:
- Test registration creates unapproved user
- Test unapproved user cannot log in
- Test approved user can log in
- Test admin can approve users

Commit: "feat: add admin-approved user registration"
```

---

### Step 7: Authenticated CRUD — Events, People, Awards, Bestowals

Add create/edit forms for authenticated users.

```text
Create authenticated CRUD views for managing OP data. All require login.

1. **Recipient CRUD**
   - CreateView, UpdateView for recipients
   - Inline formset for alternate names on the edit page
   - Group field as optional dropdown
   - Fuzzy duplicate detection: when creating a new recipient, search existing SCA names and alternate names for similar matches and warn the user before creating a duplicate
   - URL: /people/new/, /people/<pk>/edit/

2. **Honor CRUD** (admin only)
   - CreateView, UpdateView for honors
   - Image upload for badge
   - URL: /awards/new/, /awards/<pk>/edit/

3. **Event CRUD**
   - CreateView, UpdateView for events
   - URL: /events/new/, /events/<pk>/edit/

4. **Bestowal CRUD**
   - Create from recipient detail page ("Add award to this person")
   - Create from event detail page ("Add bestowal to this event")
   - Form with: recipient (autocomplete), honor (select), date, event, notes
   - HTMX: recipient name autocomplete with quick-create — if the person doesn't exist, an inline "create new recipient" form appears (HTMX modal or expandable section) so you don't have to leave the page
   - URL: /bestowals/new/, /bestowals/<pk>/edit/

5. **Batch bestowal entry** ("Record Court" view)
   - Select an event (or create a new one)
   - Add multiple recipient+honor pairs in one form
   - Each row: recipient (autocomplete), honor (select), notes
   - All share the same date/event
   - HTMX: add more rows dynamically
   - This is the primary workflow for recording awards given at an event after the fact
   - URL: /bestowals/batch/

6. Add @login_required decorators / LoginRequiredMixin
7. Add "Edit" links on detail pages (visible only to logged-in users)
8. Add success messages on create/update

Write tests:
- Test anonymous users redirected to login
- Test authenticated users can create/edit
- Test bestowal creation links recipient and honor
- Test alternate name inline formset
- Test batch bestowal entry creates multiple bestowals
- Test recipient quick-create from bestowal form
- Test duplicate detection warns on similar names

Commit: "feat: add authenticated CRUD for events, people, awards, bestowals"
```

---

### Step 8: Recommendation System

Add the award recommendation submission and management system.

```text
Create the recommendation system. Requires login to submit.

1. **Recommendation model** (op/models.py)
   - recommender (FK to User, required — all new recommendations must have a logged-in recommender)
   - nominee_sca_name (CharField 250), nominee_mundane_name (CharField 250, blank)
   - nominee_group (FK to Group, nullable)
   - nominee_gender (CharField, blank), nominee_is_minor (BooleanField)
   - honor (FK to Honor — filtered to accepts_recommendations=True)
   - justification (TextField)
   - submitted_date (DateField auto)
   - status (CharField choices: PENDING, SCHEDULED, GIVEN, DECLINED)
   - scheduled_event (FK to Event, nullable — for draft court list)
   - Legacy import fields (used only for imported historical data):
     - legacy_recommender_sca_name (CharField, blank)
     - legacy_recommender_mundane_name (CharField, blank)
     - legacy_recommender_email (CharField, blank)
     - legacy_recommender_title (CharField, blank)

2. **Recommendation form** (op/views.py: RecommendationCreateView)
   - Only shows honors where accepts_recommendations=True
   - Recommender is automatically set to the logged-in user
   - URL: /recommendations/new/

3. **Recommendation list** (admin only view)
   - Filter by status, honor
   - URL: /recommendations/

4. **Recommendation detail** (admin only)
   - Full recommendation text
   - Shows recommender info (from User for new recs, from legacy fields for imported recs)
   - Actions: schedule for event, mark as given, decline
   - URL: /recommendations/<pk>/

5. Import legacy recommendations from the SQL dump (add to import command)
   - Create a system/admin user to serve as recommender FK for imported recs
   - Preserve original recommender info in legacy_recommender_* fields
   - Map op_recevents M2M to scheduled_event (use the most recent linked event)
   - Skip spam entries (rows with URLs in justification text)
   - Set status=GIVEN for entries where given=1
   - Decode HTML entities in justification text

Write tests:
- Test logged-in user can submit recommendation
- Test only recommendable honors shown
- Test admin can view/manage recommendations
- Test status transitions
- Test recommender is required (no anonymous recommendations)

Commit: "feat: add recommendation system with submission and management"
```

---

### Step 9: Error/Correction Reporting

Add error reporting for OP corrections.

```text
Create the error/correction reporting system. Requires login.

1. **Report model** (op/models.py)
   - reporter (FK to User)
   - subject (CharField — what the report is about)
   - description (TextField — the error/correction)
   - resolution (TextField, blank)
   - status (CharField choices: NEW, OPEN, PENDING, RESOLVED, CLOSED_NO_RESOLUTION — preserves legacy "Closed (no resolution)" distinction)
   - created_date, last_updated (DateFields)
   - Legacy import fields:
     - legacy_reporter_sca_name (CharField, blank)
     - legacy_reporter_email (CharField, blank)
     - notify_reporter (BooleanField, default=True)

2. **Report submission** (op/views.py: ReportCreateView)
   - Simple form
   - URL: /reports/new/

3. **Report list** (admin view)
   - Filter by status
   - URL: /reports/

4. **Report detail** (admin view)
   - View report, add resolution, change status
   - URL: /reports/<pk>/

5. **My reports** (user view)
   - User can see their own submitted reports and status
   - URL: /reports/mine/

6. Import legacy reports from SQL dump (add to import command)
   - Create reports with system/admin user as reporter FK
   - Preserve original reporter info in legacy_reporter_* fields
   - Map op_reportStatus IDs to status choices (0->NEW, 1->OPEN, 2->PENDING, 3->RESOLVED, 4->CLOSED_NO_RESOLUTION)

Write tests:
- Test user can submit report
- Test admin can update status/resolution
- Test user can see their own reports
- Test CLOSED_NO_RESOLUTION status works correctly

Commit: "feat: add error/correction reporting system"
```

---

### Step 10: Draft Court List (Planning Mode)

Build the draft court list feature for staging future awards.

```text
Create the draft court list system. Admin only.

1. **Court List view** (op/views.py: CourtListView)
   - Select an event (future events only)
   - See all draft bestowals scheduled for that event
   - See all recommendations scheduled for that event
   - URL: /court-list/

2. **Add to court list**
   - From recommendation detail: "Schedule for event" -> creates a draft bestowal linked to the recommendation
   - From court list: "Add bestowal" -> create new draft bestowal for this event
   - Draft bestowals have is_draft=True

3. **Publish court list**
   - "Publish" button on court list: sets is_draft=False on all bestowals for the event
   - Updates linked recommendation status to GIVEN
   - Creates recipient records if nominee doesn't exist yet
   - This is the moment awards become visible to the public

4. **Reorder court list**
   - HTMX drag-and-drop or up/down arrows to set bestowal sequence within event
   - Updates the sequence field

5. **Print court list**
   - Print-friendly view of the court list for use at the event
   - URL: /court-list/<event_pk>/print/

Write tests:
- Test creating draft bestowals
- Test publishing makes them public
- Test draft bestowals not visible in public views
- Test court list reordering

Commit: "feat: add draft court list planning system"
```

---

### Step 11: UI Polish & Configuration

Final polish pass on templates, navigation, and configurability.

```text
Polish the UI and add configuration for multi-group support.

1. **SiteConfig admin**
   - Django admin page for editing site configuration
   - Context processor to make config available in all templates

2. **Template polish**
   - Consistent styling across all pages
   - Mobile-responsive layout
   - Breadcrumb navigation
   - Flash messages for all user actions

3. **HTMX enhancements**
   - Live search on person list with debounce
   - Inline edit for bestowal notes
   - Modal confirmations for destructive actions

4. **Multi-group friendliness**
   - All group-specific text comes from SiteConfig
   - Honors, groups, events are all data-driven (no hardcoded barony names)
   - Document what a new group needs to change (just SiteConfig + their own data import)

5. **Update CLAUDE.md** with:
   - Build/test/run commands
   - App architecture
   - How to import data
   - How to deploy

Write tests:
- Test SiteConfig context processor
- Test HTMX partial responses
- Test that no templates contain hardcoded group names

Commit: "feat: polish UI and add multi-group configuration"
```

---

## Verification

After all steps:
1. `docker compose up` — app boots, connects to Postgres
2. `uv run python manage.py import_legacy_sql legacy_data/gryphony_OP.sql` — imports all legacy data
3. `uv run python manage.py verify_import legacy_data/gryphony_OP.sql` — confirms parity
4. Browse http://localhost:8000 — search for people, browse awards, view events
5. Register an account, get approved, create a recommendation
6. As admin: view recommendations, create court list, publish it
7. Test batch bestowal entry: create an event, add 5 awards at once
8. `uv run pytest` — all tests pass
9. `uv run python manage.py check --deploy` — no deployment warnings

## Future Work (not in scope for initial build)

- **Kingdom honor backfill**: Obtain a local copy of the Midrealm Kingdom OP data (from https://midrealm.org/order-of-precedence/) and use it to replace "External Honor #<key>" placeholders with real award names. Set up periodic sync.
- **Email notifications**: Notify admins on new recommendations/reports, notify users on report status changes.
- **Recipient merge**: Tool to merge duplicate recipient records.
