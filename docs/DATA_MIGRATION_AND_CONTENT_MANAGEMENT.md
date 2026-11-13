# Data Migration and Content Management Plan

## 1. Purpose

This document establishes how data and Scripture content will be managed, maintained, transferred, and protected throughout the development of the Revolving Bible platform.

The objective is to ensure that the platform can grow from its current prototype into a reliable commercial service without losing important information or compromising content accuracy.

## 2. Scope

This plan covers:

- Scripture passage management.
- Bible translation information.
- Reflection and commentary content.
- Church and user information.
- Preacher-controlled readings.
- Rotation settings.
- Database structure changes.
- Data imports and exports.
- Migration between development and production environments.
- Data backup and recovery.

## 3. Current Database Structure

The existing Supabase prototype contains three principal tables.

| Table | Purpose |
|---|---|
| `bible_passages` | Stores Scripture passages and related references. |
| `rotation_settings` | Stores automatic rotation configuration. |
| `preacher_readings` | Stores preacher-selected Scripture readings. |

These tables provide the foundation for the prototype.

The commercial platform may require additional tables to support individual accounts, multiple churches, user permissions, subscriptions, and registered display devices.

Any database expansion must be documented and implemented through controlled database migrations.

## 4. Scripture Content Management

The Scripture library must be centrally managed and expandable.

The current prototype contains 30 active passages.

The commercial product should support:

- At least 365 passages as an initial expanded library target.
- Expansion to 1,000 or more passages.
- Additional passages without changing application source code.
- Categorization by Scripture theme.
- Translation identification.
- Content verification before publication.
- Activation and deactivation of passages.

The library must not have an artificial limit of 30 passages.

## 5. Scripture Record Requirements

Each Scripture record should maintain appropriate information, including:

- Unique record identifier.
- Bible book.
- Chapter.
- Starting verse.
- Ending verse, where applicable.
- Complete passage text.
- Translation.
- Active or inactive status.
- Date created.
- Date last updated, where supported.

The database must preserve accurate references and translation information.

## 6. Content Categories

The Scripture library should support categories such as:

- Faith.
- Love.
- Hope.
- Wisdom.
- Prayer.
- Forgiveness.
- Strength.
- Family.
- Peace.
- Salvation.
- Encouragement.
- Christian living.

Categories should help administrators organize content and help users discover relevant passages.

## 7. Content Approval Process

New Scripture content should follow a controlled approval process.

1. Identify the Scripture passage and source.
2. Confirm the book, chapter, and verse references.
3. Verify the wording against the approved translation source.
4. Confirm that commercial use is permitted.
5. Enter the content into the management system.
6. Review the saved record.
7. Approve the content for publication.
8. Confirm that it displays correctly.

Unverified content should not be published.

## 8. Reflection and Commentary Management

The platform may include short reflections connected to Scripture passages.

Reflection management should follow these principles:

- Reflections should be church-neutral and broadly accessible.
- Scripture and commentary must be clearly distinguished.
- Commentary should accurately reflect the passage.
- Denomination-specific doctrine should not be presented as universally accepted Christian teaching.
- Externally sourced material must be appropriately licensed.
- Reflections should be reviewed before publication.

## 9. Data Migration

Data migration is the controlled transfer of information from one database, application environment, or data format to another.

Migration may be required when:

- Moving from the prototype to the commercial database.
- Introducing a revised database structure.
- Expanding the Scripture library.
- Moving to a different hosting provider.
- Importing approved Scripture content.
- Introducing multi-church functionality.

Every migration must be planned, documented, and tested.

## 10. Migration Procedure

The following procedure should be used for significant migrations.

### Preparation

- Identify the data being transferred.
- Document the source and destination.
- Review the existing database structure.
- Identify required field mappings.
- Check for duplicate or incomplete records.
- Create an independent backup.

### Testing

- Perform the migration in a non-production environment where available.
- Confirm that all required records are transferred.
- Check Scripture references and text.
- Verify record relationships.
- Review access permissions.
- Record errors and correct them.

### Production Migration

- Obtain appropriate approval.
- Confirm that a current backup exists.
- Perform the migration.
- Verify record counts and data integrity.
- Test affected application functions.
- Record the migration date and outcome.

### Recovery

If a migration causes serious problems:

- Stop further migration activity.
- Assess the extent of the problem.
- Restore from a verified backup or apply a tested recovery procedure.
- Confirm that the application operates correctly.
- Document the incident and corrective action.

## 11. Database Change Management

Database structure changes must be version-controlled.

Each significant change should include:

- A migration filename or identifier.
- A description of the change.
- The date introduced.
- The reason for the change.
- Any affected application functions.
- Testing results.
- Recovery considerations.

Changes must not be made without documenting their impact on existing data and application functionality.

## 12. Data Integrity and Duplicate Prevention

The platform should use appropriate database constraints and validation to prevent:

- Duplicate Scripture records.
- Invalid Bible references.
- Missing required information.
- Incorrect translation identifiers.
- Broken relationships between records.
- Accidental overwriting of approved content.

Import procedures should check for existing records before inserting new ones.

## 13. Data Access and Protection

Data access must follow the security principles established in the project security documentation.

Requirements include:

- Row Level Security where appropriate.
- Role-based administrative access.
- Separation of church-specific information.
- Restricted write permissions.
- Secure authentication.
- Protection of administrative credentials.
- Appropriate logging of important administrative changes.

Public users should only access information intended for public display.

## 14. Data Export and Backup

The project should support appropriate exports of:

- Scripture library records.
- Approved reflections.
- Database schema.
- Migration scripts.
- Relevant configuration information.

Exports and backups should be stored securely.

GitHub source code version control must not be treated as a replacement for database backups.

Refer to:

`docs/BACKUP_AND_RECOVERY.md`

## 15. Data Retention and Deletion

The commercial platform should establish clear retention and deletion rules for:

- User accounts.
- Church records.
- Administrative activity.
- Subscription information.
- User-created content.
- Technical logs.

Retention periods must be determined according to business requirements and applicable privacy and legal obligations.

Deletion procedures should prevent accidental removal of information belonging to other users or churches.

## 16. Future Commercial Database Expansion

The commercial database is expected to support additional entities, potentially including:

- `users`
- `churches`
- `church_members`
- `church_settings`
- `registered_devices`
- `subscriptions`
- `content_categories`
- `reflections`
- `audit_logs`

These are proposed future entities, not confirmation that the tables already exist.

The final database design must be reviewed before implementation.

## 17. Migration Readiness Checklist

Before a significant migration:

- [ ] Migration objective documented.
- [ ] Source and destination identified.
- [ ] Database structure reviewed.
- [ ] Data mapping completed.
- [ ] Backup created and verified.
- [ ] Duplicate checks completed.
- [ ] Test migration completed.
- [ ] Data integrity verified.
- [ ] Access permissions reviewed.
- [ ] Recovery procedure prepared.
- [ ] Migration outcome documented.

## 18. Current Project Status

The current prototype uses Supabase to store Scripture passages, rotation settings, and preacher readings.

The expanded Scripture library, content administration interface, multi-church database structure, and commercial data migration procedures remain future development objectives unless separately implemented and verified.

## 19. Document Ownership

**Document owner:** Revolving Bible Project

**Version:** 1.0

**Status:** Development and data management planning document

**Review frequency:** Whenever significant database or content management changes are introduced.
