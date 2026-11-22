
# REVOLVING BIBLE
## DEVELOPER INSTALLATION AND SETUP MANUAL

**Document Version:** 1.0  
**Document Status:** Initial Developer Setup Guide  
**Date:** 22 November 2026  
**Project:** Revolving Bible  
**Source Repository:** https://github.com/creggyd/revolving-bible  
**Production Front-End:** https://creggyd.github.io/revolving-bible/

---

# 1. PURPOSE OF THIS MANUAL

This manual provides instructions for a developer taking over, maintaining or extending the Revolving Bible application.

It is intended to help a developer:

- Obtain the application source code.
- Understand the existing project structure.
- Configure the development environment.
- Connect to the Supabase backend.
- Understand the database and security arrangements.
- Test the application.
- Deploy approved changes.
- Maintain backups and project continuity.

This is an initial setup guide. Steps that require further verification against the actual repository or Supabase configuration are identified accordingly.

# 2. PROJECT OVERVIEW

Revolving Bible is a Scripture display and church digital services platform.

The current application uses:

- HTML for page structure.
- CSS for presentation.
- JavaScript for application functionality.
- Supabase PostgreSQL for data storage.
- Supabase Auth for authentication.
- PostgreSQL Row Level Security for database access control.
- GitHub for source control.
- GitHub Pages for front-end hosting.

The current Bible translation is the King James Version (KJV).

# 3. REQUIRED DEVELOPMENT ENVIRONMENT

A developer taking over the project should have access to:

| Requirement | Purpose |
|---|---|
| Windows, macOS or Linux computer | Development workstation |
| Modern web browser | Application testing |
| Git | Source control |
| GitHub account | Repository access |
| Code editor | Editing application files |
| Supabase account | Backend and database administration |
| Internet connection | Access to GitHub and Supabase |

A code editor such as Visual Studio Code is recommended.

The developer should also understand basic HTML, CSS, JavaScript, SQL and PostgreSQL.

# 4. OBTAINING THE SOURCE CODE

The official source repository is:

https://github.com/creggyd/revolving-bible

The primary development branch is:

`main`

A developer must obtain the required repository access from the project owner.

The recommended method is to clone the repository using Git:

```bash
git clone https://github.com/creggyd/revolving-bible.git
```

Move into the project directory:

```bash
cd revolving-bible
```

Check the current branch:

```bash
git branch
```

The expected primary branch is:

`main`

Before making changes, review the existing files, documentation and commit history.

Do not overwrite existing application files without first understanding their purpose and dependencies.

# 5. APPLICATION FILES

The following application pages are known components of the project.

| Filename | Purpose |
|---|---|
| `index.html` | Today's Word public Scripture page |
| `church-display.html` | Church revolving Scripture display |
| `preacher-control.html` | Authorised preacher reading control |
| `service-reading.html` | Church service reading display |

Additional pages and supporting JavaScript, CSS and configuration files must be identified from the current repository.

The `docs` folder contains project documentation, including:

- `REVOLVING_BIBLE_MASTER_GUIDE.md`
- `SOFTWARE_TECHNICAL_SPECIFICATION.md`
- `DEVELOPER_INSTALLATION_AND_SETUP_MANUAL.md`

The actual repository contents should always be checked before assuming that a file exists.

# 6. SUPABASE BACKEND CONFIGURATION

## 6.1 Supabase Project

The current Supabase project is:

**Project URL:**

https://tthgeaiokpltmfxxmibb.supabase.co

**Project reference:**

`tthgeaiokpltmfxxmibb`

The project owner must provide appropriate access to the developer through Supabase's access-management facilities.

Access should be granted according to the developer's responsibilities.

## 6.2 Supabase Client Configuration

The front-end communicates with Supabase through the Supabase JavaScript client.

A developer must inspect the existing application code to identify:

- The Supabase JavaScript library and version.
- How the Supabase client is initialised.
- Where the project URL is configured.
- Where the public client key is configured.
- Which pages use Supabase authentication.
- Which database tables each page accesses.

Do not replace the existing client configuration without understanding its dependencies.

## 6.3 Public and Private Credentials

The following distinction is mandatory.

**Public configuration:**
- Supabase project URL.
- Publishable key or appropriately restricted public client key.

**Private credentials:**
- Service-role keys.
- Database passwords.
- Private API keys.
- Administrative credentials.

Private credentials must never be embedded in public HTML, CSS or JavaScript files.

Where privileged server-side operations are required, secrets must be stored in an appropriate secure environment.

# 7. DATABASE SETUP

The project uses Supabase PostgreSQL.

Known database tables include:

