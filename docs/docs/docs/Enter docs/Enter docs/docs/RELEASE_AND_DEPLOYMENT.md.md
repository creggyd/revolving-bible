# Revolving Bible — Release and Deployment Guide

**Document ID:** RB-RD-001  
**Version:** 1.0  
**Status:** Initial Release and Deployment Procedures  
**Project:** Revolving Bible  
**Document Owner:** Revolving Bible Project  

---

## 1. Purpose

This document establishes the procedures for preparing, testing, deploying, and maintaining Revolving Bible software releases.

It provides a consistent process for publishing application updates while protecting existing functionality, user information, and database integrity.

These procedures apply to the current web prototype and will be expanded for future Android and iOS releases.

## 2. Current Deployment Environment

The current prototype uses GitHub Pages for web hosting.

**GitHub repository:**

https://github.com/creggyd/revolving-bible

**Live application:**

https://creggyd.github.io/revolving-bible/

Current deployment configuration:

| Setting | Value |
|---|---|
| Source control | GitHub |
| Repository | revolving-bible |
| Deployment branch | main |
| Deployment folder | /(root) |
| Hosting | GitHub Pages |
| Backend | Supabase |
| Main application file | index.html |

The commercial mobile applications have not yet been deployed.

## 3. Release Management Principles

Every release must follow these principles:

1. Changes must be documented.
2. Existing functionality must be protected.
3. Important changes must be tested before publication.
4. Database changes must be backed up and documented.
5. Security permissions must be reviewed.
6. Releases must have identifiable versions.
7. A recovery procedure must be available.
8. The live application must be checked after deployment.

## 4. Version Numbering

The project should use semantic versioning.

The format is:

`MAJOR.MINOR.PATCH`

For example:

`1.0.0`

- **MAJOR:** Significant changes that may introduce incompatibility.
- **MINOR:** New features that remain compatible with existing functionality.
- **PATCH:** Bug fixes and minor improvements.

The current prototype should receive an official release version when the project owner approves its first formal release.

## 5. Pre-Release Checklist

Before publishing a release, confirm the following:

### Source Code

- Review all modified files.
- Confirm that changes are intentional.
- Remove temporary debugging code.
- Check that no secret credentials have been included.
- Confirm that the latest source code is committed to GitHub.

### Application Functionality

- Scripture passages load correctly.
- Automatic rotation works.
- Countdown operates correctly.
- Server-time synchronization works.
- Responsive layouts are acceptable.
- Existing features remain functional.

### Backend

- Supabase connectivity is operational.
- Database structure is correct.
- RLS policies remain enabled.
- Database changes have been reviewed.
- Required backups are available.

### Documentation

- Update `CHANGELOG.md`.
- Update relevant technical documents.
- Record known limitations.
- Record any important configuration changes.

## 6. Current Web Deployment Procedure

The current application is deployed through GitHub Pages.

The deployment process is:

1. Open the GitHub repository.
2. Review the changes to be published.
3. Confirm that the changes have been committed to the `main` branch.
4. Allow GitHub Pages to publish the update.
5. Open the live application.
6. Confirm that the application loads successfully.
7. Test the affected functionality.
8. Check that important existing features still work.

A successful commit alone does not establish that deployment has succeeded.

The live website must be tested after publication.

## 7. Post-Deployment Verification

After every significant deployment, verify:

| Test | Expected result |
|---|---|
| Website access | Application opens |
| Supabase connection | Database responds |
| Scripture retrieval | Active passages load |
| Rotation | Passages change correctly |
| Countdown | Countdown operates correctly |
| Synchronization | Devices follow server-time rotation |
| Mobile layout | Content remains readable |
| Error handling | Failures do not crash the application |

Record the results of important release tests.

## 8. Database Deployment

Database changes must be handled separately from ordinary frontend deployments.

Before applying a database change:

1. Review the current database structure.
2. Identify affected tables and functions.
3. Prepare a SQL migration script.
4. Review the security implications.
5. Back up relevant data.
6. Test the migration where possible.
7. Apply the approved migration.
8. Verify the resulting database structure.
9. Update `DATABASE_DESIGN.md`.
10. Record the change in `CHANGELOG.md`.

Never assume that reverting frontend code automatically reverses a database migration.

## 9. Development and Production Environments

As the commercial product grows, separate environments should be established.

### Development

Used for:

- Writing and modifying code.
- Testing new features.
- Experimenting with database changes.
- Debugging errors.

### Testing / Staging

Used for:

- Testing release candidates.
- Checking integrations.
- Performing security tests.
- Verifying mobile compatibility.

### Production

Used by actual application users.

Production changes must be controlled and approved.

The current prototype uses its existing GitHub Pages and Supabase configuration. Separate commercial environments remain a future requirement.

## 10. Failed Deployment and Rollback

If a deployment causes a serious problem:

1. Identify the affected feature.
2. Determine whether the problem is frontend, backend, or database-related.
3. Review the latest GitHub commit.
4. Identify the last known working version.
5. Restore the appropriate source-code version if necessary.
6. Re-test the live application.
7. Document the incident.
8. Correct the underlying issue before attempting another release.

For database problems, use the documented recovery and migration procedures.

Never perform an unreviewed database rollback that could cause data loss.

## 11. Release Notes

Every significant release must have release notes.

Release notes should identify:

- Version number.
- Release date.
- New features.
- Improvements.
- Bug fixes.
- Known limitations.
- Important database changes.
- Any action required from users.

The project's `CHANGELOG.md` should remain the central record of significant development changes.

## 12. GitHub Release Management

Formal software releases should eventually be tagged in GitHub.

Recommended process:

1. Confirm that the release has passed testing.
2. Update the version number.
3. Update `CHANGELOG.md`.
4. Commit all approved changes.
5. Create a GitHub release tag.
6. Add release notes.
7. Preserve the release source code.

Example tag:

`v1.0.0`

GitHub releases will provide a traceable history of published versions.

## 13. Future Android Release

The planned Android application will use the commercial mobile architecture.

Before publication through Google Play:

- Complete Android application packaging.
- Configure the application identifier.
- Configure signing and release credentials.
- Test on supported Android devices.
- Prepare screenshots and store descriptions.
- Complete privacy and data safety disclosures.
- Review current Google Play technical and policy requirements.
- Upload the approved release package.
- Complete the store review process.

Developer credentials and signing keys must be stored securely.

## 14. Future Apple Release

Before publication through the Apple App Store:

- Complete iOS application packaging.
- Configure the application identifier.
- Configure signing and provisioning.
- Test on supported iPhone and iPad devices.
- Prepare screenshots and store descriptions.
- Complete privacy disclosures.
- Review current Apple App Store requirements.
- Submit the application for review.

Apple developer credentials and signing certificates must be protected.

## 15. Release Approval

A formal release should be approved by the project owner or an authorized release manager.

Approval should confirm:

- Required functionality has been tested.
- Critical defects have been resolved.
- Security requirements have been reviewed.
- Documentation is current.
- Backups are available.
- Deployment and recovery procedures are understood.

## 16. Release Records

Maintain the following records:

- Version number.
- Release date.
- GitHub commit reference.
- Changes introduced.
- Test results.
- Approval record.
- Deployment status.
- Known issues.
- Recovery information.

These records will support future maintenance and developer handover.

## 17. Current Project Release Status

The current Revolving Bible prototype is deployed through GitHub Pages and uses Supabase as its backend.

The project has demonstrated working Scripture retrieval, automatic rotation, a countdown, and server-time synchronization functionality.

The commercial mobile application, formal production release process, and app-store publication procedures remain future development activities.

---

**End of Document**

**Document ID:** RB-RD-001  
**Version:** 1.0
