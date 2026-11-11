# Revolving Bible — Developer Guide

**Document ID:** RB-DG-001  
**Version:** 1.0  
**Status:** Initial Development Guide  
**Project:** Revolving Bible  
**Document Owner:** Revolving Bible Project  

---

## 1. Purpose

This document provides technical guidance for developers working on the Revolving Bible application.

It is intended to help the original developer and any future development team understand the project structure, development environment, backend integration, deployment process, and maintenance requirements.

The objective is to ensure continuity of development even if responsibility for the project changes.

## 2. Project Overview

Revolving Bible is a Scripture presentation and sharing platform designed for individuals and churches.

The current prototype uses:

- HTML for page structure.
- CSS for presentation and responsive styling.
- JavaScript for application logic.
- Supabase for backend database services.
- GitHub for source-code management.
- GitHub Pages for web hosting.

The longer-term commercial direction includes Android and iOS applications, individual accounts, church accounts, and administrative functionality.

## 3. Source Code Repository

**GitHub username:** `creggyd`

**Repository:** `revolving-bible`

**Repository URL:**

https://github.com/creggyd/revolving-bible

**Live website:**

https://creggyd.github.io/revolving-bible/

The `main` branch is currently used for deployment.

Developers must work with the existing repository rather than creating an unrelated replacement project.

## 4. Development Environment

Recommended development tools:

| Tool | Purpose |
|---|---|
| Visual Studio Code | Source-code editing |
| Git | Version control |
| GitHub | Source-code hosting |
| Modern web browser | Testing |
| Supabase Dashboard | Database management |
| Browser Developer Tools | Debugging |

A developer should have:

- A supported desktop operating system.
- A stable internet connection.
- GitHub repository access.
- Appropriate Supabase project access.
- A modern web browser.

## 5. Getting Started

Before modifying the application:

1. Open the GitHub repository.
2. Review the `README.md`.
3. Review the documentation in the `docs` folder.
4. Examine the existing application source code.
5. Confirm the current Supabase database structure.
6. Identify the features already implemented.
7. Make a backup before significant changes.

To work locally, clone the repository:

```bash
git clone https://github.com/creggyd/revolving-bible.git
```

Open the downloaded project folder in Visual Studio Code.

The current prototype is a browser-based application. A developer should inspect the existing files before introducing additional frameworks or build tools.

## 6. Existing Application Structure

The current prototype uses a relatively simple web architecture.

The main application entry point is:

`index.html`

This file contains the current application structure and its associated frontend logic and styling.

The project also contains a `docs` directory for technical and operational documentation.

As the project grows, the source structure should be reorganized into clearly separated components.

A possible future structure is:

```text
revolving-bible/
│
├── index.html
├── README.md
├── CHANGELOG.md
│
├── docs/
│   ├── PRODUCT_SPECIFICATION.md
│   ├── SYSTEM_ARCHITECTURE.md
│   ├── DATABASE_DESIGN.md
│   ├── SECURITY_GUIDELINES.md
│   ├── INSTALLATION_AND_SETUP.md
│   ├── BACKUP_AND_RECOVERY.md
│   ├── API_DOCUMENTATION.md
│   ├── TESTING_AND_QA.md
│   ├── USER_GUIDE.md
│   └── DEVELOPER_GUIDE.md
│
├── src/                  # Planned
│   ├── components/
│   ├── pages/
│   ├── services/
│   ├── styles/
│   └── utils/
│
├── database/             # Planned
│   └── migrations/
│
└── tests/                # Planned
```

This is a proposed future organization, not a description of folders that must already exist.

## 7. Frontend Development

The current frontend is built with HTML, CSS, and JavaScript.

Important JavaScript variables used by the rotation functionality include:

```javascript
let passages = [];
let rotationStart = 0;
let rotationInterval = 60;
let serverTimeOffset = 0;
```

These variables support:

- Loaded Bible passages.
- Rotation start time.
- Rotation interval.
- Estimated difference between the device clock and server clock.

The application retrieves active passages from Supabase and uses the server-time offset when calculating the current passage.

### Important Development Rule

Do not replace the existing rotation logic without first understanding how server-time synchronization works.

Changes must preserve the intended synchronized display across multiple devices.

## 8. Supabase Integration

The current Supabase project is:

`https://tthgeaiokpltmfxxmibb.supabase.co`

The application uses the Supabase JavaScript client version 2.

Current database tables:

- `bible_passages`
- `rotation_settings`
- `preacher_readings`

Current server-time RPC function:

`get_server_time()`

Example:

```javascript
const { data: serverTimeData, error: serverTimeError } =
    await supabaseClient.rpc("get_server_time");

if (serverTimeError) throw serverTimeError;
```

Developers should consult `DATABASE_DESIGN.md` and `API_DOCUMENTATION.md` before changing database interactions.

## 9. Database Development Rules

All database changes must be handled carefully.

Before modifying a table:

1. Review its current structure.
2. Identify application dependencies.
3. Check existing RLS policies.
4. Prepare the required SQL migration.
5. Test the migration.
6. Update the database documentation.

Avoid making undocumented changes directly in the production database.

Database migration scripts should be retained in GitHub as the commercial platform develops.

## 10. Security Requirements

Security must be considered during every development stage.

Developers must:

- Maintain Row Level Security.
- Avoid exposing secret keys.
- Never place the Supabase service-role key in frontend code.
- Use authenticated access for protected operations.
- Restrict church data by authorized membership.
- Validate user-submitted information.
- Test access permissions.
- Avoid exposing sensitive information in logs.

Refer to `SECURITY_GUIDELINES.md` for the project's security requirements.

## 11. GitHub Development Workflow

All significant source-code changes should be committed to GitHub.

Recommended workflow:

1. Review the current code.
2. Create a backup or development branch.
3. Make one logical change at a time.
4. Test the change locally.
5. Review the modified files.
6. Commit the changes with a descriptive message.
7. Merge approved changes into `main`.
8. Verify the deployed website.

Example commit messages:

```text
Fix Scripture rotation timing
Improve mobile display layout
Add preacher reading functionality
Update Supabase database integration
Improve QR sharing page
```

Avoid vague commit messages such as:

```text
Changes
Update
Fix
New code
```

## 12. Deployment

The current prototype uses GitHub Pages.

The deployment source is:

- Branch: `main`
- Folder: `/(root)`

After an approved change is committed:

1. Allow GitHub Pages to publish the update.
2. Open the live website.
3. Confirm the application loads.
4. Test the affected feature.
5. Test important existing functionality.
6. Record significant changes in `CHANGELOG.md`.

Do not assume that a successful GitHub commit automatically proves the deployed application is functioning correctly.

## 13. Testing Requirements

Every significant change should be tested before deployment.

At minimum, verify:

- Scripture retrieval.
- Automatic rotation.
- Countdown.
- Server-time synchronization.
- Supabase connectivity.
- Responsive display.
- Existing access permissions.

Consult `TESTING_AND_QA.md` for the full testing procedure.

## 14. Commercial Development Direction

The long-term commercial architecture is expected to introduce:

- Ionic and React for shared application development.
- Capacitor for Android and iOS packaging.
- Supabase authentication.
- Multi-church database architecture.
- Role-based administration.
- Subscription management.
- Improved application monitoring.

These are planned architectural directions.

A developer should not assume that these frameworks or services are already integrated into the current prototype.

Any major architectural transition should be documented and approved before implementation.

## 15. Documentation Maintenance

Technical documentation must remain synchronized with the application.

Whenever a significant change is introduced:

- Update the product specification if requirements change.
- Update the architecture document if the design changes.
- Update the database design after schema changes.
- Update API documentation after API changes.
- Update security guidelines after permission changes.
- Update testing documentation when new tests are required.
- Update the changelog after significant releases.

## 16. Developer Handover Requirements

A developer taking over the project should receive:

1. Access to the GitHub repository.
2. Appropriate Supabase project access.
3. Current database schema documentation.
4. Database migration scripts.
5. Application source code.
6. Deployment instructions.
7. Security guidelines.
8. Backup and recovery procedures.
9. Current testing records.
10. A list of implemented and outstanding features.

Passwords, secret keys, and other credentials must be transferred through secure channels, not placed in public repository files.

## 17. Continuity and Ownership

The project must remain maintainable independently of any one developer.

All important technical decisions, source-code changes, database modifications, and deployment procedures should be documented.

The repository should remain the central record of the project's development history.

Independent database backups must also be maintained.

## 18. Current Development Status

The current project has:

- A working GitHub Pages prototype.
- A Supabase backend.
- Three established database tables.
- Thirty active KJV Bible passages.
- Automatic Scripture rotation.
- A 60-second countdown.
- Server-time synchronization functionality.
- A growing technical documentation package.

Further development is required for the complete preacher-reading workflow, QR sharing, user authentication, commercial administration, mobile applications, and subscription functionality.

These features must be verified before being classified as completed.

---

**End of Document**

**Document ID:** RB-DG-001  
**Version:** 1.0
