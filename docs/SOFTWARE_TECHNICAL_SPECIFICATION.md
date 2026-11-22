
# REVOLVING BIBLE
## SOFTWARE TECHNICAL SPECIFICATION

**Document Version:** 1.0  
**Document Status:** Initial Technical Baseline  
**Date:** 22 November 2026  
**Project:** Revolving Bible  
**Repository:** https://github.com/creggyd/revolving-bible  
**Production Front-End:** https://creggyd.github.io/revolving-bible/

---

# 1. DOCUMENT PURPOSE

This document describes the technical architecture, application components, database foundation, security arrangements and implementation status of the Revolving Bible application.

It is intended to:

- Provide a technical reference for the project owner.
- Support continued development and maintenance.
- Help professional developers understand the existing application.
- Reduce the need to reverse-engineer existing functionality.
- Support future expansion, testing and deployment.

This document must be updated whenever significant architectural, database, security or application changes are implemented.

# 2. PRODUCT OVERVIEW

Revolving Bible is a digital Scripture platform designed to help churches display Bible passages, provide Scripture readings and make selected church resources accessible through mobile devices.

The product is intended to serve both churches and individual users as development progresses.

The current Scripture display uses the King James Version (KJV).

The application is designed to support future expansion, including church administration, digital service programmes, weekly Scripture studies, audio Scripture and a dedicated mobile application.

# 3. TECHNICAL ARCHITECTURE

## 3.1 Current Technology Stack

| Component | Technology | Purpose |
|---|---|---|
| Front-end | HTML | Application page structure |
| Styling | CSS | Layout and presentation |
| Application logic | JavaScript | Application behaviour and data retrieval |
| Database | Supabase PostgreSQL | Structured application data |
| Authentication | Supabase Auth | User authentication |
| Database security | PostgreSQL Row Level Security | Access control |
| Hosting | GitHub Pages | Public front-end hosting |
| Source control | GitHub | Code preservation and version history |

The application currently uses a lightweight web architecture rather than a dedicated application server.

## 3.2 Architecture Overview

The current architecture follows this general flow:

1. A user opens a Revolving Bible web page.
2. GitHub Pages serves the HTML, CSS and JavaScript files.
3. The JavaScript application connects to the Supabase project.
4. Supabase authenticates users where required.
5. PostgreSQL retrieves or updates authorised application data.
6. Row Level Security policies determine which database operations are permitted.
7. The application displays the returned information.

GitHub Pages is responsible for serving the front-end. Supabase provides the database and authentication services.

## 3.3 Project Infrastructure

**GitHub repository:**  
https://github.com/creggyd/revolving-bible

**GitHub branch:**  
main

**GitHub Pages address:**  
https://creggyd.github.io/revolving-bible/

**Supabase project URL:**  
https://tthgeaiokpltmfxxmibb.supabase.co

**Supabase project reference:**  
tthgeaiokpltmfxxmibb

The Supabase project reference and URL are configuration identifiers, not secret credentials.

Private keys, passwords and service-role credentials must never be placed in public GitHub files.

# 4. APPLICATION PAGES

The following pages form part of the current application.

## 4.1 Today's Word

**File:** `index.html`

Purpose:
- Provides a public Scripture viewing experience.
- Retrieves the current Scripture when the page opens.
- Displays the selected Bible passage and reference.
- Supports access through a QR code.
- Does not require attendees to sign in.

The QR experience is intended to provide a simple way for users to access the current Scripture on their mobile devices.

## 4.2 Church Display

**File:** `church-display.html`

Purpose:
- Provides a church-oriented Scripture display.
- Retrieves Bible passages from the application database.
- Supports automatic Scripture rotation.
- Uses the configured rotation interval.

## 4.3 Preacher Control

**File:** `preacher-control.html`

Purpose:
- Provides an interface for authorised church personnel to manage the daily or service Scripture reading.
- Connects to the preacher reading database.
- Depends on authenticated access and database permissions.

## 4.4 Service Reading Display

**File:** `service-reading.html`

Purpose:
- Displays the latest applicable church service reading.
- Retrieves the reading associated with the church.
- Requires a valid authenticated session.
- Relies on Supabase Row Level Security for database authorisation.

