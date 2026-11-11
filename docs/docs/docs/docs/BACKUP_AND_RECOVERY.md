# Revolving Bible — Backup and Recovery Procedures

**Document ID:** RB-BR-001  
**Version:** 1.0  
**Project Owner / Founder:** Craig Francis  
**Document Owner:** Revolving Bible Project  
**Status:** Development Standard  
**Last Updated:** November 2026

---

## 1. Purpose

This document establishes procedures for backing up, protecting, and restoring the Revolving Bible project.

The objective is to ensure that the project can be recovered following:

- Computer failure.
- Accidental deletion of source code.
- Database corruption or accidental data deletion.
- Loss of access to a development environment.
- Unauthorized access or security incidents.
- Hosting or backend service interruptions.
- Transfer of project responsibilities to another developer.

The project must not depend on a single computer, individual, or storage location.

## 2. Backup Strategy

The project will maintain separate backups for its source code, database, documentation, and configuration.

| Project component | Primary location | Backup approach |
|---|---|---|
| Source code | GitHub | Repository history and separate repository copy |
| Documentation | GitHub | Repository history and exported copy |
| Database | Supabase | Database backups and periodic exports |
| Database structure | SQL migration files | GitHub version control |
| Configuration | Secure credential storage | Encrypted backup |
| Application releases | GitHub releases, when established | Retain versioned release records |

A GitHub repository backup does not replace a Supabase database backup.

## 3. Source Code Protection

### 3.1 GitHub Repository

The primary source-code repository is:

https://github.com/creggyd/revolving-bible

The main branch is:

`main`

All significant source-code changes must be committed to GitHub.

Commit messages should clearly describe the changes.

Examples:

- `Update Scripture rotation logic`
- `Add preacher reading functionality`
- `Improve mobile display layout`
- `Add church administration features`

### 3.2 Separate Repository Backup

A separate copy of the repository should be maintained outside the primary GitHub account.

Recommended locations include:

- An external hard drive.
- An encrypted USB storage device.
- A secure cloud storage account.

The backup should include the complete repository, including documentation and database migration files.

### 3.3 Downloading a Repository Backup

To download the project:

1. Open the GitHub repository.
2. Click the green **Code** button.
3. Select **Download ZIP**.
4. Save the ZIP file in a designated backup folder.
5. Record the date of the backup.

Example naming convention:

`revolving-bible-backup-2026-11-11.zip`

The date must reflect the actual backup date.

## 4. Database Backup

The Supabase database contains information that is not automatically preserved by GitHub.

The current Supabase project is:

https://supabase.com/dashboard/project/tthgeaiokpltmfxxmibb

### 4.1 Database Information to Protect

The backup process must preserve:

- Scripture passages.
- Rotation settings.
- Preacher readings.
- Database table definitions.
- Database functions.
- Row Level Security policies.
- Relevant indexes and constraints.
- Future church and user records.
- Future application settings.

### 4.2 Backup Methods

The project may use the following methods:

1. Supabase-managed database backups, according to the active subscription and retention options.
2. Periodic database exports.
3. Version-controlled SQL migration files.
4. Separate exports of important application data.

The project owner must verify which backup and recovery features are available under the active Supabase plan.

A database export should be stored separately from the live database.

### 4.3 Backup Frequency

Recommended backup schedule:

| Data | Recommended frequency |
|---|---|
| Source code | After every significant change |
| Database schema | After every schema change |
| Scripture library | Weekly and after major updates |
| Church and account data | According to production backup and recovery requirements |
| Full project backup | Monthly |
| Recovery test | At least quarterly |

For a commercial release, backup frequency and retention must be adjusted according to the volume and importance of user data.

## 5. Database Migration Files

Database structure changes must be preserved as SQL migration files.

The planned folder is:

`database/migrations/`

Examples:

```text
database/
    migrations/
        001_initial_tables.sql
        002_server_time_function.sql
        003_authentication_setup.sql
        004_multi_church_structure.sql
        005_security_policies.sql
```

These are proposed filenames. They must only be created when the corresponding migrations are actually implemented and verified.

Migration files must document:

- What is being changed.
- Why the change is required.
- Which tables or functions are affected.
- Whether the change is reversible.
- Any required data migration.

Never assume that a SQL script has been applied successfully merely because it exists in GitHub.

## 6. Configuration and Credential Backup

The project depends on access to GitHub and Supabase.

The owner must maintain secure access to:

- GitHub account.
- Supabase account.
- Associated recovery email.
- Multi-factor authentication methods.
- Relevant domain and hosting accounts as they are introduced.
- Mobile developer accounts when commercial publishing begins.

Passwords and secret keys must not be stored in public documentation.

Private credentials should be maintained using a reputable password manager or another secure encrypted storage method.

Recovery codes should be stored securely and separately from the primary device.

**Important:** Never include Supabase service-role keys or secret keys in a GitHub repository, including a private repository.

