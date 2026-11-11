# Revolving Bible — Security Guidelines

**Document ID:** RB-SG-001  
**Version:** 1.0  
**Project Owner / Founder:** Craig Francis  
**Document Owner:** Revolving Bible Project  
**Status:** Development Standard  
**Last Updated:** November 2026

---

## 1. Purpose

This document establishes the security requirements and guidelines for the Revolving Bible platform.

The objective is to protect user accounts, church information, Scripture administration functions, application data, and backend infrastructure against unauthorized access, accidental disclosure, data loss, and malicious activity.

Security must be considered throughout development, testing, deployment, and ongoing maintenance.

## 2. Security Principles

The project will follow these principles:

1. **Least Privilege:** Every user receives only the permissions necessary to perform their assigned duties.
2. **Secure by Default:** New accounts, churches, devices, and database records must not receive unnecessary access.
3. **Data Separation:** Each church must only access information belonging to its own organization unless explicitly authorized otherwise.
4. **Authentication:** Administrative functions must require an authenticated and authorized account.
5. **Confidentiality:** Personal information and private church information must be protected.
6. **Integrity:** Only authorized users may modify protected information.
7. **Availability:** Appropriate backups and recovery procedures must be maintained.

## 3. User Roles and Access Control

The application will support different access levels.

### 3.1 Individual User

An individual account may:

- View available Scripture passages.
- Access daily and rotating Scripture features.
- Save favourite passages.
- Share Scripture references and permitted text.
- Manage personal preferences.
- Manage their own account.

An individual user must not access church administration functions without an appropriate church role.

### 3.2 Church Member

A church member may:

- View the church's shared Scripture content.
- Access preacher-selected readings.
- Scan the church QR code.
- View authorized church information.

A regular member must not modify church settings or administrative content unless separately authorized.

### 3.3 Church Administrator

A church administrator may:

- Manage authorized church settings.
- Manage church Scripture display configurations.
- Assign and manage church membership roles, subject to authorization rules.
- Manage preacher readings.
- Manage authorized display devices.
- View relevant church activity records.

### 3.4 Preacher or Service Leader

An authorized preacher or service leader may:

- Select Scripture readings for a service.
- Update the designated preacher reading.
- View the church's relevant display settings.

This role must not automatically receive full church ownership or subscription-management privileges.

### 3.5 Platform Administrator

A platform administrator may manage platform-wide operations according to approved administrative procedures.

Platform-wide privileges must be restricted to trusted, authorized personnel.

Administrative access must be monitored and protected.

## 4. Authentication Requirements

The commercial application must use a secure authentication system.

Supabase Authentication is the planned authentication provider.

Requirements:

- Users must authenticate before accessing protected account information.
- Passwords must be handled by the authentication provider and never stored in plain text by the application.
- Password-reset procedures must verify account ownership.
- Sessions must be managed securely.
- Users must be able to sign out.
- Administrative accounts should use multi-factor authentication where supported.
- Account recovery procedures must not expose private account information.

## 5. Supabase Security

Supabase will provide the backend database and authentication services.

The following requirements apply:

### 5.1 Row Level Security (RLS)

Row Level Security must remain enabled on every table containing private or administrative data.

Policies must restrict access based on:

- Authenticated user identity.
- Church membership.
- Assigned role.
- Ownership of the relevant record.
- The specific operation being performed.

Public read access must only be granted where the information is intentionally available to the public.

### 5.2 Database Permissions

Database permissions must follow the principle of least privilege.

Public or anonymous users must not receive unrestricted permissions to:

- Insert records.
- Update records.
- Delete records.
- Manage church membership.
- Change administrative settings.
- Modify subscription information.

Authenticated users must also be restricted according to their assigned permissions.

### 5.3 Database Functions

Database functions must be reviewed for security risks.

Functions that perform administrative operations must verify the caller's authorization.

Security-sensitive functions should use carefully controlled execution permissions and must not expose privileged operations to unauthorized users.

## 6. API Keys and Application Secrets

The following rules are mandatory:

- Supabase publishable keys may be used in the public application when appropriate database security policies are enforced.
- Supabase secret keys and service-role keys must never be placed in frontend JavaScript, mobile application source code, public GitHub repositories, or publicly accessible configuration files.
- Private credentials must be stored in secure server-side configuration.
- Environment files containing secrets must not be committed to GitHub.
- An `.env.example` file may contain placeholder values but must never contain actual credentials.
- Exposed credentials must be rotated immediately.

## 7. Church Data Separation

The commercial application will support multiple churches.

