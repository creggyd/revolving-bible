# USER ROLES AND ACCESS CONTROL POLICY

**Project:** Revolving Bible  
**Document ID:** RB-AC-001  
**Version:** 1.0  
**Status:** Internal Policy – Draft for Review  
**Document Owner:** Revolving Bible Project  
**Project Owner:** Craig Francis  
**Last Updated:** November 2026

---

## 1. Purpose

This document defines the user roles, permissions, and access control requirements for the Revolving Bible platform.

The purpose is to ensure that every user has access only to the information and functions required for their responsibilities.

Access control is particularly important as the platform expands to support multiple churches, individual accounts, administration portals, and synchronized Scripture displays.

## 2. Access Control Principles

The platform will follow these principles:

1. **Least privilege:** Users receive only the permissions required to perform their duties.
2. **Role-based access:** Permissions are assigned according to defined roles.
3. **Separation of responsibilities:** Sensitive administrative functions are restricted to authorized personnel.
4. **Church data isolation:** One church must not access another church's private information.
5. **Accountability:** Important administrative actions should be recorded.
6. **Secure authentication:** Users must authenticate before accessing restricted functions.
7. **Regular review:** Permissions should be reviewed and removed when no longer required.

## 3. Proposed User Roles

The commercial platform will support the following roles.

### 3.1 System Owner / Super Administrator

This role has the highest level of administrative authority.

Responsibilities may include:

- Managing the overall platform.
- Creating and managing church organizations.
- Assigning system administrators.
- Managing global application settings.
- Managing subscription configurations.
- Managing the central Scripture library.
- Reviewing security and audit records.
- Managing platform-wide access permissions.

This role must be restricted to explicitly authorized personnel.

### 3.2 System Administrator

The System Administrator manages technical and operational aspects of the platform.

Permissions may include:

- Managing authorized system users.
- Troubleshooting platform operations.
- Monitoring system availability.
- Managing approved technical configurations.
- Reviewing relevant security logs.
- Supporting church administrators.

System Administrators should not automatically receive unrestricted access to personal or church content unless their responsibilities require it.

### 3.3 Content Administrator

The Content Administrator manages the central Scripture and supplementary content library.

Responsibilities may include:

- Adding Scripture passages.
- Editing incorrect references or text.
- Managing passage categories.
- Activating and deactivating passages.
- Managing approved translations.
- Reviewing reflections.
- Maintaining content quality.

This role should not automatically have access to subscription or sensitive user-account information.

### 3.4 Church Administrator

The Church Administrator manages an individual church's account.

Permissions may include:

- Updating church information.
- Inviting authorized church users.
- Assigning church-level roles.
- Managing church display settings.
- Configuring rotation preferences.
- Managing service schedules.
- Selecting weekly Scripture passages.
- Reviewing church-specific activity records.

A Church Administrator must not access another church's private information.

### 3.5 Preacher / Scripture Presenter

This role is intended for individuals authorized to manage preacher-controlled readings.

Permissions may include:

- Selecting Scripture readings.
- Updating the current service reading.
- Changing the displayed passage during a service.
- Viewing the relevant church Scripture settings.

This role should not automatically receive permission to manage church subscriptions, users, or global platform settings.

### 3.6 Display Operator

This role is intended for individuals responsible for operating church display screens.

Permissions may include:

- Opening authorized display pages.
- Selecting approved display layouts.
- Starting or stopping supported display functions.
- Monitoring the current Scripture display.

Display Operators should not have access to sensitive administrative settings unless separately authorized.

### 3.7 Individual User

An Individual User uses the personal Scripture features of the platform.

Permissions may include:

- Viewing Scripture passages.
- Using automatic Scripture rotation.
- Saving favourite passages.
- Sharing Scripture.
- Managing personal preferences.
- Receiving optional notifications.

An Individual User must not access private church administration functions.

### 3.8 Guest / Public Visitor

Guests may access publicly available features without creating an account, where permitted.

Possible permissions include:

- Viewing public Scripture displays.
- Opening QR-code Scripture pages.
- Viewing publicly available Scripture content.

Guests must not access restricted user accounts, church records, or administrative functions.

## 4. Role and Permission Matrix

The following matrix establishes the proposed default permissions.

