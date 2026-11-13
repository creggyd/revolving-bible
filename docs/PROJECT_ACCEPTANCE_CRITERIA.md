# Project Testing Strategy and Acceptance Criteria

## 1. Purpose

This document establishes the testing standards and acceptance criteria for the Revolving Bible platform.

Its purpose is to ensure that features are functional, reliable, secure, and suitable for their intended users before being released.

Testing must take place throughout development rather than only at the end of the project.

## 2. Testing Objectives

The testing process should confirm that:

- Scripture passages display accurately.
- Automatic Scripture rotation works correctly.
- Multiple displays remain synchronized.
- Preacher-controlled readings operate independently of automatic rotation.
- QR codes display the correct Scripture.
- User accounts and permissions function correctly.
- Church information remains separated between organizations.
- The platform works across supported devices.
- Data is protected against unauthorized access.
- New releases do not break existing features.

## 3. Testing Environments

The project should maintain separate environments as it develops.

### Development Environment

Used for:

- Writing and modifying code.
- Testing new functionality.
- Experimenting with database changes.
- Identifying and correcting defects.

### Testing Environment

Used for:

- Verifying completed features.
- Performing integration testing.
- Testing database permissions.
- Testing multiple devices.
- Checking release candidates.

### Production Environment

Used by actual users.

Production changes must be controlled and tested before deployment.

The current GitHub Pages and Supabase prototype should not automatically be treated as a fully separated development, testing, and production infrastructure.

## 4. Testing Categories

### 4.1 Functional Testing

Confirm that each feature performs its intended function.

Examples:

- Scripture passages load successfully.
- The next passage appears at the configured interval.
- The preacher can select a reading.
- The QR page displays the current Scripture.
- Administrators can manage authorized content.

### 4.2 Synchronization Testing

Test the platform on multiple devices simultaneously.

Confirm that:

- Devices display the same current passage.
- Passage transitions occur at the same scheduled time.
- Countdown indicators remain reasonably synchronized.
- Reconnecting devices recover the correct current passage.

### 4.3 Compatibility Testing

Test supported devices and browsers.

Initial testing should include:

- Windows desktop and laptop browsers.
- Android smartphones.
- Android tablets.
- iPhones.
- iPads.
- Common modern browsers.

Screen orientation, resolution, and text readability should also be checked.

### 4.4 Security Testing

Verify that:

- Unauthorized users cannot access administrative functions.
- Users cannot modify restricted Scripture content.
- Church administrators cannot access another church's private information.
- Database Row Level Security policies are enforced.
- Secret credentials are not exposed in public application code.
- Authentication and password recovery operate correctly.

Security testing must become more comprehensive before commercial launch.

### 4.5 Performance Testing

Evaluate:

- Initial page loading time.
- Scripture retrieval speed.
- Database response time.
- Performance with multiple connected displays.
- Performance with a larger Scripture library.
- Application behaviour during periods of increased usage.

### 4.6 Recovery Testing

Verify that:

- Source code can be recovered from GitHub.
- Database backups can be restored.
- Application configuration can be reconstructed.
- Administrators can recover access through approved procedures.

## 5. Core Feature Acceptance Criteria

A feature should not be considered complete merely because it appears on the screen.

It must satisfy its defined acceptance criteria.

| Feature | Acceptance criteria |
|---|---|
| Scripture library | Approved passages load with correct references and wording. |
| Automatic rotation | Passages change according to the configured interval. |
| Server synchronization | Multiple devices follow the same rotation schedule. |
| Countdown | Remaining time updates correctly and corresponds to the rotation schedule. |
| Preacher reading | Authorized users can select a reading without disrupting automatic rotation. |
| QR sharing | Scanning the QR code opens the intended Scripture page. |
| Responsive display | Scripture remains readable on supported screen sizes. |
| Administration | Only authorized users can access management functions. |
| Church separation | Private church data is not accessible to another church. |
| User accounts | Registration, login, logout, and account recovery work as designed. |

Features that have not yet been implemented must remain marked as pending.

## 6. Scripture Content Verification

Scripture content requires special attention.

Testing should confirm:

- Correct book name.
- Correct chapter.
- Correct starting verse.
- Correct ending verse, where applicable.
- Accurate passage wording.
- Correct translation identification.
- Proper handling of long passages.

Content errors should be corrected before publication.

## 7. Test Case Recording

Each significant test should have a record containing:

- Test identification number.
- Feature being tested.
- Test date.
- Testing environment.
- Expected result.
- Actual result.
- Pass or fail status.
- Defect reference, if applicable.
- Tester or reviewer.

A failed test must be investigated and resolved or formally accepted as a known limitation before release.

## 8. Defect Classification

Defects should be classified according to severity.

**Critical:** A major failure that prevents essential platform operation or exposes protected information.

**High:** A significant feature is unusable or produces serious incorrect results.

**Medium:** A feature works partially or has a noticeable problem.

**Low:** A minor visual, wording, or usability issue.

Critical and high-severity defects should normally prevent a release until resolved.

## 9. User Acceptance Testing

Before commercial launch, representative users should test the platform.

Participants should include:

- Individual users.
- Church administrators.
- Preachers or reading coordinators.
- Display operators.

Testing should evaluate ease of use, readability, reliability, and the suitability of the available features.

Feedback should be documented and reviewed before release.

## 10. Release Acceptance Checklist

Before approving a production release:

- [ ] All essential features pass functional testing.
- [ ] Scripture content has been verified.
- [ ] Synchronization has been tested on multiple devices.
- [ ] Supported screen sizes have been checked.
- [ ] Security controls have been reviewed.
- [ ] Church data separation has been tested where applicable.
- [ ] No unresolved critical defects remain.
- [ ] High-severity defects have been resolved or formally assessed.
- [ ] Backup and recovery arrangements have been checked.
- [ ] Documentation reflects the released version.
- [ ] Release approval has been recorded.

## 11. Testing Documentation and Version Control

Test cases, defect reports, and release results should be maintained in the project repository or an approved project tracking system.

Testing records should identify the application version being tested.

Changes to acceptance criteria should be documented and reviewed.

## 12. Current Development Status

The current Revolving Bible prototype has demonstrated automatic Scripture rotation and basic server-time synchronization using Supabase.

Other capabilities, including the complete preacher administration interface, commercial user accounts, multi-church access controls, native mobile applications, and subscription services, require implementation and formal testing.

Demonstrated prototype functionality must not be confused with completed commercial acceptance testing.

## 13. Document Review

This document should be reviewed:

- Whenever major features are introduced.
- Before significant releases.
- Before commercial launch.
- Whenever testing requirements change.

**Document owner:** Revolving Bible Project

**Version:** 1.0

**Status:** Development and quality assurance planning document.
