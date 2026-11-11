# Revolving Bible — Project Decisions Register

**Document ID:** RB-PD-001  
**Version:** 1.0  
**Project Owner / Founder:** Craig Francis  
**Document Owner:** Revolving Bible Project  
**Status:** Active Development  
**Last Updated:** November 2026

---

## 1. Purpose

This document records important business, technical, architectural, and product decisions made during the development of the Revolving Bible.

Its purpose is to:

- Preserve the reasoning behind major decisions.
- Maintain consistency throughout development.
- Help future developers understand the project.
- Prevent unnecessary changes to previously agreed requirements.
- Support future maintenance and commercial expansion.

A decision recorded here should not be changed without documenting the reason for the change.

## 2. Product Vision

**Decision PD-001: Develop Revolving Bible as a commercial Scripture application.**

The project will progress beyond its original church Scripture display prototype into a commercial application serving both individual Christians and churches.

The product will support Android phones, Android tablets, iPhones, and iPads.

The long-term objective is to create a reliable Scripture platform that combines personal Bible engagement with coordinated church Scripture displays.

## 3. Target Market

**Decision PD-002: Serve both individual users and churches.**

The initial target market will include:

1. Individual Christians seeking daily Scripture engagement.
2. Churches seeking coordinated Scripture displays and service-reading management.

The application must accommodate both markets without requiring separate, unrelated products.

## 4. Technology Direction

**Decision PD-003: Use a shared application development approach.**

The proposed commercial technology stack is:

| Component | Selected direction |
|---|---|
| Application interface | Ionic |
| Application framework | React |
| Mobile packaging | Capacitor |
| Backend | Supabase |
| Database | PostgreSQL |
| Source-code management | GitHub |
| Initial web hosting | GitHub Pages |

This direction is intended to reduce duplicated development work across Android and iOS.

These technologies represent the approved development direction, not a claim that the commercial mobile application has already been implemented.

Changes to the technology stack should be supported by technical evaluation and documented justification.

## 5. Scripture Translation

**Decision PD-004: Use the King James Version as the initial translation.**

The initial Scripture library will use the traditional King James Version (KJV).

The project should aim for consistent, accurate wording and references, preferably aligned with the 1769 Oxford edition where the source material can be verified.

The project must not claim that all text represents an exact historical 1611 printing unless that has been independently established.

Additional translations may be considered in future versions.

Before commercial distribution of any translation, its copyright and licensing requirements must be reviewed.

## 6. Scripture Rotation

**Decision PD-005: Establish a 60-second default rotation interval.**

The prototype uses a 60-second interval between Scripture passages.

The commercial application should allow authorized administrators to configure the rotation interval.

The rotation system should use a shared server-time reference so that multiple connected displays remain synchronized.

The rotation system must not depend solely on each device's local clock.

## 7. Church Scripture Display

**Decision PD-006: Provide a separate preacher-controlled reading display.**

The preacher-selected Scripture reading must operate independently from the automatic revolving Scripture display.

Changing the preacher's reading must not unintentionally reset or interfere with the revolving Scripture sequence.

Authorized church personnel must be able to select and update the designated reading.

## 8. QR Scripture Sharing

**Decision PD-007: Use a permanent QR access point for the revolving Scripture.**

The QR code should open a mobile-friendly page that retrieves the Scripture passage currently being displayed.

The mobile page should display only the relevant Scripture content and reference, without unnecessary administrative controls or unrelated information.

The QR experience should retrieve the shared current passage rather than run an independent rotation that may display a different passage.

## 9. Synchronization

**Decision PD-008: Synchronize displays using backend server time.**

Multiple devices should calculate the current passage from a common rotation start time and server-time reference.

This is intended to reduce differences caused by inaccurate device clocks.

The commercial version should include suitable time-resynchronization and error-handling mechanisms.

## 10. Scripture Library

**Decision PD-009: Expand the Scripture library beyond the initial 30 passages.**

The initial prototype contains 30 active passages.

The commercial product should aim for at least 365 passages in its first substantial Scripture library expansion, with future growth to 1,000 or more passages.

