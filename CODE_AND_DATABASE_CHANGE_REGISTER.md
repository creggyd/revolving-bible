
# REVOLVING BIBLE
## CODE AND DATABASE CHANGE REGISTER

**Document Version:** 1.0  
**Document Status:** Initial Change Register  
**Date:** 22 November 2026

---

# 1. PURPOSE

This register records significant application code changes, database modifications, security changes, integrations and deployments.

It provides a traceable development history for the project owner and future developers.

A change must not be recorded as completed unless there is evidence that it was implemented.

# 2. CHANGE RECORDING STANDARD

Each significant change should record:

- Change ID.
- Date.
- Feature or component.
- Description.
- Reason for the change.
- Files affected.
- Database migration, if applicable.
- GitHub commit reference.
- Testing performed.
- Implementation status.
- Outstanding work.

Never invent commit references or claim that testing was completed when it has not been performed.

# 3. INITIAL PROJECT BASELINE

## CHG-001 — Revolving Scripture Display

**Component:** Scripture display  
**Status:** Implemented; further testing and refinement ongoing.

**Description:**
Created an automatic Bible passage display using the KJV Scripture collection.

**Known database components:**
- `bible_passages`
- `rotation_settings`

**Known functionality:**
- Curated Scripture passage retrieval.
- Automatic passage rotation.
- Configurable rotation interval.
- Countdown display.

**Testing record:**
A 60-second rotation and countdown were tested. Devices displayed the same passage, although countdown clocks showed minor timing differences.

**Outstanding work:**
Further multi-device synchronisation testing.

## CHG-002 — Today's Word QR Scripture Page

**Component:** `index.html`  
**Status:** Implemented; public access tested.

**Description:**
Created a public Scripture page accessible through a QR destination.

**Known functionality:**
- Retrieves the current Scripture when the page opens.
- Displays the passage and reference.
- Does not require sign-in.

**Testing record:**
Public access was tested in an Incognito browser.

## CHG-003 — Church Display

**Component:** `church-display.html`  
**Status:** Implemented; further testing ongoing.

**Description:**
Created a church-oriented revolving Scripture display.

**Outstanding work:**
Continue testing across screen sizes and devices.

## CHG-004 — Preacher Control

**Component:** `preacher-control.html`  
**Database:** `preacher_readings`  
**Status:** Implemented; security and workflow testing ongoing.

**Description:**
Created a control interface for authorised church personnel to manage Scripture readings.

## CHG-005 — Service Reading Display

**Component:** `service-reading.html`  
**Database:** `preacher_readings`  
**Status:** Implemented; access tests performed.

**Description:**
Created a church service reading display.

**Security work:**
- Added a Supabase authentication session check.
- Removed public SELECT policy access to preacher readings.
- Added authenticated membership-based access policies.

**Testing record:**
- Unauthenticated Incognito access was tested.
- Signed-in administrator access was tested.

**Outstanding work:**
Replace the hard-coded church identifier with secure dynamic church context.

## CHG-006 — Database Security Foundation

**Component:** Supabase PostgreSQL  
**Status:** Initial security changes implemented; comprehensive verification outstanding.

**Description:**
Introduced or strengthened database access restrictions for Scripture data, preacher readings and church membership operations.

**Security controls include:**
- Row Level Security.
- Authenticated membership checks.
- Role-based permissions.
- Restricted database write access.

**Outstanding work:**
Complete security policy testing and review outstanding database security advisories.

## CHG-007 — Digital Service Programme Database Foundation

**Migration name:** `create_digital_service_programmes`  
**Status:** Migration successfully applied.

**Tables created:**
- `church_programmes`
- `church_programme_items`

**Description:**
Created the initial database foundation for church digital service programmes.

**Known functionality supported by the schema:**
- Draft, published and archived programme states.
- Church-specific programmes.
- Ordered programme items.
- Programme dates and times.
- Participant and activity details.
- One published programme per church.

**Testing record:**
Migration success and table creation were confirmed.

**Outstanding work:**
- Review and refine insert policies.
- Complete policy-level security testing.
- Build the programme management interface.
- Build the public programme page.
- Implement and test the permanent church QR destination.

# 4. DOCUMENTATION CHANGE HISTORY

## DOC-001 — Master Product Guide

**File:** `docs/REVOLVING_BIBLE_MASTER_GUIDE.md`

**Status:** Committed.

**Description:**
Established the central product reference covering the product vision, features, architecture, permissions, roadmap, decisions and implementation status.

## DOC-002 — Professional Developer Handover Standard

**File:** `docs/REVOLVING_BIBLE_MASTER_GUIDE.md`

**Status:** Committed, according to project owner confirmation.

**Description:**
Added requirements for complete source-code preservation, technical documentation, setup instructions, security documentation, testing, backups and developer handover.

## DOC-003 — Software Technical Specification

**File:** `docs/SOFTWARE_TECHNICAL_SPECIFICATION.md`

**Status:** Committed, according to project owner confirmation.

**Description:**
Established the initial technical architecture and implementation reference.

## DOC-004 — Developer Installation and Setup Manual

**File:** `docs/DEVELOPER_INSTALLATION_AND_SETUP_MANUAL.md`

**Status:** Committed, according to project owner confirmation.

**Description:**
Established the initial developer setup, configuration, testing, deployment and handover instructions.

# 5. FUTURE CHANGE REGISTER TEMPLATE

Use this template for each significant new change.

## CHG-XXX — [Change Title]

**Date:**  
**Component:**  
**Status:** Planned / In Progress / Implemented / Tested / Production Ready

**Description:**

**Reason for change:**

**Files affected:**

**Database changes:**

**Migration reference:**

**GitHub commit reference:**

**Testing performed:**

**Test results:**

**Outstanding work:**

# 6. CHANGE CONTROL REQUIREMENTS

1. Record significant changes as development progresses.
2. Preserve complete SQL migration scripts in GitHub.
3. Record the exact files affected.
4. Reference actual GitHub commits where available.
5. Record testing separately from implementation.
6. Update the Software Technical Specification when architecture changes.
7. Update the Master Product Guide when product decisions or functionality change.
8. Keep all technical documents consistent.

---

**END OF CODE AND DATABASE CHANGE REGISTER**
