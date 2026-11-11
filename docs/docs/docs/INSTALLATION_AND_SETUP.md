# Revolving Bible — Installation and Setup Guide

**Document ID:** RB-IS-001  
**Version:** 1.0  
**Project Owner / Founder:** Craig Francis  
**Document Owner:** Revolving Bible Project  
**Status:** Development Guide  
**Last Updated:** November 2026

---

## 1. Purpose

This document explains how to obtain, configure, run, and maintain the Revolving Bible project.

It is intended for:

- The project owner.
- Future developers.
- Technical support personnel.
- Anyone responsible for restoring or maintaining the application.

The instructions describe the current GitHub Pages and Supabase prototype. Commercial mobile application setup will be documented separately when that development stage begins.

## 2. Project Overview

The Revolving Bible project currently uses:

| Component | Technology |
|---|---|
| Source code repository | GitHub |
| Website hosting | GitHub Pages |
| Backend platform | Supabase |
| Database | PostgreSQL |
| Frontend | HTML, CSS and JavaScript |
| Supabase client library | Supabase JavaScript v2 |
| Scripture translation | King James Version (KJV) |

### 2.1 Important Project Addresses

**GitHub repository:**

https://github.com/creggyd/revolving-bible

**Live application:**

https://creggyd.github.io/revolving-bible/

**Supabase project:**

https://supabase.com/dashboard/project/tthgeaiokpltmfxxmibb

**Supabase project URL:**

https://tthgeaiokpltmfxxmibb.supabase.co

These addresses are project configuration information, not passwords or secret credentials.

## 3. Requirements

To work on the current prototype, the following are required:

- A computer running Windows, macOS, or Linux.
- Internet access.
- A modern web browser.
- A GitHub account with repository access.
- Access to the project's Supabase account.
- A text editor or code editor.

Recommended tools:

- Visual Studio Code.
- Google Chrome or Microsoft Edge.
- Git, for local source-code management.
- A modern JavaScript-compatible browser.

## 4. Accessing the Project on GitHub

### 4.1 Open the Repository

1. Open a web browser.
2. Visit https://github.com/creggyd/revolving-bible
3. Sign in to GitHub.
4. Open the repository.

The main branch is named:

`main`

The primary prototype webpage is:

`index.html`

### 4.2 Understanding the Repository

The project will gradually be organized into the following structure:

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
│   └── INSTALLATION_AND_SETUP.md
│
├── database/
│   ├── migrations/
│   ├── seed/
│   └── policies/
│
├── src/
│
└── tests/
```

This is the planned organizational structure. Not every folder or file has been created yet.

## 5. Accessing the Supabase Backend

### 5.1 Sign In

1. Visit https://supabase.com/dashboard
2. Sign in using the account associated with the Revolving Bible project.
3. Open the project.

### 5.2 Project URL

The current project URL is:

`https://tthgeaiokpltmfxxmibb.supabase.co`

The frontend uses this address to communicate with the Supabase backend.

### 5.3 API Keys

The application requires an appropriate Supabase publishable key.

To locate it:

1. Open the Supabase project.
2. Navigate to the project's API settings.
3. Locate the publishable key.
4. Confirm that the frontend configuration uses the correct key.

**Security warning:**

Never place the Supabase secret key or service-role key in public JavaScript, GitHub Pages, or a mobile application's frontend code.

Never publish passwords or private credentials in this documentation.

## 6. Database Configuration

The prototype currently uses three principal database tables.

### 6.1 bible_passages

Stores the Scripture passages used by the revolving display.

Important columns:

- id
- book
- chapter
- verse_start
- verse_end
- passage_text
- translation
- active
- created_at

The prototype currently contains 30 active Scripture passages.

Do not execute the original 30-passage insertion script again without first checking the existing records. Doing so could create duplicates.

### 6.2 rotation_settings

Stores the Scripture rotation configuration.

Important columns:

- id
- rotation_interval_seconds
- rotation_start_at
- updated_at

The current rotation interval is 60 seconds.

### 6.3 preacher_readings

Stores the Scripture reading selected for a church service.

Important columns:

- id
- book
- chapter
- verse_start
- verse_end
- passage_text
- translation
- service_date
- service_type
- created_at

### 6.4 Database Security

Row Level Security (RLS) is enabled on the prototype tables.

Public read policies are configured for the information intended to be displayed.

Public write policies have not been granted.

Do not disable RLS as a troubleshooting shortcut.

## 7. Running the Current Application

The prototype is hosted through GitHub Pages.

To access it:

1. Open a browser.
2. Visit:

https://creggyd.github.io/revolving-bible/

3. Allow the page to finish loading.
4. Confirm that a Scripture passage appears.
5. Confirm that the countdown is visible.
6. Wait for the next rotation to verify that the passage changes.

The current prototype uses Supabase to retrieve Scripture passages and rotation settings.

## 8. Local Development Setup

A developer may download the source code to work on a local computer.

### 8.1 Download the Repository

1. Open the GitHub repository.
2. Click the green **Code** button.
3. Select **Download ZIP**.
4. Extract the downloaded ZIP file.
5. Open the extracted project folder.

### 8.2 Open the Project

Open the project folder in Visual Studio Code or another suitable editor.

Locate:

`index.html`

The current prototype is a frontend HTML and JavaScript application.

### 8.3 Local Testing

For reliable local testing, use a local development web server rather than opening the HTML file directly through the file system.

