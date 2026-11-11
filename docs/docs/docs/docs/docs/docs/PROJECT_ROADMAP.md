# Revolving Bible — Project Development Roadmap

**Document ID:** RB-PR-001  
**Version:** 1.0  
**Project Owner / Founder:** Craig Francis  
**Document Owner:** Revolving Bible Project  
**Status:** Active Development  
**Last Updated:** November 2026

---

## 1. Purpose

This document defines the development roadmap for the Revolving Bible project.

It establishes the major development stages, deliverables, priorities, and completion requirements necessary to transform the existing web prototype into a commercial cross-platform application.

The roadmap will be updated as development progresses.

## 2. Product Objective

Develop a Scripture application serving two primary markets:

1. Individual Christians.
2. Churches and religious organizations.

The application will support:

- Android phones and tablets.
- iPhones and iPads.
- Church Scripture display screens.
- Centralized Scripture administration.
- Coordinated Scripture sharing.
- Secure cloud synchronization.

## 3. Current Project Status

<badge color="success">Prototype established</badge>

The initial web prototype has been created using GitHub Pages and Supabase.

| Component | Current status |
|---|---|
| GitHub repository | Completed |
| GitHub Pages hosting | Completed |
| Supabase connection | Completed |
| Scripture database | Completed |
| Initial 30 Scripture passages | Completed |
| 60-second rotation | Implemented |
| Countdown display | Implemented |
| Server-time synchronization | Implemented |
| Preacher-controlled reading concept | Established; implementation to be verified |
| QR Scripture page | Planned / implementation to be verified |
| Commercial user authentication | Planned |
| Multi-church administration | Planned |
| Android application | Planned |
| iOS application | Planned |
| Subscription system | Planned |

A feature must only be marked fully completed after its functionality has been tested.

## 4. Development Stage 1 — Complete the Web Prototype

<badge color="success">Foundation established</badge>

**Objective:** Finish and stabilize the existing web application.

### Required activities

- [x] Establish GitHub repository.
- [x] Configure GitHub Pages.
- [x] Connect Supabase.
- [x] Create initial database tables.
- [x] Insert initial Scripture passages.
- [x] Implement automatic Scripture rotation.
- [x] Implement countdown display.
- [x] Implement initial server-time synchronization.
- [ ] Verify synchronized transitions across multiple devices.
- [ ] Implement or verify independent preacher reading display.
- [ ] Implement or verify QR Scripture page.
- [ ] Improve mobile and tablet layouts.
- [ ] Expand and verify Scripture library.
- [ ] Conduct complete prototype testing.

**Completion requirement:** The church display, preacher reading, and QR experience must work reliably together.

## 5. Development Stage 2 — Commercial Backend Foundation

**Objective:** Prepare Supabase for individual accounts and multiple churches.

### Required activities

- [ ] Establish production database structure.
- [ ] Implement user authentication.
- [ ] Create user profiles.
- [ ] Create church organization records.
- [ ] Implement church membership.
- [ ] Establish role-based permissions.
- [ ] Implement church data separation.
- [ ] Create secure administrator functions.
- [ ] Implement audit logging.
- [ ] Establish production database migration procedures.
- [ ] Test Row Level Security policies.

**Completion requirement:** Individual users and multiple churches must be able to use the backend without unauthorized access to each other's information.

## 6. Development Stage 3 — Cross-Platform Mobile Application

**Objective:** Develop the Android and iOS versions using the proposed shared technology stack.

### Technology direction

- Ionic.
- React.
- Capacitor.
- Supabase.

### Individual application features

- [ ] User registration and sign-in.
- [ ] Daily Scripture.
- [ ] Automatic Scripture rotation.
- [ ] Scripture categories.
- [ ] Favourite passages.
- [ ] Scripture sharing.
- [ ] Personal preferences.
- [ ] Optional reminders.
- [ ] Offline Scripture access.

### Mobile compatibility

- [ ] Android phone layouts.
- [ ] Android tablet layouts.
- [ ] iPhone layouts.
- [ ] iPad layouts.
- [ ] Responsive screen behavior.
- [ ] Accessibility testing.

**Completion requirement:** The application must operate reliably on supported Android and Apple devices.

## 7. Development Stage 4 — Church Administration

**Objective:** Introduce the commercial church management features.

### Church functionality

- [ ] Church registration.
- [ ] Church administrator accounts.
- [ ] Church membership management.
- [ ] Preacher and service leader permissions.
- [ ] Church Scripture display configuration.
- [ ] Preacher-controlled readings.
- [ ] Multiple connected display screens.
- [ ] Shared QR Scripture access.
- [ ] Church service scheduling.
- [ ] Scripture of the Week.
- [ ] Congregation Scripture access.
- [ ] Authorized device management.

**Completion requirement:** An authorized church administrator must be able to manage the church's Scripture experience from a secure administration portal.

## 8. Development Stage 5 — Commercial Features

**Objective:** Prepare the application for sustainable commercial operation.

### Subscription functionality