| Table | Purpose |
|---|---|
| `bible_passages` | Curated revolving Scripture passages |
| `rotation_settings` | Scripture rotation configuration |
| `kjv_verses` | King James Version Bible text |
| `preacher_readings` | Church service Scripture readings |
| `churches` | Church records |
| `church_memberships` | Church membership and permissions |
| `church_programmes` | Digital Service Programme records |
| `church_programme_items` | Individual programme activities |

The database contains 365 curated passages and 31,102 KJV verses across 66 books.

## 7.1 Database Migrations

All database changes must be preserved as version-controlled SQL migration files in the GitHub repository.

A developer must:

1. Review the existing database schema.
2. Review the migration history.
3. Identify the current database state.
4. Review the proposed SQL migration.
5. Apply changes through an approved process.
6. Verify that the migration succeeded.
7. Test the resulting database functionality.
8. Commit the migration file to GitHub.

Never assume that a migration has been applied simply because its SQL file exists in GitHub.

Likewise, never assume that a change is documented simply because it exists in the live database.

The migration archive must be reconciled with the live Supabase database before a developer performs a database restoration or fresh installation.

# 8. AUTHENTICATION AND SECURITY

Supabase Auth is used for authenticated application functions.

Protected church operations rely on church membership and role-based permissions.

Known roles include:

- `church_admin`
- `pastor`
- `elder`
- `service_operator`

Row Level Security is enabled on relevant protected database tables.

A developer must review all policies before changing database access.

Testing must include:

- Unauthenticated public access.
- Authenticated authorised access.
- Authenticated unauthorised access.
- Access to another church's information.
- Attempts to modify protected records.
- Attempts to access unpublished information.

A user interface restriction is not a replacement for database security.

The database must enforce the applicable permissions.

# 9. RUNNING THE APPLICATION LOCALLY

The current front-end is a collection of web application files.

A developer should inspect the existing repository to determine whether any build tools, package dependencies or local configuration files are required.

If the application consists of static HTML, CSS and JavaScript without a build process, it can be tested using a local web server.

For example, if Python is installed:

```bash
python -m http.server 8000
```

The developer can then open:

`http://localhost:8000`

This example assumes the server is started from the project directory.

If the project later adopts a build system or additional server-side components, the setup instructions must be revised.

# 10. APPLICATION TESTING

Before deploying changes, test the affected functionality.

## 10.1 Scripture Display Testing

- Confirm that the page loads.
- Confirm that Scripture passages are retrieved.
- Confirm that the correct reference is displayed.
- Confirm that automatic rotation works.
- Confirm that the configured interval is respected.
- Test on multiple devices.

## 10.2 Today's Word Testing

- Open the public page.
- Confirm that the current Scripture loads.
- Test the page without signing in.
- Confirm that the reference and passage text display correctly.
- Test the QR destination on a mobile device.

## 10.3 Church Authentication Testing

- Test valid sign-in.
- Test invalid sign-in.
- Test unauthenticated access to protected pages.
- Test authorised church roles.
- Test unauthorised database operations.
- Confirm that users cannot access another church's restricted records.

## 10.4 Digital Service Programme Testing

The database foundation exists, but the complete programme user interface has not yet been implemented.

Once implemented, testing must cover:

- Creating a programme.
- Saving a draft.
- Adding and ordering programme items.
- Publishing a programme.
- Displaying the published programme publicly.
- Accessing the programme without signing in.
- Updating the programme while keeping the same QR destination.
- Archiving previous programmes.
- Preventing unauthorised programme management.

# 11. DEPLOYMENT THROUGH GITHUB PAGES

The current production front-end is hosted at:

https://creggyd.github.io/revolving-bible/

The main source branch is:

`main`

A developer must:

1. Review the proposed changes.
2. Test the changes locally.
3. Confirm that no secrets have been committed.
4. Commit the approved changes to GitHub.
5. Confirm the GitHub Pages deployment settings.
6. Wait for the deployment to complete.
7. Open the production website.
8. Test the affected pages.
9. Record the deployment and test results.

The current GitHub Pages configuration must be inspected before changing deployment settings.

# 12. BACKUP AND RECOVERY

The project must maintain separate protection for its source code and database.

## 12.1 Source Code

GitHub provides the version-controlled source repository.

The project owner should retain administrative control and ensure that appropriate backups or repository exports are available.

## 12.2 Database

The Supabase database requires a separate backup and recovery procedure.

The developer must establish:

- Database backup frequency.
- Backup retention period.
- Secure backup storage.
- Database restoration procedure.
- Recovery testing schedule.
- Responsibility for monitoring backup completion.

A GitHub source-code backup does not replace a database backup.

## 12.3 Recovery Testing

A backup should not be considered reliable until restoration has been tested.

Recovery testing must confirm that:

- Database records can be restored.
- Required relationships and constraints remain intact.
- Security policies are preserved.
- Application connectivity works after restoration.

# 13. CHANGE MANAGEMENT