A developer may use Visual Studio Code with the Live Server extension or another suitable local web server.

The local application must have the correct Supabase project URL and publishable key configured.

Do not place private Supabase credentials in local frontend files.

## 9. Supabase JavaScript Library

The current prototype loads the Supabase JavaScript v2 library through the following CDN:

```html
<script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2"></script>
```

This allows the webpage to communicate with Supabase.

If the CDN is unavailable, the application may not be able to load its Scripture data.

A future production version should use a controlled dependency-management and build process.

## 10. Server-Time Synchronization

The application uses a Supabase database function to obtain server time.

The function name is:

`get_server_time()`

Its SQL definition is:

```sql
CREATE OR REPLACE FUNCTION public.get_server_time()
RETURNS timestamptz
LANGUAGE sql
VOLATILE
AS $$
    SELECT clock_timestamp();
$$;

GRANT EXECUTE ON FUNCTION public.get_server_time()
TO anon, authenticated;
```

The frontend calls this function to estimate the difference between the device clock and the server clock.

The purpose is to keep Scripture rotation synchronized across multiple devices.

Do not remove this function or its frontend synchronization logic without testing the effects on all connected displays.

## 11. Publishing Changes to GitHub Pages

When source-code changes are ready:

1. Open the GitHub repository.
2. Locate the file being updated.
3. Open the file.
4. Select the Edit option.
5. Make the required changes.
6. Review the code before committing.
7. Click **Commit changes**.
8. Enter a meaningful commit message.
9. Commit directly to the `main` branch if following the current prototype workflow.

GitHub Pages will publish the updated website after the repository changes are processed.

Allow a short period for deployment.

Then reload the live application and test the changes.

## 12. Backup Procedures

The project must maintain more than one form of backup.

### 12.1 Source-Code Backup

GitHub provides version history for committed source-code changes.

Important files should also be retained in a separate backup location.

### 12.2 Database Backup

GitHub does not automatically back up the Supabase database.

Database backups must be maintained separately.

The project owner should arrange a regular database export or an appropriate Supabase backup solution.

### 12.3 Documentation Backup

All technical documentation should remain in the GitHub repository.

The documentation should be updated whenever significant changes are made.

## 13. Common Troubleshooting

### 13.1 Website Displays a Blank Page

Possible causes:

- JavaScript errors.
- Incorrect Supabase configuration.
- Network connectivity problems.
- Incorrect deployment settings.
- Missing or incorrectly named files.

Recommended checks:

1. Reload the website.
2. Check the browser's developer console.
3. Confirm that the GitHub Pages deployment completed.
4. Verify the Supabase URL and publishable key.
5. Check whether Supabase is responding.

### 13.2 Scripture Does Not Load

Possible causes:

- Incorrect Supabase configuration.
- Database connection failure.
- Missing active Scripture records.
- Incorrect database permissions.
- RLS policy restrictions.

Check the `bible_passages` table and confirm that active passages exist.

### 13.3 Scripture Does Not Rotate

Check:

- Whether the countdown is running.
- Whether the browser has JavaScript errors.
- Whether rotation settings are available.
- Whether the server-time function is responding.
- Whether the rotation interval is configured correctly.

### 13.4 Devices Display Different Passages

Check:

- Whether both devices are using the latest published application.
- Whether both devices can reach Supabase.
- Whether server-time synchronization is working.
- Whether the rotation settings are identical.

Do not assume that differences in device clock displays automatically indicate that Scripture rotation is out of synchronization.

Compare the actual countdown and passage transitions.

### 13.5 GitHub Changes Are Not Appearing

Check:

- Whether the changes were committed.
- Whether the correct branch was updated.
- Whether GitHub Pages is configured to publish from `main` and the root folder.
- Whether the deployment completed.
- Whether the browser is displaying a cached version.

## 14. Recovery on a New Computer

If the original development computer becomes unavailable:

1. Obtain access to the GitHub account.
2. Open the Revolving Bible repository.
3. Download or clone the source code.
4. Obtain authorized access to the Supabase project.
5. Retrieve the publishable key from Supabase.
6. Configure the local application.
7. Review the documentation folder.
8. Confirm that the database tables and functions exist.
9. Run the application locally.
10. Test the live application before making production changes.

The owner must retain secure access to the relevant accounts and recovery methods.

## 15. Future Commercial Application Setup

The current prototype is a web application.

The planned commercial application will introduce additional development requirements.

These will include:

- Ionic and React application development.
- Capacitor for Android and iOS packaging.
- Mobile development environments.
- Android testing and signing.
- Apple development and testing requirements.
- Production authentication configuration.
- Multi-church database architecture.
- Secure environment configuration.
- Automated testing and deployment.
- App Store and Google Play submission procedures.

These procedures will be documented separately before the commercial mobile release.

## 16. Project Continuity and Handover

The Revolving Bible project must remain maintainable even if its original developer is unavailable.

The following must be preserved:

- Complete source code.
- Database schema.
- Database migration scripts.
- Security policies.
- Application configuration instructions.
- Technical documentation.
- Backup and restoration procedures.
- Development decision records.
- Release history.

No major technical change should be made without documenting what was changed and why.

## 17. Document Maintenance

This guide must be updated whenever installation procedures, backend configuration, project structure, or deployment methods change.

All changes must be recorded in the project's documentation history.

---

**End of Document**

**Revolving Bible Project — Installation and Setup Guide**