Each church must have a unique organization record and its own authorized membership structure.

All church-specific records must be associated with the correct church identifier.

Database policies must prevent users from accessing another church's private information merely by changing a record identifier or request parameter.

Church membership and role assignments must be validated on the backend.

A user may belong to more than one church, but access must be determined separately for each church.

## 8. QR Code and Public Display Security

QR codes are intended to provide convenient access to Scripture content.

The following safeguards will apply:

- Public QR pages must only expose content intended for public viewing.
- QR access must not reveal administrator credentials or private account information.
- QR pages must not provide database write access.
- Public display devices must not receive administrative permissions.
- Private church settings must not be exposed through public display pages.
- Any device registration or remote-control feature must use authenticated authorization.

## 9. Device and Session Security

The application will support phones, tablets, and church display screens.

Security requirements include:

- Administrative sessions must be protected.
- Lost or compromised devices must be capable of being disconnected or revoked where supported.
- Display devices must not retain unnecessary administrative credentials.
- Device registration must be authenticated.
- Sensitive account information must not be stored unnecessarily on devices.
- Offline data must be limited to information required for the application to function.

## 10. Data Protection and Privacy

The platform must collect only the information necessary to provide its services.

Before commercial release, the project must establish:

- A Privacy Policy.
- Terms of Service.
- An appropriate data-retention policy.
- Account deletion procedures.
- Procedures for handling user data requests.
- Appropriate consent and notification processes.
- Applicable legal and regulatory compliance requirements.

The application should avoid collecting sensitive personal information unless there is a clear business and operational need.

## 11. Audit Logging and Monitoring

Security-relevant activities should be recorded.

Examples include:

- Administrator sign-ins.
- Failed authentication attempts.
- Church membership changes.
- Role and permission changes.
- Scripture administration changes.
- Display-device registration and revocation.
- Subscription and account-management events.

Audit logs must be protected against unauthorized modification or deletion.

Logs should not contain passwords, secret keys, or unnecessary personal information.

## 12. Backup and Recovery

The project must maintain reliable backups of:

- Database records.
- Application source code.
- Database schema and migration scripts.
- Important application configuration.
- Technical documentation.

GitHub will serve as the primary source-code repository.

Database backups must be maintained separately from GitHub.

A documented restoration procedure must be tested periodically.

## 13. Development and Deployment Security

Before changes are released:

1. Review code for exposed credentials.
2. Review database permissions and RLS policies.
3. Test authentication and authorization.
4. Test church data separation.
5. Review administrative functions.
6. Test public QR access.
7. Check dependencies for known vulnerabilities.
8. Verify that production configuration does not expose development credentials.

Development, testing, and production environments should be separated as the project grows.

Changes to database structure and security policies must be documented and version-controlled.

## 14. Incident Response

A documented response process must be followed if a security incident occurs.

The process should include:

1. Identify and assess the incident.
2. Restrict or disable compromised access.
3. Rotate exposed credentials where necessary.
4. Preserve relevant security logs.
5. Determine the scope of affected accounts and data.
6. Restore affected services or data where required.
7. Notify affected parties and relevant authorities where legally required.
8. Document the incident and corrective measures.

## 15. Current Security Status

The following table distinguishes existing prototype safeguards from planned commercial controls.

| Security item | Current status |
|---|---|
| Supabase backend | Implemented |
| RLS enabled on prototype tables | Implemented |
| Public read policies | Implemented |
| Public write restrictions | Implemented through absence of public write policies |
| Server-time RPC | Implemented |
| User authentication | Planned |
| Church membership and roles | Planned |
| Multi-church data isolation | Planned |
| Administrator permissions | Planned |
| Audit logging | Planned |
| Device registration and revocation | Planned |
| Subscription security | Planned |
| Formal security testing | Planned |

**Important:** The current prototype must not be considered a fully secured commercial application. The planned controls must be implemented and tested before production release.

## 16. Security Acceptance Criteria

The commercial platform must not be approved for release until:

- Authentication works correctly.
- Administrative permissions are enforced.
- RLS policies have been tested.
- Church data separation has been verified.
- Public users cannot modify protected records.
- Secret keys are not exposed in client-side code.
- QR pages expose only intended public content.
- Backup and recovery procedures have been tested.
- Privacy and account-management requirements have been addressed.
- Security testing has been completed and documented.

## 17. Document Maintenance

This document must be reviewed whenever significant changes are made to the application's architecture, authentication system, database permissions, or administrative functionality.

All revisions must be recorded in the project's documentation history.

---

**End of Document**

**Revolving Bible Project — Security Guidelines**
