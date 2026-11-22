independent content
# REVOLVING BIBLE
## Master Product, Technical and Presentation Guide

**Document edition:** 1.0  
**Date:** 20 November 2026  
**Project status:** Active development and testing  
**Repository:** https://github.com/creggyd/revolving-bible

---

## 1. Purpose of This Document

This is the central reference document for the Revolving Bible project.

It records the product vision, agreed functionality, technical architecture, user experiences, access permissions, security requirements, commercial model, development roadmap, testing results and outstanding decisions.

It is intended to serve as:

- The authoritative reference for future development.
- A record of agreed product decisions.
- A guide for developers and technical collaborators.
- A presentation resource for churches and potential partners.
- A record of implemented, tested and planned functionality.

This document must be updated whenever an important feature, technical decision, security change or testing result is agreed upon or implemented.

### Feature status definitions

| Status | Meaning |
|---|---|
| Implemented and verified | Functionality has been implemented and tested successfully. |
| Implemented; further verification required | Code exists, but broader testing is still required. |
| In development | Work has started but is not complete. |
| Planned | Approved direction for future development. |
| Proposed / validate | An idea requiring further evaluation before approval. |

A planned feature must never be presented as an existing capability.

---

## 2. Executive Product Overview

Revolving Bible is a Scripture display and engagement platform designed to help churches and individuals interact with the Bible through a continuously rotating Scripture experience, church-controlled readings and additional Scripture-based resources.

The product is intended to serve two audiences:

1. Churches seeking a simple, controlled Scripture display and congregation engagement platform.
2. Individuals seeking a personal Bible experience and additional Scripture resources.

The central experience is an automatic revolving display of selected King James Version (KJV) Bible passages.

The platform is intended to grow beyond a simple display into a broader Scripture engagement environment, with church administration, personal access, weekly Scripture study, accessibility features and subscription-based premium functionality.

### Core product principles

- Scripture should remain easy to access.
- Public Scripture display functionality should not require an account.
- Private church information must be protected.
- Church-specific functions must respect membership and user permissions.
- Users should only receive permissions they have been authorised to use.
- The product should support churches of different sizes.
- The interface should remain simple and suitable for church environments.
- Accessibility should be a core requirement, not an afterthought.
- Advanced features should be introduced without cluttering the main display.

---

## 3. Product Vision and Objectives

### Vision

To provide churches and individuals with an accessible, secure and engaging digital Scripture platform that makes Bible passages available throughout the day and supports meaningful interaction with Scripture.

### Objectives

1. Provide a continuously rotating Bible passage display.
2. Allow a preacher or authorised church representative to control service readings.
3. Allow congregation members to access the current Scripture through a QR code.
4. Support multiple churches with separate membership and permissions.
5. Provide a personal account experience for individuals.
6. Introduce structured weekly Scripture study and discussion.
7. Provide accessible Scripture reading for blind and low-vision users.
8. Support church-sponsored premium accounts.
9. Develop a sustainable subscription model.
10. Prepare the platform for eventual mobile application distribution.

---

## 4. Target Users

### 4.1 Churches

Churches can use Revolving Bible for:

- Sanctuary Scripture displays.
- Automatically rotating Bible passages.
- Preacher-controlled service readings.
- Congregation access through QR codes.
- Weekly Scripture study.
- Church member engagement.
- Additional premium church services.

### 4.2 Pastors, preachers and study leaders

Authorised leaders may eventually be able to:

- Select Scripture passages.
- Prepare service readings.
- Publish weekly studies.
- Create discussion questions.
- Manage study schedules.
- Moderate discussions, where authorised.

### 4.3 Church administrators

Church administrators will manage church-specific platform access, including:

- Membership approval.
- User invitations.
- Role assignments.
- Sponsored premium accounts.
- Church settings.
- Subscription and seat management.

### 4.4 Individual users

Individuals will be able to use the public Scripture experience and, depending on their subscription, access additional personal features.

---

## 5. Current Product Functionality

