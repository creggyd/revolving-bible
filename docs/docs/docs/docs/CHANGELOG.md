# Revolving Bible — Changelog

All significant changes to the Revolving Bible project are recorded in this document.

The format follows a chronological development history, with the newest entries listed first.

**Project Owner / Founder:** Craig Francis  
**Document Owner:** Revolving Bible Project

---

## [1.0.0] — November 2026

### Project Foundation

- Established the Revolving Bible project concept.
- Created the GitHub repository.
- Established GitHub Pages hosting.
- Connected the frontend application to Supabase.
- Created the initial Scripture display interface.
- Established the King James Version (KJV) as the initial Scripture translation.

### Scripture Database

- Created the `bible_passages` table.
- Created the `rotation_settings` table.
- Created the `preacher_readings` table.
- Added an initial collection of 30 active Scripture passages.
- Established the 60-second Scripture rotation interval.

### Scripture Display

- Implemented automatic Scripture rotation.
- Added a countdown showing the time remaining before the next passage.
- Established the preacher-controlled Scripture reading concept.
- Established the QR-code Scripture sharing requirement.

### Backend and Synchronization

- Connected the application to the Supabase backend.
- Enabled Row Level Security on the prototype tables.
- Configured public read access for intended display information.
- Restricted public database write access.
- Created the `get_server_time()` database function.
- Implemented server-time synchronization to improve consistency between connected displays.
- Tested the application on a computer and mobile phone.

### Documentation

Established the initial project documentation:

- `README.md`
- `docs/PRODUCT_SPECIFICATION.md`
- `docs/SYSTEM_ARCHITECTURE.md`
- `docs/DATABASE_DESIGN.md`
- `docs/SECURITY_GUIDELINES.md`
- `docs/INSTALLATION_AND_SETUP.md`
- `docs/BACKUP_AND_RECOVERY.md`

### Commercial Product Direction

- Established the intention to develop Android and iOS applications.
- Identified individual Christians and churches as the initial target markets.
- Established the proposed Ionic, React, Capacitor, and Supabase technology direction.
- Identified multi-church support and subscription management as future development requirements.
- Established the requirement for church-neutral, non-denominational reflections.

### Current Status

The working web prototype has been established. Commercial mobile development, user authentication, multi-church administration, subscription functionality, and formal production security testing remain planned development activities.

---

## Future Change Entry Template

Use the following format when recording future improvements.

### [Version Number] — Date

#### Added
- New features introduced.

#### Changed
- Existing functionality improved or modified.

#### Fixed
- Errors or defects corrected.

#### Security
- Security improvements or policy changes.

#### Documentation
- Documents created or updated.

---

**End of Changelog**

**Revolving Bible Project — Development History**
