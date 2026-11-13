# Operations and Maintenance Plan

## 1. Purpose

This document defines how the Revolving Bible platform will be maintained, monitored, supported, and kept operational as it develops from its current prototype into a commercial product.

The objective is to ensure reliability, security, data protection, and continuity of service for individual users and participating churches.

## 2. Scope

This plan covers:

- The existing web-based prototype.
- The Supabase database and backend services.
- The GitHub repository and website deployment.
- Future Android and iOS applications.
- Church administration and display services.
- Scripture content and reflection management.
- User support, incident management, backups, and recovery.

Some procedures described here are planned requirements and have not yet been implemented.

## 3. Operational Responsibilities

The following responsibilities should be assigned as the platform develops.

### Project Owner

- Oversees the product and its development.
- Approves major changes and releases.
- Reviews operational performance.
- Ensures that documentation remains current.

### Technical Administrator

- Maintains the application and backend.
- Monitors service availability.
- Manages database changes and backups.
- Reviews security settings and access permissions.
- Investigates technical incidents.

### Content Administrator

- Reviews and manages Scripture content.
- Checks passage references and transcription accuracy.
- Reviews reflections before publication.
- Maintains content and translation records.

### Church Administrator

- Manages authorized church users.
- Maintains church-specific settings.
- Reports service and display problems.
- Ensures access is limited to approved personnel.

During the early development stage, one person may perform several of these responsibilities.

## 4. Core Service Components

The platform currently depends on the following services:

| Component | Purpose |
|---|---|
| GitHub | Source code, documentation, and version control |
| GitHub Pages | Hosting the current web prototype |
| Supabase | Database and backend services |
| Browser clients | Displaying Scripture and related content |

Future commercial services may include:

- Android application distribution through Google Play.
- iOS application distribution through the Apple App Store.
- Payment and subscription processing.
- Application monitoring and customer support services.

Third-party services must be documented and reviewed before commercial launch.

## 5. Monitoring and Availability

The platform should be monitored for:

- Website availability.
- Database connectivity.
- Scripture loading failures.
- Rotation synchronization problems.
- QR page availability.
- Authentication failures.
- Unusual database activity.
- Excessive response times.

Monitoring should eventually include automated availability checks and alerts.

Until automated monitoring is implemented, the project owner or technical administrator should perform periodic manual checks.

No monitoring process should be described as active until it has been configured and tested.

## 6. Maintenance Schedule

### Daily or Before Each Church Service

Where the platform is being used for a scheduled service:

- Confirm that the website or application loads.
- Confirm that Scripture passages appear correctly.
- Check that automatic rotation works.
- Verify that connected displays remain synchronized.
- Confirm that the preacher-controlled reading is correct.
- Test the QR code.
- Report any problems.

### Weekly

- Review reported issues.
- Check for failed deployments.
- Review important backend errors.
- Confirm that recently added content displays correctly.
- Review pending software updates.

### Monthly

- Review database health and storage usage.
- Check user accounts and administrative access.
- Review security policies.
- Confirm that backups are available.
- Review application performance.
- Update project documentation where necessary.

### Quarterly

- Review the overall security configuration.
- Test the backup restoration procedure.
- Review third-party services and dependencies.
- Evaluate operational costs.
- Review user feedback and recurring problems.
- Assess whether additional capacity is required.

## 7. Incident Management

An incident is any unexpected event that affects the availability, security, accuracy, or normal operation of the platform.

### Incident Severity

**Critical**

Examples:
- Complete platform outage.
- Confirmed unauthorized access to sensitive information.
- Major database failure.
- Widespread loss or corruption of data.

**High**

Examples:
- Scripture displays unavailable during a major church service.
- Rotation or synchronization fails across multiple displays.
- Authentication problems prevent administrators from accessing essential functions.

**Medium**

Examples:
- A particular feature is unavailable.
- A QR page fails while the main display continues working.
- Some users experience recurring errors.

**Low**

Examples:
- Minor layout problems.
- Typographical errors.
- Non-critical display inconsistencies.

### Incident Response Procedure

1. Record the date and time the incident was discovered.
2. Describe the affected service or feature.
3. Determine the severity and number of affected users.
4. Investigate the likely cause.
5. Apply an appropriate correction or temporary workaround.
6. Verify that the service has recovered.
7. Record the resolution.
8. Identify preventive actions where necessary.

Security incidents involving personal information must also be handled under the applicable privacy and data protection procedures.