### 5.1 Automatic revolving Bible display

**Status: Implemented; further verification required**

The revolving display automatically changes Scripture passages at a configured interval.

Current technical settings include:

- Rotation interval: 60 seconds.
- Rotation start time stored in the database.
- Passage selection from the `bible_passages` table.
- KJV Scripture content.
- Shared database timing intended to keep multiple displays synchronised.

The passage library is expandable. The product is not limited to the original 30 test passages.

The intended library includes 365 curated passages, with the ability to add and manage more passages.

### 5.2 King James Version Bible database

**Status: Implemented**

The project uses the King James Version (KJV).

The `kjv_verses` database contains:

- 66 Bible books.
- 31,102 verses.

The Bible database is intended to support passage selection across other features, including service readings and weekly Scripture studies.

### 5.3 QR Scripture experience — Today's Word

**Status: Implemented and tested**

A QR code allows a person to open the current revolving Scripture on a mobile device.

The selected approach is Option B:

- The QR code opens the Scripture page.
- The page retrieves the current Scripture when it loads.
- The page displays the Scripture text and reference.
- It does not require the user to sign in.

This is intended to provide a simple congregation experience.

**Important:** Public access to this Scripture experience must remain separate from private church service-reading access.

### 5.4 Church display

**Status: Implemented; further responsive testing required**

The church display presents rotating Scripture passages for viewing in a church environment.

The display should be suitable for:

- Projectors.
- Television screens.
- Desktop monitors.
- Other large-format displays.

Visual refinements will follow testing across different screen sizes.

### 5.5 Preacher control

**Status: Existing application page; further permission and workflow verification required**

The preacher-control page is intended for authorised users who prepare or control church Scripture readings.

Access must be limited to users with appropriate church permissions.

### 5.6 Church service reading

**Status: Implemented; security and multi-church verification ongoing**

The service-reading page retrieves the latest published reading for a church.

Current fields include:

- Bible book.
- Chapter.
- Starting verse.
- Ending verse.
- Passage text.
- Translation.
- Service date.
- Service type.
- Display heading.
- Church identifier.

The page now checks for a valid signed-in Supabase session before retrieving a private church reading.

Users without a session receive a sign-in message.

A signed-in user must also have an active membership in the relevant church to access its reading.

**Production improvement required:** The current page contains a hard-coded `CHURCH_ID`. This must eventually be replaced with a secure, dynamically resolved church context to support multiple churches properly.

---

## 6. User Accounts and Church Membership

**Status: Partially implemented; registration and onboarding planned**

The platform will support individual accounts and church-specific memberships.

### 6.1 One account per email address

The agreed direction is one Revolving Bible account per email address.

A user may belong to multiple churches using the same account.

Each church membership may have a different role.

For example, a person may be:

- An ordinary member at Church A.
- A study leader at Church B.
- A church administrator at Church C.

Permissions must be evaluated in the context of the church where the user is operating.

### 6.2 Registration

**Status: Planned**

A dedicated registration page and onboarding workflow are required.

The intended process is:

1. User creates an account using an email address and password.
2. The account is created through Supabase Authentication.
3. The user requests access to a church or receives an invitation.
4. An authorised church administrator reviews the request.
5. The administrator approves the user.
6. An active church membership is created with the appropriate role.
7. The user receives access according to the assigned permissions.

Registration must not automatically grant church membership or administrative privileges.

### 6.3 Membership approval

**Status: Planned**

Church administrators must be able to approve, reject, deactivate or otherwise manage church membership requests.

The system must maintain a clear distinction between:

- A registered user.
- A user who has requested church access.
- An approved church member.
- An inactive or removed member.

A registered account alone must not grant access to private church information.

---

## 7. Roles and Permissions

**Status: Partially implemented; full permission matrix requires verification**

The platform must enforce role-based access control.

Proposed roles include:

| Role | Intended permissions |
|---|---|
| Visitor | Access public Scripture pages. |
| Member | View authorised church content and use permitted personal features. |
| Service operator | Perform specifically authorised service-reading operations. |
| Elder | Access assigned church leadership functions. |
| Study leader | Create and manage authorised weekly studies. |
| Pastor | Perform authorised pastoral and church content functions. |
| Church administrator | Manage church membership, settings and assigned administrative functions. |
| Platform administrator | Manage platform-wide functions under controlled administrative access. |

The final role definitions and permissions must be verified before production release.

### Core permission rules

- Ordinary members have read-only access unless explicitly granted additional permissions.
- Users must not publish or modify church content without appropriate authorisation.
- Only authorised roles may create or update service readings.
- Deletion permissions must be restricted.
- Church administrators must not automatically receive platform-wide administrative privileges.
- A role in one church must not grant the same role in another church.

Permissions must be enforced by the backend, not merely by hiding buttons in the interface.

---

## 8. Security and Privacy Architecture

**Status: Security improvements implemented; broader review ongoing**

Security is a core product requirement.

The application uses Supabase Authentication and PostgreSQL Row Level Security (RLS).

### 8.1 Public Scripture access

The public Scripture experience must remain accessible without an account.

The following reference tables have been reviewed:

- `bible_passages`
- `rotation_settings`
- `kjv_verses`

Broad write privileges previously granted to `anon` and `authenticated` were revoked.

SELECT access was granted for public reference use, subject to existing RLS policies.

Public visitors must not be able to modify Scripture passages or rotation settings.

### 8.2 Private service readings

The `preacher_readings` table contains church-specific information.

The previous public SELECT policy was removed.

An authenticated-only SELECT policy was created so a user can read a service reading only when an active membership exists for the associated church.

The policy checks:

- The user's authenticated ID.
- The church associated with the reading.
- The user's membership in that church.
- The membership's active status.

### 8.3 Service-reading write permissions

Existing policies permit INSERT and UPDATE for active members with authorised roles:

- `church_admin`
- `pastor`
- `elder`
- `service_operator`

DELETE is restricted to active:

- `church_admin`
- `pastor`

These permissions require further end-to-end testing using separate accounts.

### 8.4 Front-end session check

The service-reading page checks for a Supabase Auth session before querying private service-reading information.

If no session exists, the page displays a sign-in requirement.

This improves the user experience but is not the security boundary. RLS must remain the authoritative enforcement mechanism.

### 8.5 Security testing completed

The following tests have been performed:

| Test | Result |
|---|---|
| Open public Today's Word page in Incognito without signing in | Passed |
| Confirm public Scripture and reference load | Passed |
| Open service-reading page in Incognito | Passed — sign-in required |
| Open service-reading page while signed in as administrator | Passed |
| Confirm authenticated service reading still displays after session-check change | Passed |
| Review private service-reading RLS policy | Passed at policy inspection level |

These results do not replace a complete security audit.

### 8.6 Outstanding security work

The following items remain open:

1. Create a separate ordinary-member test account.
2. Verify an ordinary member can read but cannot publish or modify readings.
3. Verify users cannot access another church's readings.
4. Verify inactive members lose access.
5. Review all church and membership RLS policies.
6. Revoke unnecessary anonymous table grants where appropriate.
7. Review the `get_server_time` database function and its search path.
8. Enable Supabase leaked-password protection.
9. Review authentication, password reset and session-management workflows.
10. Verify shared church display device sign-in and session handling.
11. Replace the hard-coded church identifier with a secure church context.
12. Review all database functions, triggers and policies before production release.

### 8.7 Sensitive credentials

Never publish:

- Supabase service-role keys.
- Passwords.
- Private access tokens.
- Database credentials.
- Other administrative secrets.

The publishable/anon key may be used in client-side applications only with properly configured RLS and appropriate permissions.

---

## 9. Weekly Scripture Study and Discussion

**Status: Planned**

A church-based Weekly Scripture Study and Discussion area has been agreed as part of the product vision.

The feature is intended to support Scripture engagement throughout the week.

### 9.1 Study creation

