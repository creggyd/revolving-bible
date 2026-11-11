# Revolving Bible — User Guide

**Document ID:** RB-UG-001  
**Version:** 1.0  
**Status:** Initial User Guide  
**Project:** Revolving Bible  
**Document Owner:** Revolving Bible Project  

---

## 1. Introduction

Welcome to Revolving Bible.

Revolving Bible is a Scripture display and sharing platform designed to make God's Word accessible to individuals, families, churches, and congregations.

The platform is being developed to provide:

- Automatically rotating Bible passages.
- Scripture displays for church services.
- Preacher-selected Scripture readings.
- QR-based Scripture sharing.
- Individual Scripture access through mobile devices.
- Church administration and synchronized displays.

The objective is to make Scripture presentation simple, accessible, and reliable.

## 2. Accessing Revolving Bible

The current prototype is accessible through a web browser.

**Current website:**

https://creggyd.github.io/revolving-bible/

Open the website using a supported browser on a computer, tablet, or mobile phone.

The commercial version is planned to provide dedicated Android and Apple mobile applications.

## 3. Using the Scripture Display

The Scripture display presents Bible passages retrieved from the project's online database.

When the application opens:

1. The application connects to Supabase.
2. It retrieves active Bible passages.
3. It identifies the passage scheduled for display.
4. It presents the Scripture reference and passage text.
5. The countdown indicates when the next passage is expected.

The current prototype uses the King James Version (KJV).

## 4. Automatic Scripture Rotation

The revolving display changes passages automatically.

The current prototype uses a 60-second rotation interval.

Users do not need to manually change passages during normal operation.

The display uses a shared server-time reference to help different devices show the same Scripture at approximately the same time.

For church use, this allows multiple screens to present synchronized Scripture passages.

## 5. Using Multiple Displays

The website can be opened on more than one device.

For example:

- A television-connected computer.
- A church tablet.
- A laptop.
- A mobile phone.

For the best synchronization results:

1. Connect each device to the internet.
2. Open the same Revolving Bible website.
3. Allow each device to finish loading.
4. Compare the displayed Scripture passages.
5. Observe the countdown and passage transitions.

The devices should follow the same server-based rotation schedule.

## 6. QR Code Scripture Sharing

QR-based Scripture sharing is part of the planned platform functionality.

The intended process is:

1. A QR code is displayed during a church service.
2. Congregation members scan the code using their phones.
3. Their browser opens the Scripture-sharing page.
4. The page retrieves the current revolving Scripture.
5. The Scripture appears in a clean, mobile-friendly format.

The sharing page is intended to display only the relevant Scripture content.

The final QR workflow must be verified before being treated as an available production feature.

## 7. Preacher-Controlled Scripture Reading

The preacher-reading feature is designed to allow an authorized church user to select a Scripture passage for a particular service.

The intended workflow is:

1. An authorized user selects a Bible book.
2. The user enters the chapter and verse range.
3. The selected Scripture is saved.
4. The preacher display retrieves the selected reading.
5. The passage remains displayed independently of the automatic revolving Scripture display.

This separation allows the church to display general Scripture passages while the preacher's selected reading remains visible on a separate screen.

The complete administration and display workflow is still subject to implementation and testing.

## 8. Individual User Features

The planned commercial individual edition will provide additional features.

These may include:

- Daily Scripture.
- Favourite Bible passages.
- Personal Scripture collections.
- Sharing passages with friends and family.
- Scripture reminders.
- Reading plans.
- Personal notes.

Availability may depend on the selected subscription plan.

## 9. Church Features

The planned church edition is intended to support:

- Church registration.
- Multiple authorized users.
- Church-specific Scripture settings.
- Preacher-controlled readings.
- Multiple synchronized displays.
- QR-based congregational sharing.
- Service schedules.
- Church administration.

Each church's protected information will be separated through the application's access-control system.

## 10. Reflections and Scripture Commentary

The commercial platform may include optional reflections associated with selected Bible passages.

These reflections are intended to:

- Encourage practical Christian living.
- Promote reflection on the meaning of Scripture.
- Offer encouragement and spiritual application.
- Remain broadly accessible to Christians across denominations.

Bible text and commentary must be clearly distinguished.

Reflections should not be presented as additional Bible verses or as authoritative denominational doctrine.

## 11. Troubleshooting

### 11.1 Scripture Does Not Load

Try the following:

1. Confirm that the device has an internet connection.
2. Refresh the website.
3. Wait for the application to reconnect.
4. Try opening the website in another browser.

If the problem continues, report the issue to the project administrator.

### 11.2 Scripture Does Not Change

Check that:

1. The countdown is visible.
2. The countdown is decreasing.
3. The device is connected to the internet.
4. The page has not become unresponsive.

If necessary, refresh the page.

### 11.3 Devices Display Different Passages

Check that:

1. Both devices are using the same website.
2. Both devices have completed loading.
3. Both devices have an active internet connection.

If the issue continues, record the devices and the time at which the difference occurred.

### 11.4 QR Code Does Not Open

Once QR functionality is available, verify that:

1. The phone camera can scan the code.
2. The code is clear and undamaged.
3. The device has an internet connection.
4. The QR destination is accessible.

### 11.5 Application Displays an Error

Record:

- The date and time.
- The device being used.
- The browser or application version.
- The action that caused the error.
- Any visible error message.

Provide these details to the project administrator.

## 12. Responsible Use

Users should:

- Use the application for its intended Scripture presentation and sharing purposes.
- Respect copyright and licensing requirements associated with Bible translations.
- Avoid attempting to access unauthorized administrative functions.
- Protect their account credentials when user accounts become available.
- Report technical issues responsibly.

## 13. Future Updates

As Revolving Bible develops, this guide will be updated to cover:

- Android application installation.
- Apple application installation.
- Individual account registration.
- Church registration.
- User roles and permissions.
- Subscription management.
- Advanced church display controls.
- Additional Scripture and personalization features.

## 14. Important Notice

This guide describes both existing prototype functionality and planned commercial functionality.

A feature described as planned should not be assumed to be available until it has been implemented, tested, and released.

---

**End of Document**

**Document ID:** RB-UG-001  
**Version:** 1.0