The current implementation contains a hard-coded church identifier. This must be replaced with a secure dynamic church-context mechanism before production expansion to multiple churches.

# 5. DATABASE ARCHITECTURE

The database is hosted in Supabase PostgreSQL.

The following tables are known components of the existing project.

## 5.1 Bible Passages

**Table:** `bible_passages`

Purpose:
- Stores curated Bible passages for the revolving display.
- Supports automatic passage selection.
- Uses an active status to determine eligible passages.

Known functionality:
- 365 curated passages have been loaded.
- The collection is expandable.
- The display retrieves active passages in database order.

## 5.2 Rotation Settings

**Table:** `rotation_settings`

Purpose:
- Stores settings controlling the revolving Scripture display.

Known fields:
- `id`
- `rotation_interval_seconds`
- `rotation_start_at`

The current front-end implementation uses a 60-second rotation interval.

## 5.3 KJV Verses

**Table:** `kjv_verses`

Purpose:
- Stores the King James Version Bible text.
- Supports Scripture retrieval and future Bible study functionality.

Known database contents:
- 31,102 verses.
- 66 Bible books.
- King James Version.

## 5.4 Preacher Readings

**Table:** `preacher_readings`

Purpose:
- Stores Scripture readings selected by authorised church personnel.

Known fields:
- `id`
- `book`
- `chapter`
- `verse_start`
- `verse_end`
- `passage_text`
- `translation`
- `service_date`
- `service_type`
- `created_at`
- `display_heading`
- `church_id`

The table is protected through Row Level Security policies.

## 5.5 Churches

**Table:** `churches`

Purpose:
- Stores church information.
- Provides the church identity used by church-related features.

Known church record:

- Church: Omara Road Seventhday Adventist Church
- Slug: `omara-road-seventhday-adventist-church`
- Time zone: `America/Jamaica`

The database also uses church identifiers and slugs to associate church-specific information.

## 5.6 Church Memberships

**Table:** `church_memberships`

Purpose:
- Associates authenticated users with churches.
- Supports church-specific permissions and access control.

Known authorised roles:
- `church_admin`
- `pastor`
- `elder`
- `service_operator`

Membership status is checked when determining whether a user is authorised to perform protected church operations.

The current role constraint does not yet include a general ordinary-member role. This must be considered when implementing future member registration and participation features.

## 5.7 Digital Service Programme Tables

The initial database foundation for the Digital Service Programme has been created.

### Table: `church_programmes`

Purpose:
- Stores church service programme information.
- Supports draft, published and archived programme states.
- Associates each programme with a church.

Known fields include:
- `id`
- `church_id`
- `church_slug`
- `title`
- `theme`
- `event_date`
- `start_time`
- `venue`
- `introduction`
- `status`
- `published_at`
- `created_by`
- `updated_by`
- `created_at`
- `updated_at`

A database constraint ensures that a church can have no more than one published programme at a time.

### Table: `church_programme_items`

Purpose:
- Stores the individual items making up a programme.
- Supports ordered service activities.
- Associates each item with its parent programme.

Known fields include:
- `id`
- `programme_id`
- `sort_order`
- `item_type`
- `title`
- `details`
- `participant`
- `scheduled_time`
- `created_at`
- `updated_at`

Supported item types include welcome, prayer, worship, Scripture, song, presentation, sermon, offering, announcements, closing and other.

**Implementation status:** Database foundation created. Front-end management and public programme pages are not yet implemented.

# 6. AUTHENTICATION AND AUTHORISATION

Supabase Auth provides the current authentication foundation.

Authentication and authorisation are separate responsibilities:

- Authentication establishes the identity of a signed-in user.
- Authorisation determines what that user is allowed to access or change.

The application uses church membership information and role-based permissions for protected church operations.

Public Scripture pages are intended to remain accessible without requiring an account.

Protected church management functions must require authentication and appropriate authorisation.

# 7. DATABASE SECURITY

Row Level Security (RLS) is enabled on the relevant protected database tables.

Current security arrangements include:

- Public read access for selected Scripture resources.
- Restricted write access to Bible data.
- Authenticated membership checks for protected preacher readings.
- Role-based permissions for church operations.
- Public access to published programme information, subject to the programme publication policies.
- Restricted management of unpublished programme information.