Authorised church administrators, pastors or study leaders will be able to:

- Select Scripture from the KJV database.
- Create a study title.
- Add a theme.
- Provide an introduction.
- Include a reflection.
- Create discussion questions.
- Set a start date.
- Set an end date.
- Publish the study to church members.

### 9.2 Member experience

Church members will be able to:

- Read the weekly study.
- Review the selected Scripture.
- Keep private personal notes.
- Submit questions.
- Submit responses.
- Participate in moderated asynchronous discussions.
- Review completed studies where permitted.

### 9.3 Privacy and moderation

- Personal notes must remain private to their owner.
- Church study content must be restricted to authorised members.
- Discussion areas must have moderation controls.
- Study leaders and moderators must have clearly defined permissions.
- Users should have a way to report inappropriate content.
- Notifications should respect user preferences.

### 9.4 Content principles

Study reflections and discussion materials should be church-neutral and non-denominational.

The platform should avoid imposing denomination-specific doctrine or interpretation as the default position.

### 9.5 Future possibilities

Potential future additions include:

- Live group discussions.
- Study archives.
- Study progress tracking.
- Optional reminders.
- Additional study resources.

These additions require further planning and validation.

---

## 10. Accessibility and User Experience

**Status: Core requirement; implementation planned**

Accessibility is a central product requirement.

The application should be usable by people with different visual, physical and technological needs.

### Required accessibility features

1. Adjustable text size.
2. High-contrast display options.
3. Screen-reader compatibility.
4. Keyboard navigation.
5. Clear labels and controls.
6. Readable typography.
7. Appropriate colour contrast.
8. Responsive layouts.
9. Optional text-to-speech or audio Scripture playback.

The accessibility target is WCAG 2.2 AA, subject to testing.

### Audio Scripture

**Status: Planned**

Audio Scripture playback should eventually include:

- Play.
- Pause.
- Resume.
- Stop.
- Optional automatic narration.
- User-controlled audio preferences.

Automatic narration should be OFF by default.

The possibility of using a sampled version of the project owner's own voice has been discussed. Any voice-cloning or voice-generation implementation must have appropriate consent, rights and safeguards.

### Display design approach

Visual refinements should follow testing on varied screen sizes.

Adjustable font size and accessibility preferences should be placed in Settings rather than cluttering the main sanctuary display.

---

## 11. Subscription and Commercial Model

**Status: Proposed model; pricing and entitlements require validation**

The intended market includes churches and individual users.

The commercial model should support both individual subscriptions and church-sponsored access.

### 11.1 Proposed plans

| Plan | Intended audience | General direction |
|---|---|---|
| Essential | Individuals and churches starting out | Core Scripture experience. |
| Standard | Individuals and smaller churches | Additional premium features. |
| Enterprise | Churches and larger organisations | Advanced church administration and sponsored member access. |

Previously discussed illustrative prices were:

- Essential: Free.
- Standard: US$9.99 per month.
- Enterprise: US$29.99 per month.

**These prices are not approved or final.** They require market research, cost analysis and customer validation.

### 11.2 Locked premium features

Some advanced features should be visible in Settings or in their relevant sections, even when they are not included in a user's current plan.

They may appear as locked or greyed-out options with clear upgrade information.

The main sanctuary display and congregation-facing screens should remain uncluttered.

Most importantly, subscription entitlements must be enforced securely by the backend. Hiding an interface control is not sufficient security.

### 11.3 Church-sponsored premium membership

**Status: Agreed product direction; implementation planned**

A church may purchase a fixed number of sponsored member accounts.

Sponsored members receive full premium access, including eligible personal premium features, without paying individually while they qualify for sponsorship.

Church administrators will manage:

- Invitations.
- Membership verification.
- Sponsored seat allocation.
- Available seat counts.
- Additional seat purchases.
- Plan upgrades.

If a sponsored member leaves the church:

- The individual account should remain intact.
- Personal Scripture history should be retained according to the privacy and retention policy.
- Premium access sponsored by that church should end.
- The account should revert to the free plan unless the user has an independent paid subscription or another valid entitlement.

