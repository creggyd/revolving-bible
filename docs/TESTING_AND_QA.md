# Revolving Bible — Testing and Quality Assurance Plan

**Document ID:** RB-QA-001  
**Version:** 1.0  
**Status:** Development Testing Plan  
**Project:** Revolving Bible  
**Document Owner:** Revolving Bible Project  

---

## 1. Purpose

This document establishes the testing and quality assurance procedures for the Revolving Bible application.

Its purpose is to ensure that the application operates correctly, securely, consistently, and reliably across supported devices.

Testing must take place throughout development and before every major release.

## 2. Testing Objectives

The main objectives are to:

1. Verify that Scripture passages display correctly.
2. Confirm that automatic rotation operates as expected.
3. Ensure multiple devices remain synchronized.
4. Verify that preacher-selected readings display correctly.
5. Confirm that QR code sharing works.
6. Test database connectivity and data accuracy.
7. Verify user authentication and access permissions.
8. Identify and correct software defects.
9. Confirm compatibility across supported devices.
10. Protect user and church information.

## 3. Current Prototype Testing

The following features are part of the existing prototype and should be tested against the actual deployed application.

### 3.1 Scripture Display

Verify that:

- Bible passages load successfully.
- Book names and chapter numbers are correct.
- Verse references are displayed accurately.
- Scripture text matches the stored database text.
- Only active passages are displayed.
- Long passages remain readable.
- The layout adjusts to different screen sizes.

### 3.2 Automatic Scripture Rotation

The current prototype uses a 60-second rotation interval.

Test the following:

- The first passage loads successfully.
- The countdown begins.
- The countdown decreases correctly.
- A new passage appears after the rotation interval.
- The next passage follows the expected database order.
- Rotation continues without requiring a page refresh.
- The display handles an empty passage list without crashing.

### 3.3 Device Synchronization

Synchronization is an important feature of the Revolving Bible product.

Test using at least two devices, such as a laptop and a mobile phone.

Verify that:

- Both devices retrieve the same active passage.
- Both devices use the Supabase server-time function.
- Passage transitions occur at approximately the same server-time boundary.
- Different local device clock settings do not cause incorrect passage selection.
- Refreshing one device does not disrupt another device.
- A slow network connection does not permanently prevent synchronization.

Record any differences in displayed countdown values or passage transition times.

### 3.4 Supabase Connectivity

Verify that:

- The application connects to the correct Supabase project.
- Active Bible passages can be retrieved.
- Rotation settings can be retrieved.
- The server-time RPC function responds.
- Database errors are handled appropriately.
- The application responds sensibly when the internet connection is unavailable.

### 3.5 Preacher Reading Display

The preacher-reading workflow must be tested once the complete frontend functionality is implemented.

Verify that:

- An authorized user can select a Scripture reading.
- The selected reading is stored correctly.
- The correct passage appears on the preacher display.
- The reading remains independent of the automatic revolving display.
- Changing the selected reading updates the intended display.
- Unauthorized users cannot modify the reading.

### 3.6 QR Code Sharing

The QR functionality must be tested once implemented and deployed.

Verify that:

- The QR code scans successfully.
- It opens the intended mobile page.
- The page retrieves the current Scripture at the time of scanning.
- Only the intended Scripture content appears on the sharing page.
- The page works on Android and iPhone browsers.
- An expired or unavailable passage is handled appropriately.

## 4. Commercial Application Testing

The following tests apply to future commercial functionality.

They must be performed when the corresponding features have been developed.

### 4.1 Individual User Accounts

Test:

- User registration.
- Login and logout.
- Password recovery.
- Profile management.
- Saved Scripture passages.
- Personal preferences.
- Account deletion procedures.

### 4.2 Church Accounts

Test:

- Church registration.
- Church administrator access.
- Adding and removing members.
- Assigning user roles.
- Managing church settings.
- Separating data belonging to different churches.
- Preventing unauthorized access between churches.

### 4.3 Mobile Application

Test the application on:

- Android phones.
- Android tablets.
- iPhones.
- iPads.

Verify:

- Installation and startup.
- Screen responsiveness.
- Portrait and landscape layouts.
- Navigation.
- Notifications where implemented.
- Internet interruption and recovery.
- Application updates.
- Data synchronization.