## 8. Software Updates and Patching

Software updates must be managed carefully to avoid introducing new problems.

The following practices should apply:

- Review updates before applying them to production.
- Test important changes before deployment.
- Use Git commits to record modifications.
- Avoid making undocumented changes directly to production.
- Keep application dependencies reasonably current.
- Apply security updates promptly after assessing their impact.
- Maintain a record of significant changes.

Major changes should follow the procedures in:

`docs/SOFTWARE_DEVELOPMENT_AND_VERSION_CONTROL.md`

## 9. Database Maintenance

The Supabase database is a critical part of the platform.

Database maintenance must include:

- Reviewing table structures and relationships.
- Maintaining appropriate Row Level Security policies.
- Reviewing database permissions.
- Recording schema changes through version-controlled migrations.
- Monitoring storage and database usage.
- Avoiding unnecessary or duplicate Scripture records.
- Protecting administrative credentials.
- Maintaining independent backups.

Public-facing application code must never contain Supabase service-role or secret keys.

Database changes must be tested before being applied to the production environment.

## 10. Backup and Recovery

The project must maintain recoverable copies of:

- Application source code.
- Database schema and migration scripts.
- Important Scripture content.
- Application configuration documentation.
- Operational and security documentation.

GitHub version control is useful for recovering source code but must not be treated as a complete database backup.

Database backups should be maintained separately, and restoration procedures should be tested periodically.

Refer to:

`docs/BACKUP_AND_RECOVERY.md`

## 11. Scripture and Reflection Maintenance

Content accuracy is essential to the credibility of the Revolving Bible platform.

Content administrators should:

- Verify Scripture references.
- Check passage wording against the approved translation source.
- Correct transcription errors.
- Maintain translation information.
- Review reflections for accuracy and clarity.
- Keep reflections church-neutral and broadly accessible.
- Clearly distinguish biblical text from commentary.
- Review content before making it publicly available.

Additional Bible translations must not be introduced without reviewing the relevant copyright and licensing requirements.

Refer to:

`docs/CONTENT_AND_BIBLE_TRANSLATION_POLICY.md`

## 12. User and Church Support

A support process should be established for:

- Account access problems.
- Password and authentication issues.
- Church registration and administration.
- Display configuration.
- QR code problems.
- Scripture content reports.
- Subscription and billing enquiries.
- Technical faults.

Each reported issue should receive a reference number or another reliable tracking method.

Support records should contain only the information necessary to investigate and resolve the issue.

## 13. Business Continuity

The platform should be designed to recover from service interruptions and unexpected technical failures.

Continuity planning should consider:

- Supabase service interruptions.
- Website hosting problems.
- Internet connectivity failures at churches.
- Accidental deletion or modification of data.
- Failed application deployments.
- Loss of administrative access.
- Unavailability of the project owner or technical administrator.

Future versions should consider an offline or cached Scripture display so that a temporary internet interruption does not immediately prevent a church from displaying previously loaded passages.

## 14. Operational Performance Indicators

The following indicators should be reviewed as the platform grows:

- Website and application availability.
- Successful Scripture loading rate.
- Scripture rotation reliability.
- Display synchronization accuracy.
- Number of reported incidents.
- Average incident resolution time.
- Backup completion and restoration success.
- Number of unresolved high-priority issues.
- User and church support response times.

Performance targets should be established before commercial launch.

## 15. Commercial Launch Readiness

Before the commercial platform is released, the following operational requirements should be completed:

- [ ] Production hosting and backend configuration.
- [ ] Automated availability monitoring.
- [ ] Administrative access controls.
- [ ] Database backup and restoration procedures.
- [ ] Incident reporting and escalation process.
- [ ] Application update and release procedure.
- [ ] Customer support process.
- [ ] Privacy and security review.
- [ ] Third-party service and dependency register.
- [ ] Operational documentation review.

## 16. Current Development Status

The existing Revolving Bible project is a working web prototype connected to Supabase.

The commercial mobile applications, full church administration system, automated monitoring, subscription services, and complete operational support infrastructure remain development objectives unless separately implemented and verified.

This distinction must be maintained in project documentation to avoid confusing planned capabilities with completed features.

## 17. Document Review

This document should be reviewed:

- Before the first commercial release.
- Whenever significant infrastructure changes are made.
- Whenever operational responsibilities change.
- At least once every twelve months after commercial launch.

**Document status:** Development and operational planning document.

**Owner:** Revolving Bible Project

**Version:** 1.0