The library should be centrally managed through the backend rather than permanently hardcoded into the application.

Passages should be organized into useful categories, including:

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

Scripture references and wording must be verified before publication.

## 11. Reflections and Commentary

**Decision PD-010: Keep reflections church-neutral and non-denominational.**

Optional reflections must be broadly accessible to Christians across different church traditions.

They must not promote one denomination's distinctive doctrines as universal Christian teaching.

Each reflection must:

- Remain grounded in the associated Scripture.
- Encourage practical Christian living.
- Distinguish biblical text from commentary.
- Avoid presenting disputed theological interpretations as settled universal facts.
- Undergo editorial review before publication.

## 12. Multi-Church Architecture

**Decision PD-011: Design the commercial backend for multiple churches.**

The commercial platform must support multiple independent church organizations.

Each church must have its own settings, authorized membership, administration permissions, and relevant Scripture display configurations.

Database security policies must prevent unauthorized access between churches.

This requirement must be considered during database design rather than added as an afterthought.

## 13. User Accounts and Administration

**Decision PD-012: Introduce role-based access control.**

The commercial application will distinguish between individual users, church members, preachers or service leaders, church administrators, and platform administrators.

Permissions must be assigned according to responsibilities.

Regular members must not automatically receive administrative privileges.

Sensitive administrative operations must require authentication and authorization.

## 14. Security

**Decision PD-013: Apply security controls before commercial release.**

The current prototype is not considered a completed commercial security implementation.

The commercial application must include:

- Secure authentication.
- Row Level Security.
- Church data separation.
- Controlled administrative permissions.
- Secure credential management.
- Appropriate backup and recovery.
- Privacy and account-management procedures.
- Security testing before release.

Supabase secret and service-role keys must never be exposed in frontend code.

## 15. Project Documentation

**Decision PD-014: Maintain complete technical documentation and source history.**

The project must remain understandable and maintainable by another developer if the original developer becomes unavailable.

GitHub will serve as the primary source-code and documentation repository.

Important changes, database migrations, security policies, and technical decisions must be recorded.

Documentation must be updated as the application evolves.

## 16. Commercial Model

**Decision PD-015: Evaluate a free and paid subscription structure.**

The proposed commercial model will consider:

- A free individual plan.
- A premium individual plan.
- A limited free church plan.
- A premium church plan.

Final prices, subscription limits, payment providers, and feature restrictions remain subject to market research and cost evaluation.

No subscription or payment system should be represented as implemented until it has been developed and tested.

## 17. Development Strategy

**Decision PD-016: Complete and stabilize the web prototype before major commercial expansion.**

Development should proceed in stages:

1. Complete the existing web prototype.
2. Establish the commercial database and authentication foundation.
3. Develop the cross-platform mobile application.
4. Implement church administration and premium features.
5. Conduct testing and prepare for commercial publication.

This staged approach is intended to reduce unnecessary rework and identify technical problems early.

## 18. Decision Change Control

Any major change to a recorded decision must include:

- Decision reference number.
- Original decision.
- Proposed replacement.
- Reason for the change.
- Expected technical or business impact.
- Date of approval.

Previous decisions should remain in the historical record rather than being silently deleted.

## 19. Future Decision Register

The following matters require further evaluation and formal decisions:

| Area | Outstanding decision |
|---|---|
| Bible licensing | Confirm commercial distribution rights for Scripture text |
| Product branding | Confirm final product name and trademark availability |
| Mobile development | Confirm detailed development environment |
| Subscriptions | Finalize pricing and feature limits |
| Payments | Select suitable payment provider |
| Offline operation | Determine offline content and synchronization rules |
| Analytics | Establish privacy-conscious usage measurement |
| App publication | Finalize Google Play and Apple App Store requirements |
| Data retention | Establish final retention and deletion policies |

## 20. Document Maintenance

This register must be updated whenever an important business, technical, or product decision is approved.

Every new decision should receive a unique reference number.

---

**End of Document**

**Revolving Bible Project — Project Decisions Register**