| Function | Super Admin | System Admin | Content Admin | Church Admin | Preacher | Display Operator | Individual | Guest |
|---|---|---|---|---|---|---|---|---|
| View public Scripture | Yes | Yes | Yes | Yes | Yes | Yes | Yes | Yes |
| Manage central Scripture library | Yes | Limited | Yes | No | No | No | No | No |
| Manage system settings | Yes | Yes | No | No | No | No | No | No |
| Manage church information | Yes | Support only | No | Own church | No | No | No | No |
| Manage church users | Yes | Support only | No | Own church | No | No | No | No |
| Change preacher reading | Yes | Support only | No | Own church | Assigned church | No | No | No |
| Manage display settings | Yes | Support only | No | Own church | Limited | Assigned church | No | No |
| Manage personal favourites | No | No | No | No | No | No | Own account | No |
| Manage subscriptions | Yes | Limited | No | Own church | No | No | Own account | No |
| View private audit records | Yes | Authorized | No | Own church, limited | No | No | No | No |

The matrix represents the intended design. Exact permissions must be enforced by the backend, not merely hidden in the application interface.

## 5. Multi-Church Access Control

The commercial platform must support multiple independent church organizations.

Each church must have its own organizational identity and protected records.

The system must ensure that:

- Church administrators can manage only their assigned church.
- Preachers can access only authorized church readings.
- Display operators can access only assigned display functions.
- Church membership changes do not affect other churches.
- Subscription information is isolated by church.
- Private records cannot be retrieved by changing a URL or database request.

Supabase Row Level Security (RLS) will be used to enforce appropriate data isolation.

## 6. Authentication Requirements

Restricted features must require secure authentication.

The platform should support:

- Secure email-based registration.
- Secure login.
- Password recovery.
- Session management.
- Account verification where appropriate.
- Optional multi-factor authentication for privileged accounts.

Administrative accounts should receive stronger protection than ordinary public access.

## 7. Permission Assignment

Permissions must be assigned deliberately.

The system should:

1. Verify the user's identity.
2. Confirm the user's organizational membership.
3. Identify the assigned role.
4. Apply the permissions associated with that role.
5. Record significant permission changes.

Users must not be able to assign themselves higher privileges.

## 8. Account Suspension and Role Removal

When a user leaves a church or no longer requires access:

- The Church Administrator should remove or revoke the user's church membership.
- The system should immediately restrict the relevant church permissions.
- Existing sessions should be reviewed or invalidated where necessary.
- Important access changes should be recorded.

Suspended accounts should not retain access through previously issued credentials or sessions.

## 9. Administrative Audit Records

The platform should record important administrative actions, including:

- User creation.
- Role assignment.
- Role removal.
- Church membership changes.
- Changes to church settings.
- Scripture library modifications.
- Subscription administration.
- Account suspension.
- Security-related changes.

Audit records should identify the action, responsible account, relevant organization, and timestamp.

Access to audit records must itself be restricted.

## 10. Database and Backend Enforcement

The platform must enforce access controls through backend security mechanisms.

The planned implementation should include:

- Supabase Authentication.
- Row Level Security policies.
- Church membership records.
- Role assignment records.
- Secure database functions where necessary.
- Protected administrative operations.
- Server-side validation.

The application interface must never be treated as the only security boundary.

Public database access should be limited to information deliberately intended for public display.

## 11. Privileged Account Protection

Privileged accounts must:

- Use strong, unique passwords.
- Enable multi-factor authentication where supported.
- Avoid sharing login credentials.
- Use approved devices and secure connections.
- Be reviewed periodically.
- Have access removed when no longer authorized.

Service-role keys and other secret credentials must never be included in public application code or committed to GitHub.

## 12. Future Role Expansion

Additional roles may be introduced as the platform develops, including:

- Regional Church Administrator.
- Content Reviewer.
- Technical Support Officer.
- Subscription Manager.
- Church Display Coordinator.

New roles must have documented responsibilities and permissions before implementation.

## 13. Testing Requirements

Before commercial release, the access control system must be tested to confirm that:

- [ ] Individual users cannot access church administration functions.
- [ ] Guests cannot access restricted pages.
- [ ] Preachers cannot modify unauthorized church settings.
- [ ] Display Operators cannot access sensitive account information.
- [ ] Church Administrators cannot access another church's records.
- [ ] Content Administrators cannot manage unrelated subscription records.
- [ ] System-level permissions are appropriately restricted.
- [ ] Removed users lose access.
- [ ] RLS policies prevent unauthorized database access.
- [ ] Administrative actions are recorded where required.

## 14. Review and Maintenance

This policy must be reviewed whenever new roles, organizational structures, or administrative functions are introduced.

Changes to permissions must be documented and tested before deployment.

**Document Owner:** Revolving Bible Project  
**Project Owner:** Craig Francis  
**Status:** Internal Policy – Draft for Review

**End of Document**