- [ ] Establish free individual plan.
- [ ] Establish premium individual plan.
- [ ] Establish limited free church plan.
- [ ] Establish premium church plan.
- [ ] Select payment provider.
- [ ] Implement subscription management.
- [ ] Implement payment verification.
- [ ] Manage subscription renewals.
- [ ] Handle cancellations and expired subscriptions.

### Additional features

- [ ] Expand Scripture library.
- [ ] Add church-neutral reflections.
- [ ] Introduce reading plans.
- [ ] Introduce additional Scripture translations where properly licensed.
- [ ] Develop optional premium display themes.
- [ ] Introduce enhanced church reporting where appropriate.

**Completion requirement:** Paid features must be controlled securely and subscriptions must be tested from purchase through cancellation.

## 9. Development Stage 6 — Testing and Security

**Objective:** Verify the application's reliability, security, and readiness for public release.

### Required testing

- [ ] Functional testing.
- [ ] Mobile compatibility testing.
- [ ] Database security testing.
- [ ] Authentication testing.
- [ ] Church data isolation testing.
- [ ] QR access testing.
- [ ] Synchronization testing.
- [ ] Offline operation testing.
- [ ] Backup restoration testing.
- [ ] Performance testing.
- [ ] Accessibility testing.
- [ ] User acceptance testing.

### Security requirements

- [ ] Verify all relevant RLS policies.
- [ ] Verify administrator permissions.
- [ ] Verify secret-key protection.
- [ ] Review application dependencies.
- [ ] Test account recovery.
- [ ] Establish incident response procedures.
- [ ] Complete privacy and data protection review.

**Completion requirement:** Critical defects must be resolved and security requirements verified before production release.

## 10. Development Stage 7 — Commercial Publication

**Objective:** Publish the application for public use.

### Google Play

- [ ] Establish Google Play developer account.
- [ ] Prepare Android release build.
- [ ] Configure application signing.
- [ ] Prepare application icon.
- [ ] Prepare screenshots.
- [ ] Prepare store description.
- [ ] Complete privacy and data safety information.
- [ ] Complete testing requirements.
- [ ] Submit for review.

### Apple App Store

- [ ] Establish Apple Developer account.
- [ ] Prepare iOS release build.
- [ ] Configure signing and provisioning.
- [ ] Prepare application icon.
- [ ] Prepare screenshots.
- [ ] Prepare store description.
- [ ] Complete privacy information.
- [ ] Complete testing requirements.
- [ ] Submit for review.

Store policies and technical submission requirements must be checked again at the time of publication.

## 11. Documentation Requirements

The following project documents have been established or are being established:

- [x] `README.md`
- [x] `docs/PRODUCT_SPECIFICATION.md`
- [x] `docs/SYSTEM_ARCHITECTURE.md`
- [x] `docs/DATABASE_DESIGN.md`
- [x] `docs/SECURITY_GUIDELINES.md`
- [ ] `docs/INSTALLATION_AND_SETUP.md`
- [ ] `docs/BACKUP_AND_RECOVERY.md`
- [ ] `CHANGELOG.md`
- [ ] `docs/PROJECT_DECISIONS.md`
- [ ] `docs/PROJECT_ROADMAP.md`

Additional future documentation:

- API documentation.
- Database dictionary.
- Testing procedures.
- User guide.
- Church administrator guide.
- Mobile application deployment guide.
- Production maintenance guide.

Checklist entries above must be updated only after the relevant GitHub files and work have been verified.

## 12. Development Priorities

The following order is recommended:

| Priority | Work area | Importance |
|---|---|---|
| 1 | Complete current prototype | Critical |
| 2 | Secure commercial backend | Critical |
| 3 | Build mobile application | High |
| 4 | Implement church administration | High |
| 5 | Introduce subscriptions | Medium |
| 6 | Expand optional premium features | Medium |
| 7 | Publish and market application | High |

The order may be adjusted where technical dependencies require it.

## 13. Project Management Rules

The following rules will guide development:

1. Work on one major task at a time.
2. Test changes before moving to the next major task.
3. Commit significant source-code changes to GitHub.
4. Maintain separate backups of the database.
5. Never expose private credentials.
6. Document database changes.
7. Record important technical decisions.
8. Maintain a list of outstanding defects.
9. Distinguish completed features from planned features.
10. Preserve sufficient documentation for another developer to continue the project.

## 14. Future Release Milestones

The following release milestones are proposed:

| Milestone | Description |
|---|---|
| Prototype 1.0 | Working church Scripture display |
| Foundation 1.0 | Secure commercial backend |
| Mobile Beta 1.0 | Android and iOS testing versions |
| Church Edition 1.0 | Church administration and synchronized displays |
| Commercial 1.0 | Public commercial release |

These are development milestones, not confirmed release dates.

## 15. Final Project Objective

The long-term goal is to establish Revolving Bible as a reliable Scripture platform that connects individual Christians and churches through accessible Bible content, synchronized Scripture displays, and practical digital tools.

The application should remain simple to use while providing the security, reliability, and flexibility required for commercial operation.

---

**End of Document**

**Revolving Bible Project — Project Development Roadmap**