The system must distinguish between:

- Individual-paid subscriptions.
- Church-sponsored subscriptions.
- Church-level feature entitlements.
- User-level feature entitlements.

### 11.4 Commercial validation

Before finalising prices or launching paid plans, validate the model with potential customers.

A pilot involving approximately 5–10 Jamaican churches is a proposed starting point.

---

## 12. Technology and Architecture

**Status: Prototype architecture implemented**

### 12.1 Current technology stack

| Component | Technology |
|---|---|
| Front end | HTML, CSS and JavaScript |
| Hosting | GitHub Pages |
| Source control | GitHub |
| Backend | Supabase |
| Database | PostgreSQL through Supabase |
| Authentication | Supabase Auth |
| Database security | Row Level Security |
| Bible translation | King James Version |

### 12.2 Project links

- GitHub repository: https://github.com/creggyd/revolving-bible
- Public application: https://creggyd.github.io/revolving-bible/
- Church display: https://creggyd.github.io/revolving-bible/church-display.html
- Preacher control: https://creggyd.github.io/revolving-bible/preacher-control.html
- Service reading: https://creggyd.github.io/revolving-bible/service-reading.html
- Supabase project URL: https://tthgeaiokpltmfxxmibb.supabase.co

### 12.3 Current application pages

| File | Purpose |
|---|---|
| `index.html` | Today's Word / QR Scripture page |
| `church-display.html` | Automatic revolving Scripture display |
| `preacher-control.html` | Preacher-controlled functionality |
| `service-reading.html` | Church service reading display |

### 12.4 Important database tables

| Table | Purpose |
|---|---|
| `bible_passages` | Curated passages used by the revolving display |
| `rotation_settings` | Rotation timing and settings |
| `kjv_verses` | KJV Bible verse database |
| `preacher_readings` | Church-specific service readings |
| `church_memberships` | User membership and role relationships |
| `churches` | Church records |

The exact schema and relationships should be maintained in the technical documentation as the database evolves.

### 12.5 Future mobile application

**Status: Proposed direction**

The longer-term goal is to distribute Revolving Bible through Google Play Store and potentially other mobile application channels.

A future migration to a framework such as Ionic with React and Capacitor has been considered.

This is not yet a final technology decision.

The current web application should first achieve stable functionality, security and responsive behaviour.

---

## 13. Testing Strategy

**Status: Ongoing**

Testing must cover more than whether a page opens.

### 13.1 Public Scripture testing

- Open the public page without signing in.
- Confirm Scripture loads.
- Confirm the reference displays correctly.
- Confirm the QR experience works on mobile.
- Confirm the passage changes according to the rotation settings.
- Test on different browsers and devices.

### 13.2 Church account testing

- Create separate test accounts.
- Verify sign-in and sign-out.
- Verify membership approval.
- Verify active and inactive membership states.
- Verify different roles.
- Verify membership in more than one church.

### 13.3 Permission testing

- Ordinary member can view authorised readings.
- Ordinary member cannot create or modify readings.
- Authorised operator can perform permitted operations.
- Unauthorised user cannot access private readings.
- User from one church cannot access another church's private information.
- Inactive membership does not grant access.

### 13.4 Display testing

Test on:

- Desktop browsers.
- Mobile browsers.
- Tablets.
- Projectors.
- Large television screens.

Check text readability, passage changes, timing and display layout.

### 13.5 Production readiness

Before release, complete:

- Security review.
- Database policy review.
- Authentication testing.
- Cross-church isolation testing.
- Accessibility testing.
- Responsive testing.
- Backup and recovery planning.
- Error handling.
- Performance testing.
- User acceptance testing.

---

## 14. Development Roadmap

The following roadmap is a working sequence, not a promise of release dates.

### Phase 1 — Stabilise the existing experience