### 4.4 Subscription Testing

When subscription functionality is implemented, verify:

- Free account restrictions.
- Premium account access.
- Church subscription features.
- Successful payments.
- Failed payments.
- Renewal.
- Cancellation.
- Expired subscriptions.
- Appropriate access changes following subscription status updates.

Payment testing must use the payment provider's test environment before live transactions are enabled.

## 5. Security Testing

Security testing is mandatory before commercial release.

Test that:

1. Row Level Security is enabled on protected database tables.
2. Anonymous users cannot perform unauthorized write operations.
3. Authenticated users cannot access another user's private information.
4. Church members cannot access another church's protected information.
5. Administrative functions require appropriate permissions.
6. Secret keys are not exposed in frontend code.
7. Unauthorized database operations are rejected.
8. User sessions are handled securely.
9. Sensitive information is not unnecessarily included in application logs.

Security testing should include anonymous, authenticated, church-member, and administrator access scenarios where applicable.

## 6. Performance Testing

Evaluate:

- Initial application loading time.
- Scripture retrieval time.
- Passage transition performance.
- Server-time request performance.
- Behaviour under slow internet connections.
- Performance with a larger Scripture library.
- Performance when several devices are connected simultaneously.

The application should remain responsive during normal use.

## 7. Browser and Device Compatibility

The web application should be tested using current versions of:

- Google Chrome.
- Microsoft Edge.
- Safari.
- Firefox.

The commercial mobile application should also be tested on supported Android and Apple operating-system versions.

Record the device model, operating system, browser, and application version when reporting compatibility problems.

## 8. Defect and Bug Reporting

Every identified defect should be recorded.

A bug report should include:

| Field | Description |
|---|---|
| Bug ID | Unique reference number |
| Date reported | Date the issue was discovered |
| Feature | Affected application feature |
| Device | Device used during testing |
| Steps to reproduce | Instructions for reproducing the problem |
| Expected result | What should have happened |
| Actual result | What happened instead |
| Severity | Critical, High, Medium, or Low |
| Status | Open, In Progress, Resolved, or Closed |

### Defect Severity

**Critical:** A major failure that prevents the application from operating or creates a serious security risk.

**High:** A major feature is unavailable or produces incorrect results.

**Medium:** A feature works inconsistently or has a significant usability problem.

**Low:** A minor visual, wording, or layout issue.

Critical security defects must be resolved before release.

## 9. Regression Testing

Whenever existing code or database functionality is changed, previously working features must be tested again.

At minimum, regression testing should cover:

- Scripture retrieval.
- Automatic rotation.
- Countdown.
- Server-time synchronization.
- Responsive display.
- Database connectivity.
- Existing access permissions.

This reduces the risk of introducing new problems while correcting existing ones.

## 10. Release Acceptance Criteria

A release should not be approved until:

- All critical defects are resolved.
- Major features pass their required tests.
- Scripture references and stored text are accurate.
- Synchronization has been tested on multiple devices.
- Security permissions have been reviewed.
- Supported devices have passed compatibility testing.
- Backup and recovery arrangements are available.
- Required documentation has been updated.

Features that are not implemented must not be advertised as completed.

## 11. Testing Records

Testing results should be retained in the project repository or an approved project-management system.

Recommended records include:

- Test plans.
- Test results.
- Bug reports.
- Security review results.
- Device compatibility results.
- Release approval records.
- Regression test results.

A separate test report should be maintained for each major release.

## 12. Continuous Quality Improvement

Quality assurance is an ongoing activity.

The project should periodically review:

- User feedback.
- Reported defects.
- Application performance.
- Security concerns.
- Device compatibility.
- New operating-system requirements.
- Database reliability.

Lessons learned from each release should inform subsequent development.

## 13. Current Testing Position

The existing prototype has demonstrated:

- Supabase connectivity.
- Retrieval of active Bible passages.
- Automatic Scripture rotation.
- A 60-second countdown.
- Server-time-based synchronization functionality.
- Successful display on more than one device.

Further testing is required to formally validate synchronization accuracy, the complete preacher-reading workflow, QR sharing, security, and commercial mobile functionality.

These features should only be marked as fully tested after documented test results have been recorded.

---

**End of Document**

**Document ID:** RB-QA-001  
**Version:** 1.0
