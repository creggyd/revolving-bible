# Revolving Bible – Product Specification

**Document ID:** RB-PS-001  
**Version:** 1.0  
**Status:** Initial Product Specification  
**Project:** Revolving Bible  
**Target Platforms:** Android, iOS, iPadOS and Web  
**Target Markets:** Individual Christians and Churches  
**Initial Translation:** King James Version (KJV)

---

## 1. Product Overview

Revolving Bible is a cross-platform Christian Scripture application designed to keep biblical passages accessible throughout everyday life and church services.

The application will provide individual users with a personal Scripture experience while allowing churches to display, manage and synchronise Bible passages across multiple screens and mobile devices.

Its defining feature will be synchronised Scripture rotation, supported by QR-based sharing and a dedicated church presentation environment.

## 2. Product Vision

To create an accessible, reliable and engaging Scripture platform that connects individuals and church congregations through the shared experience of reading and reflecting on God's Word.

The application will be designed to serve Christians across different denominations without promoting a particular church organisation or theological tradition.

## 3. Target Users

### 3.1 Individual Users

Christians who want to:
- Access daily Bible passages.
- View automatically rotating Scripture.
- Save favourite passages.
- Share Scripture with others.
- Receive optional Scripture reminders.
- Access short biblical reflections.

### 3.2 Churches

Churches that want to:
- Display rotating Bible passages during services.
- Synchronise multiple screens.
- Display the preacher's selected Scripture.
- Share passages with members through QR codes.
- Select a Scripture of the Week.
- Manage their own Scripture collections.
- Administer authorised church users.

### 3.3 Church Administrators

Authorised persons responsible for:
- Managing church information.
- Managing Scripture selections.
- Configuring rotation intervals.
- Managing connected devices.
- Scheduling church Scripture displays.
- Managing user roles and permissions.

## 4. Core Product Features

### 4.1 Living Scripture Display

The Living Scripture Display is the principal product differentiator.

Requirements:
- Automatically rotate active Scripture passages.
- Support configurable rotation intervals.
- Use server time as the common timing reference.
- Keep connected displays synchronised.
- Support full-screen presentation.
- Provide readable layouts for televisions, tablets and computers.

### 4.2 Individual Scripture Experience

Requirements:
- Display daily Scripture.
- Allow users to access revolving Scripture.
- Allow users to save favourite passages.
- Allow Scripture sharing.
- Support optional notifications.
- Provide access to Scripture of the Week.

### 4.3 Church Connection Mode

Requirements:
- Allow authorised churches to establish their own accounts.
- Support church-specific Scripture selections.
- Provide a preacher's reading display.
- Support multiple connected screens.
- Provide a church QR-sharing facility.
- Allow authorised administrators to control church settings.

### 4.4 Congregation QR Sharing

A church display will provide a QR code that members can scan using their mobile devices.

The QR destination must retrieve the currently active Scripture from the shared backend.

The mobile page should display the Scripture clearly without requiring the member to navigate through the full application.

The QR code should remain reusable rather than needing to be regenerated every time the Scripture changes.

### 4.5 Scripture of the Week

Church administrators should be able to select a passage for the week.

The selected passage should be accessible through:
- Church display.
- Individual church members' application experience.
- QR sharing.
- The church's digital Scripture space.

## 5. Scripture Library

The current prototype contains 30 active KJV passages.

The initial commercial release should target a minimum of 365 passages, with a scalable design that can accommodate 1,000 or more.

Passages should be organised into categories, including:

- Faith and Trust.
- Love and Relationships.
- Hope and Encouragement.
- Wisdom and Understanding.
- Prayer and Spiritual Growth.
- Forgiveness and Mercy.
- Strength During Difficulties.
- Family and Christian Living.
- Peace and Overcoming Fear.
- Salvation and Eternal Life.

Each passage should include:
- Bible book.
- Chapter.
- Starting verse.
- Ending verse, where applicable.
- Complete passage text.
- Translation.
- Category.
- Active or inactive status.

The system must support authorised additions, updates and removal from active rotation.

Commercial rights for each translation and edition must be verified before distribution.

## 6. Church-Neutral Reflections

All reflections must be non-denominational and accessible to Christians from different church backgrounds.

Editorial requirements:
- Remain grounded in the relevant Bible passage.
- Avoid denominational promotion.
- Avoid presenting disputed theological interpretations as universally accepted doctrine.
- Emphasise practical Christian living.
- Encourage faith, love, patience, forgiveness, hope and spiritual growth.
- Clearly distinguish reflection text from Scripture quotations.