The Digital Service Programme tables have RLS enabled and initial policies created.

**Important:** The existence of a policy does not by itself prove that every access scenario has been tested. Policy-level testing, including unauthenticated and unauthorised access attempts, remains necessary before production release.

# 8. CONFIGURATION AND SECRET MANAGEMENT

The application connects to Supabase using project configuration.

Developers must distinguish between:

**Public configuration**
- Supabase project URL.
- Supabase publishable or appropriately restricted public client key.

**Private credentials**
- Supabase service-role keys.
- Database passwords.
- Private API keys.
- Administrative credentials.

Private credentials must not be embedded in public JavaScript, HTML, CSS or GitHub Pages files.

Any future server-side functions requiring privileged access must store secrets in an appropriate secure environment.

# 9. SCRIPTURE ROTATION AND TIME SYNCHRONISATION

The revolving display retrieves active Scripture passages and uses rotation settings to determine the displayed passage.

The current implementation uses:
- A passage collection from `bible_passages`.
- A rotation interval of 60 seconds.
- A stored rotation start time.
- A countdown displayed by the front end.

A previous test confirmed that two devices could display the same passage while their countdown clocks differed by a few seconds.

Further synchronisation testing is required to ensure that devices remain aligned over longer periods and after page refreshes.

# 10. DEPLOYMENT AND SOURCE CONTROL

The current front-end is hosted using GitHub Pages.

The main development branch is:

`main`

GitHub is the authoritative source repository for the application code.

Significant changes should be committed with descriptive commit messages.

Database migrations must be preserved as version-controlled SQL files in the repository. A migration must not exist only in the live Supabase database.

Future deployment documentation must explain:
- How to obtain the repository.
- How to configure the application.
- How to apply database migrations.
- How to test changes.
- How to publish updates through GitHub Pages.
- How to recover from a failed deployment.

# 11. KNOWN TECHNICAL LIMITATIONS AND OUTSTANDING WORK

The following matters require further development or verification.

1. Replace hard-coded church identifiers with secure dynamic church context.
2. Complete multi-church configuration and isolation.
3. Complete functional testing of all database security policies.
4. Complete the Digital Service Programme management interface.
5. Complete the public Digital Service Programme page.
6. Generate and test the permanent church-specific programme QR code.
7. Establish a complete database migration archive in GitHub.
8. Complete backup and recovery documentation.
9. Establish a comprehensive automated and manual testing procedure.
10. Verify responsive behaviour across different screen sizes and devices.
11. Complete the user registration and ordinary-member role design.
12. Review existing database security advisories and resolve applicable issues.

# 12. FUTURE ARCHITECTURAL EXPANSION

The following are product roadmap items, not claims of completed implementation.

- Church administration and member accounts.
- Individual user accounts and personal Scripture engagement.
- Weekly Scripture Study and Discussion.
- Digital Service Programme management and archive.
- Audio Scripture playback and optional recorded voice reading.
- Accessibility features, including screen-reader compatibility, adjustable text and text-to-speech.
- Mobile application and Google Play Store distribution.
- Subscription and feature entitlement management.
- Expanded Scripture resources and study tools.

New features must integrate with the existing architecture without compromising security, accessibility or maintainability.

# 13. DEVELOPMENT AND HANDOVER REQUIREMENTS

All future development must follow the project's professional developer handover standard.

Every implemented feature must preserve:

1. Complete source code.
2. SQL migrations and database changes.
3. Exact file locations.
4. Technical explanations and dependencies.
5. Security and permission requirements.
6. Testing procedures and results.
7. GitHub commit references.
8. Relevant documentation updates.

The project must remain transferable to another developer or software development company.

# 14. DOCUMENT MAINTENANCE

This document is a living technical specification.

It must be updated whenever:
- A new application page is created.
- A database table or relationship is added or changed.
- Authentication or security policies change.
- An integration is introduced.
- A significant feature is completed.
- An architectural decision is revised.
- A deployment or recovery process changes.

Each update should include a version number and date.

---

**END OF SOFTWARE TECHNICAL SPECIFICATION**