- Verify revolving Scripture display.
- Verify QR Scripture page.
- Verify rotation synchronisation.
- Verify preacher control.
- Verify service-reading access.
- Test on different screen sizes.

### Phase 2 — Complete account and membership security

- Build registration page.
- Implement church access requests or invitations.
- Implement administrator approval.
- Create ordinary-member test account.
- Test read-only member permissions.
- Test multiple church memberships.
- Verify RLS isolation.

### Phase 3 — Complete church administration

- Church management.
- Member management.
- Role assignment.
- Secure church context.
- Service operator workflows.

### Phase 4 — Weekly Scripture Study and Discussion

- Study creation.
- Publication scheduling.
- Member reading experience.
- Private notes.
- Questions and responses.
- Moderation.

### Phase 5 — Accessibility and personal experience

- Adjustable text size.
- High contrast.
- Screen-reader support.
- Keyboard accessibility.
- Audio Scripture.
- Personal settings.

### Phase 6 — Subscriptions and sponsored accounts

- Define plan entitlements.
- Implement subscription management.
- Implement sponsored seats.
- Implement church-sponsored member access.
- Implement secure entitlement checks.

### Phase 7 — Pilot and market validation

- Recruit pilot churches.
- Collect feedback.
- Evaluate usability.
- Review pricing.
- Prioritise improvements.

### Phase 8 — Mobile application preparation

- Evaluate mobile framework.
- Prepare application architecture.
- Test mobile functionality.
- Prepare Google Play Store release requirements.

---

## 15. Competitive Positioning

**Status: Research and validation required**

Products discussed during early market consideration include:

- Scrivent.
- LlamaPresenter.
- Church Presenter.
- EasyVerse.
- EasyWorship.
- ProPresenter.

The product should not claim that individual features are unique without proper market research.

Potential areas of differentiation include:

1. A connected church and congregation Scripture experience.
2. Automatic revolving Scripture display.
3. Preacher-controlled service readings.
4. QR access to current Scripture.
5. Church-based weekly Scripture study and discussion.
6. Accessibility-focused Scripture engagement.
7. Church-sponsored premium membership for individuals.
8. A scalable, expandable KJV Scripture library.

The actual competitive advantage must be validated through product demonstrations, customer interviews and pilot testing.

---

## 16. Product Decisions Register

The following decisions and directions have been agreed during project development.

| Area | Decision |
|---|---|
| Bible translation | King James Version (KJV). |
| Initial revolving library | 365 curated passages, expandable. |
| Passage limit | No fixed 30-passage limit. |
| QR experience | Option B — retrieve current Scripture when the page opens. |
| Public Scripture access | No sign-in required. |
| Private service readings | Sign-in and active church membership required. |
| Ordinary member permissions | Read-only unless separately authorised. |
| Account identity | One account per email address. |
| Multiple churches | One user may belong to multiple churches with different roles. |
| Registration | Church approval required before church membership is granted. |
| Study content | Church-neutral and non-denominational. |
| Accessibility | Core product requirement. |
| Audio narration | Optional and user-controlled; automatic narration off by default. |
| Subscription market | Both churches and individuals. |
| Sponsored membership | Church-sponsored premium member accounts. |
| Premium access | Backend-enforced entitlements. |
| Display design | Responsive testing before visual refinement. |
| Documentation | Maintain one central master product reference. |

---

## 17. Outstanding Questions and Risks

The following matters require further work or decisions.

### Accounts and administration

- What exact registration and verification process should be used?
- Should church membership begin through invitation, a user request, or both?
- What administrative recovery process should be available if a church administrator leaves?
- What should happen when a church membership is suspended?

### Church display

- What is the preferred sign-in method for a shared church display device?
- How should a church select its display context securely?
- Should the display have a dedicated device session?

### Security

- Complete the ordinary-member permission tests.
- Complete cross-church access tests.
- Review all database policies and functions.
- Complete the security review of the authentication workflow.
- Establish a backup and recovery process.

### Subscriptions