Reflections must undergo editorial review before publication.

## 7. User Accounts and Permissions

The application should support individual and church accounts.

Proposed roles:

**Individual User**
- Access public Scripture.
- Save personal favourites.
- Manage personal preferences.

**Church Administrator**
- Manage church settings.
- Manage Scripture selections.
- Manage connected displays.
- Manage authorised church members.

**Church Editor**
- Manage approved Scripture content.
- Update preacher readings.
- Select Scripture of the Week.

**System Administrator**
- Manage platform-level operations.
- Manage subscriptions and system configuration.
- Monitor technical health and security.

Permissions must be enforced on the backend, not merely hidden in the user interface.

## 8. Technical Architecture

Proposed technology:

| Component | Technology |
|---|---|
| User interface | Ionic + React |
| Mobile packaging | Capacitor |
| Backend | Supabase |
| Database | PostgreSQL |
| Authentication | Supabase Auth |
| Source control | GitHub |
| Web hosting | GitHub initially |
| Application platforms | Android and iOS |

The architecture must support future expansion without requiring a complete rewrite.

The current prototype must be preserved while the commercial application is developed.

## 9. Database Requirements

The commercial database is expected to include:

- profiles
- churches
- church_members
- church_settings
- bible_passages
- passage_categories
- rotation_settings
- preacher_readings
- registered_devices
- weekly_scriptures
- user_favourites
- subscriptions
- audit_logs

Final database relationships, constraints, indexes and permissions will be specified in the separate Database Design document.

The design must support multiple churches with strict separation of their private information.

## 10. Security and Privacy Requirements

The application must implement:

- Secure user authentication.
- Role-based access control.
- Database Row Level Security.
- Church-level data separation.
- Secure administrative operations.
- Protected configuration secrets.
- Appropriate backup and recovery procedures.
- Audit logging of important administrative actions.
- Appropriate privacy and data protection practices.

No Supabase service-role key or other backend secret may be included in publicly accessible frontend code.

## 11. Synchronisation Requirements

The revolving Scripture feature must use a common server-time reference.

Requirements:
- All connected devices should calculate the active passage using the same rotation schedule.
- Devices must not rely exclusively on their individual system clocks.
- Time synchronisation should be periodically refreshed.
- The application should recover gracefully after temporary network interruptions.
- A defined synchronisation tolerance must be established during testing.

## 12. Offline and Connectivity Requirements

The application should provide a sensible experience when internet connectivity is interrupted.

Future implementation requirements:
- Cache recently retrieved passages.
- Display the last successfully retrieved Scripture.
- Indicate when a display is offline.
- Reconnect automatically when possible.
- Resynchronise with the server after connectivity returns.

Church administrators must be informed when a connected display cannot receive updates.

## 13. Documentation Requirements

All significant development activities must be documented.

The project documentation will include:

- Product specification.
- System architecture.
- Database design.
- Database dictionary.
- Security guidelines.
- Installation instructions.
- Configuration instructions.
- User guide.
- Administrator guide.
- API documentation.
- Backup and recovery procedures.
- Testing procedures.
- Change history.
- Technical decision log.

Documentation must be updated when the corresponding application functionality changes.

## 14. Version 1.0 Acceptance Criteria

Version 1.0 must demonstrate that:

1. Individual users can access the Scripture experience.
2. Churches can establish and administer their own accounts.
3. At least 365 approved Scripture passages are available.
4. Scripture rotation operates reliably.
5. Connected displays remain synchronised within an agreed tolerance.
6. Preacher readings operate independently of revolving Scripture.
7. QR sharing retrieves the currently active passage.
8. Scripture of the Week is supported.
9. Users can save favourite passages.
10. Church information is protected from unauthorised access.
11. The application operates on supported Android and Apple devices.
12. Technical documentation and recovery procedures are available.

## 15. Future Development

Features for later releases may include:

- Audio Scripture.
- Audio reflections.
- Advanced Bible reading plans.
- Additional licensed translations.
- Home-screen widgets.
- Family and small-group experiences.
- Advanced church analytics.
- Additional languages.
- More extensive church presentation features.

## 16. Scope Management

This document establishes the initial Version 1.0 product requirements.

Changes to major features, architecture, security, database structure or commercial scope must be recorded in the project decision log.

Features must not be considered complete merely because they appear in the interface. They must be implemented, tested and documented.

---

**End of Product Specification**

Project Owner / Founder: Craig Francis
Document Owner: Revolving Bible Project
Document ID: RB-PS-001
Version: 1.0