## 7. Recovery Scenarios

### 7.1 Computer Failure

If the development computer fails:

1. Obtain access to another computer.
2. Sign in to GitHub.
3. Download or clone the Revolving Bible repository.
4. Install the required development tools.
5. Obtain authorized access to Supabase.
6. Reconfigure the local development environment.
7. Follow `INSTALLATION_AND_SETUP.md`.
8. Test the application.

The source code should be recoverable without relying on the original computer.

### 7.2 Accidental Source-Code Deletion

If a source-code file is accidentally deleted:

1. Open the GitHub repository.
2. Locate the affected file.
3. Review its commit history.
4. Identify the last known working version.
5. Restore the file or revert the relevant change.
6. Test the restored application.
7. Commit the correction.

Do not overwrite a working version until the relevant history has been reviewed.

### 7.3 Accidental Database Deletion

If database records are accidentally deleted:

1. Stop any process that may cause additional changes.
2. Identify the affected tables and records.
3. Determine the approximate time of deletion.
4. Check available Supabase backups.
5. Identify an appropriate recovery point.
6. Restore the database or affected data using a tested procedure.
7. Verify table structures, functions, policies, and records.
8. Test the application before returning it to normal operation.

Where possible, test restoration in a separate environment before changing production data.

### 7.4 Supabase Account or Service Interruption

If the Supabase service becomes unavailable:

1. Confirm whether the issue is temporary.
2. Check the Supabase service status.
3. Avoid unnecessary database or configuration changes.
4. Preserve the current source code.
5. Review available backup and export files if recovery becomes necessary.
6. Resume normal operation only after connectivity and data integrity are verified.

### 7.5 Lost Account Access

If access to GitHub or Supabase is lost:

1. Use the provider's official account-recovery process.
2. Use securely stored recovery codes where applicable.
3. Verify account ownership.
4. Change compromised credentials.
5. Review account activity.
6. Revoke unauthorized sessions or credentials where supported.
7. Confirm that repository and database access are restored.

## 8. Recovery Testing

A backup is only useful if it can actually be restored.

The project should periodically test:

- Downloading the repository.
- Rebuilding the application.
- Restoring a database export.
- Recreating database structures from migrations.
- Restoring required functions and security policies.
- Verifying Scripture records.
- Testing the rotation functionality.
- Testing the preacher reading functionality.

Recovery tests should be documented with the test date, results, and any corrective action.

## 9. Recovery Priorities

The following recovery priorities are recommended.

| Priority | Component | Objective |
|---|---|---|
| 1 | Source code and documentation | Restore project development capability |
| 2 | Supabase database | Restore application data |
| 3 | Database security and functions | Restore secure application operation |
| 4 | Application hosting | Restore public access |
| 5 | Administrative and display services | Restore church operations |

Actual recovery targets must be established before commercial production release.

## 10. Recovery Objectives

The commercial platform should establish two important targets.

**Recovery Point Objective (RPO):** The maximum acceptable amount of data loss measured in time.

**Recovery Time Objective (RTO):** The maximum acceptable time required to restore the service.

These targets must be agreed upon based on the service level offered to individual users and churches.

They should not be treated as guaranteed until the backup infrastructure has been tested.

## 11. Project Handover and Continuity

If another developer must take over the project, the following must be provided through authorized and secure channels:

- GitHub repository access.
- Supabase project access.
- Installation and setup guide.
- System architecture document.
- Database design document.
- Security guidelines.
- Backup and recovery guide.
- Current source-code status.
- Database migration history.
- Outstanding issues and development tasks.

The original project owner should retain ownership and control of the principal accounts.

Access should be granted according to each person's responsibilities.

## 12. Backup Verification Checklist

The following checklist should be completed periodically.

- [ ] GitHub repository is accessible.
- [ ] Latest source-code changes are committed.
- [ ] A separate repository backup exists.
- [ ] Database backup or export is available.
- [ ] Database migration files are current.
- [ ] Supabase access and recovery methods are available.
- [ ] Private credentials are securely stored.
- [ ] Documentation is up to date.
- [ ] Recovery procedures have been tested.
- [ ] Backup results and corrective actions are documented.

## 13. Current Backup Status

The current project has an established GitHub repository and Supabase backend.

However, the existence of these services alone does not confirm that a complete independent backup and tested recovery process is in place.

The following items must be verified and implemented:

| Item | Status |
|---|---|
| GitHub source repository | Established |
| GitHub version history | Available |
| Separate source-code backup | To be established and verified |
| Supabase database | Established |
| Independent database backup | To be established and verified |
| Database migration archive | Planned |
| Secure credential recovery | To be verified |
| Documented recovery test | Planned |

## 14. Document Maintenance

This document must be reviewed whenever the database, hosting infrastructure, backup arrangements, or recovery procedures change.

All significant updates must be recorded in the project documentation history.

---

**End of Document**

**Revolving Bible Project — Backup and Recovery Procedures**