All significant development changes must be recorded.

A change record should contain:

- Date.
- Developer.
- Feature or component affected.
- Description of the change.
- Reason for the change.
- Database migration reference, where applicable.
- GitHub commit reference.
- Testing performed.
- Outstanding issues.

Use descriptive GitHub commit messages.

Changes affecting security, authentication or database permissions require particular care and testing.

# 14. PRODUCTION READINESS

Before a major production release, the developer must verify:

- Application functionality.
- Database integrity.
- Authentication and authorisation.
- Row Level Security.
- Mobile and desktop responsiveness.
- Accessibility.
- Performance.
- Backup and recovery.
- Error handling.
- Deployment and rollback procedures.
- Documentation completeness.

A feature should not be marked production-ready solely because it works on one development device.

# 15. PROFESSIONAL HANDOVER CHECKLIST

When development responsibility is transferred, the project owner should ensure that the receiving developer has:

- [ ] Approved GitHub repository access.
- [ ] Appropriate Supabase access.
- [ ] Complete source code.
- [ ] Current database schema.
- [ ] Database migration archive.
- [ ] Software Technical Specification.
- [ ] Developer Installation and Setup Manual.
- [ ] Current Code and Database Change Register.
- [ ] Authentication and security documentation.
- [ ] Deployment instructions.
- [ ] Backup and recovery instructions.
- [ ] Outstanding issues and roadmap.
- [ ] Relevant testing records.

Credentials must be transferred securely and must not be placed in public project documentation.

# 16. DOCUMENT MAINTENANCE

This manual must be updated whenever:

- The technology stack changes.
- New development dependencies are introduced.
- Installation procedures change.
- Database configuration changes.
- Deployment procedures change.
- Backup or recovery procedures are revised.
- New application components are introduced.

Every significant revision must include a version number and date.

---
## Digital Service Programme — Developer Setup Notes

### 1. Required environment

The Digital Service Programme uses the existing Revolving Bible development environment:

- GitHub repository: `https://github.com/creggyd/revolving-bible`
- Front-end hosting: GitHub Pages.
- Backend and database: Supabase.
- Supabase project URL: `https://tthgeaiokpltmfxxmibb.supabase.co`

Use the existing project configuration and approved Supabase client integration.

Never commit passwords, private keys, Supabase service-role keys or other confidential credentials to GitHub.

### 2. Database migration records

The following migration files are maintained in:

`supabase/migrations/`

1. `20261122223226_create_digital_service_programmes.sql`
2. `20261122232729_tighten_church_programme_permissions.sql`

The first file is a reconstructed schema record. The original migration was already applied to the live Supabase project. Do not run the reconstructed file against the existing database as a fresh migration.

The second migration records the permission-tightening changes applied to the live project.

Before setting up a new environment, inspect the Supabase migration history and compare the database schema and policies with the committed migration records.

### 3. Database verification

A developer should verify:

- `public.church_programmes` exists.
- `public.church_programme_items` exists.
- Both tables have Row Level Security enabled.
- The church relationship and programme-item relationship are intact.
- The one-published-programme-per-church constraint is present.
- Anonymous users have SELECT privileges only.
- Authenticated users have the required table privileges, subject to RLS.
- Programme creation and editing require active authorised church membership.

### 4. Church configuration

The existing church record used during development is:

- Church: Omara Road Seventhday Adventist Church.
- Church ID: `cd90c8c5-3931-4995-948b-9004dc398846`
- Church slug: `omara-road-seventhday-adventist-church`
- Time zone: `America/Jamaica`

Production code should resolve the church through its approved church context or URL slug. Do not rely on hard-coded church IDs as the permanent multi-church architecture.

### 5. Planned pages

The following pages are not yet implemented:

- `programme.html` — public attendee access.
- `programme-control.html` — authorised programme management.

The intended public URL for the initial church is:

`https://creggyd.github.io/revolving-bible/programme.html?church=omara-road-seventhday-adventist-church`

This is a planned destination, not a currently operational page.

### 6. Deployment and testing requirements

Before releasing the feature:

- Test public programme retrieval without signing in.
- Test that unpublished drafts cannot be viewed publicly.
- Test authorised church staff access.
- Test unauthorised user restrictions.
- Test programme creation, editing and item ordering.
- Test publishing, replacing and archiving programmes.
- Verify that the permanent QR code always opens the correct church programme.
- Test the pages on desktop, tablet and mobile.
- Confirm that changes published by church administrators appear to attendees without generating a new QR code.

### 7. Current status

The database foundation and permission-tightening migration are complete. The public page, administration interface, QR generation and end-to-end testing remain outstanding.

A new developer must review the master guide, technical specification and code/database change register before modifying or extending the feature.
**END OF DEVELOPER INSTALLATION AND SETUP MANUAL**