- Confirm final plan features.
- Validate pricing.
- Select payment provider.
- Define sponsored seat billing and cancellation rules.
- Define how subscription expiry affects access and stored user content.

### Accessibility

- Select audio provider or implementation approach.
- Define audio rights and voice-consent requirements.
- Complete accessibility testing.

### Mobile application

- Confirm future mobile framework.
- Define offline functionality, if required.
- Prepare app-store privacy and release requirements.

---

## 18. Product Presentation Guide

When presenting Revolving Bible to a church, partner or potential customer, use the following sequence.

### Introduction

Revolving Bible is a digital Scripture platform designed to make Bible passages continuously accessible to churches and individuals.

### Demonstration

Show:

1. The automatic revolving Scripture display.
2. The QR code and Today's Word experience.
3. The preacher-control concept.
4. The church service-reading experience.
5. The planned weekly Scripture study and discussion area.

Clearly identify which features are already implemented and which are planned.

### Security explanation

Explain that public Scripture access is separate from private church information.

Church service readings require authentication and appropriate church membership.

The platform is being developed with role-based permissions and database-level security.

### Future direction

Explain the intended development of:

- Church administration.
- Personal accounts.
- Weekly Scripture study.
- Accessibility and audio Scripture.
- Church-sponsored premium access.
- Mobile application availability.

### Commercial discussion

Present subscription plans and pricing as proposals until validated and approved.

---

## 19. Change Log

| Edition | Date | Changes |
|---|---|---|
| 1.0 | 20 November 2026 | Initial consolidated product, technical, security, presentation and roadmap guide. |

### Document maintenance

This document is the central project reference.

Whenever a feature is agreed, implemented, tested, changed or retired:

1. Update the relevant section.
2. Update the feature status.
3. Record important technical or security decisions.
4. Add a dated entry to the change log.
5. Keep the Word presentation guide aligned with this document when it is revised.

## Professional Developer Handover and Technical Documentation

### 1. Purpose

The Revolving Bible application must remain maintainable, transferable and expandable. Development must be documented so that a professional software developer or development company can assume responsibility without having to reverse-engineer the existing application.

### 2. Source Code Preservation

Every implemented feature must have its complete source code preserved, including:

- HTML, CSS and JavaScript.
- SQL database scripts and migrations.
- Database functions, triggers and policies.
- Application configuration and integration requirements.
- Relevant dependencies and external libraries.

The exact GitHub filename and folder location must be documented for each component.

### 3. Technical Documentation

The project will maintain three dedicated technical documents:

**A. Software Technical Specification**
- Application architecture and components.
- Database structure and relationships.
- Authentication and authorisation.
- Security policies and Row Level Security.
- External services and integrations.
- Feature descriptions and dependencies.

**B. Developer Installation and Setup Manual**
- Development environment requirements.
- Repository setup and application configuration.
- Supabase project configuration.
- Database migration instructions.
- Testing and deployment procedures.
- Backup and recovery instructions.

**C. Code and Database Change Register**
- Date of each significant change.
- Feature or component affected.
- Description and reason for the change.
- Database migrations applied.
- GitHub commit references.
- Testing results and outstanding issues.

### 4. Security and Access Protection

- Never publish passwords, private API keys, service-role keys or other secrets in public source code.
- Document required environment variables without recording their secret values.
- Document user roles, permissions and database security policies.
- Maintain appropriate backup and recovery procedures.
- Record ownership and administrative access arrangements.

### 5. Development and Handover Standard

Every new feature must include:
1. Complete source code.
2. Database changes and migration scripts, where applicable.
3. Exact file locations.
4. Technical explanation and dependencies.
5. Implementation and testing status.
6. Relevant updates to the master documentation.

### 6. Project Continuity Principle

The Revolving Bible application must not depend exclusively on one developer, one AI assistant or one individual's knowledge.

The project owner must retain access to the source code, documentation, database configuration and necessary administrative accounts.

**Guiding principle:** The Revolving Bible must remain maintainable, transferable and expandable, even when development responsibility changes hands.

**End of Master Guide**
