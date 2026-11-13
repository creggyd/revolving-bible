# PRIVACY AND DATA PROTECTION POLICY

**Project:** Revolving Bible  
**Document ID:** RB-PDP-001  
**Version:** 1.0  
**Status:** Internal Policy – Draft for Review  
**Document Owner:** Revolving Bible Project  
**Project Owner:** Craig Francis  
**Last Updated:** November 2026

---

## 1. Purpose

This document establishes the privacy and data protection principles that will guide the development, operation, and commercial distribution of the Revolving Bible platform.

The project is committed to respecting user privacy, protecting personal information, and ensuring that information is collected and processed only when necessary for legitimate product functions.

This is an internal project policy and planning document. It is not a legally approved public privacy notice.

## 2. Scope

This policy applies to:

- The Revolving Bible website and Scripture display system.
- Future Android and iOS applications.
- Church administration accounts and dashboards.
- QR-code Scripture sharing.
- Preacher-controlled Scripture readings.
- Future subscription and premium services.
- Project administrators, developers, service providers, and authorized personnel.

## 3. Privacy Principles

The project will follow these principles:

1. **Data minimization:** Collect only information necessary to provide the service.
2. **Transparency:** Explain what information is collected and why.
3. **Purpose limitation:** Do not use personal information for unrelated purposes without an appropriate legal basis.
4. **Security:** Protect information against unauthorized access, alteration, loss, or disclosure.
5. **Accuracy:** Allow users to correct inaccurate personal information.
6. **Retention limitation:** Do not retain personal information longer than necessary.
7. **Accountability:** Maintain appropriate records of privacy and security decisions.

## 4. Categories of Information

As the commercial platform develops, the following categories may be processed where necessary.

### 4.1 Account Information

- Name.
- Email address.
- Authentication identifiers.
- Account preferences.
- Account creation and activity dates.

### 4.2 Church Information

- Church name and contact details.
- Authorized church administrators.
- Church service schedules.
- Preacher-controlled Scripture readings.
- Church display and rotation preferences.

### 4.3 User Preferences

- Saved or favourite Scriptures.
- Preferred display settings.
- Notification preferences.
- Reading preferences.

### 4.4 Technical Information

- Device type and operating system.
- Application version.
- Error and diagnostic reports.
- Technical logs necessary for security and troubleshooting.

### 4.5 Subscription Information

If paid services are introduced, the platform may retain subscription status, transaction references, and billing-related metadata.

Payment card information should be handled by an appropriate payment provider rather than stored directly in the Revolving Bible database.

### 4.6 Support Information

Information voluntarily supplied through customer support requests may be retained for the purpose of resolving issues.

## 5. Sensitive Personal Information

Religious beliefs and certain church membership information may be considered sensitive personal information under applicable privacy laws.

The platform will therefore:

- Avoid collecting denomination or religious affiliation unless genuinely necessary.
- Avoid requesting information about a user's religious beliefs merely to provide Scripture displays.
- Restrict access to church membership and administrative information.
- Avoid using religious information for advertising or unrelated profiling.
- Establish appropriate safeguards before introducing features that process sensitive information.

## 6. Purpose of Processing

Information may be processed for the following purposes:

- Creating and maintaining user accounts.
- Providing synchronized Scripture displays.
- Managing church accounts and authorized users.
- Supporting preacher-controlled readings.
- Maintaining user preferences and favourites.
- Providing customer support.
- Processing subscriptions.
- Improving application reliability and security.
- Meeting applicable legal obligations.

The lawful basis for each processing activity must be assessed and documented before commercial launch.

## 7. Information Sharing

Personal information may be processed by carefully selected service providers where necessary to operate the platform.

Potential providers include:

- Supabase for backend database and authentication services.
- GitHub Pages or another hosting provider for website delivery.
- Payment processors for subscription transactions.
- App stores for application distribution.
- Diagnostic or analytics providers, if introduced.

Appropriate contractual and security arrangements must be established with service providers.

The project will not sell users' personal information.

Personal information will not be shared with third parties for advertising unless the practice is separately assessed, transparently disclosed, and legally permitted.

## 8. QR-Code Privacy

The QR-code feature is intended to provide convenient access to the current Scripture passage.

The QR page should:

- Display only the intended Scripture content.
- Avoid exposing user names, email addresses, or account details.
- Avoid exposing private church records or administrative information.
- Not provide access to restricted administrative functions.
- Avoid unnecessary tracking of people who scan the QR code.

Any future personalized QR features must undergo a privacy and security review before implementation.

## 9. Data Security

The project will implement appropriate technical and organizational safeguards, including:

- Supabase Row Level Security (RLS).
- Role-based access control.
- Separation of data between churches.
- Secure authentication.
- Encryption in transit.
- Protection of administrative credentials.
- Restricted access to sensitive information.
- Security monitoring and audit records where appropriate.
- Regular database backups.
- Documented incident response procedures.

Supabase service-role keys and other secret credentials must never be placed in public website code or committed to GitHub.

## 10. Access, Correction, and Deletion

The commercial platform should provide appropriate processes for users to:

- Request access to their personal information.
- Correct inaccurate information.
- Request deletion of their accounts and associated information, subject to applicable legal obligations.
- Request a copy or export of their information where applicable.
- Withdraw consent where consent is the applicable basis for processing.

Requests must be handled through a documented process and verified before information is disclosed or changed.

## 11. Data Retention

Information will be retained only for as long as necessary for its intended purpose or as required by applicable law.

A formal retention schedule must be developed before commercial launch.

The schedule should address:

- Active and inactive accounts.
- Deleted accounts.
- Church membership records.
- Subscription and transaction records.
- Technical logs.
- Customer support records.
- Backup copies.

Deleted information should also be removed from backups according to a documented backup-retention and deletion process.

## 12. Children and Minors

Before allowing children to create accounts or use personalized services, the project must establish an appropriate age policy and determine whether parental or guardian consent is required.

Any children's features must receive a separate privacy and security assessment before release.

## 13. Cookies, Storage, and Notifications

If cookies, local storage, push notifications, or analytics are introduced, the platform must:

- Explain their purpose.
- Avoid unnecessary tracking.
- Provide appropriate controls.
- Obtain consent where legally required.
- Allow users to manage notification preferences.

## 14. Cross-Border Data Processing

Because cloud service providers may process information outside Jamaica, the project must assess applicable cross-border data transfer requirements.

Appropriate safeguards and contractual arrangements must be considered before commercial launch.

## 15. Data Breach Management

A documented incident response procedure must be maintained.

If a suspected data breach occurs, the project should:

1. Identify and contain the incident.
2. Assess the type and extent of information affected.
3. Preserve relevant evidence.
4. Determine whether users or regulatory authorities must be notified.
5. Take corrective action.
6. Document the incident and lessons learned.

Notification decisions and applicable deadlines must be reviewed against current legal requirements.

## 16. Legal and Regulatory Considerations

The project must assess its obligations under applicable Jamaican data protection legislation, including the Data Protection Act, 2020, and relevant regulations and guidance.

Before commercial release, the privacy framework must be reviewed by a qualified Jamaican privacy or legal professional.

The project must not claim compliance with GDPR or any other regulatory framework without a proper assessment.

## 17. Current Prototype Privacy Position

The existing prototype uses GitHub Pages and Supabase.

The current implementation includes public read access to active Scripture passages, rotation settings, and preacher reading records through configured database policies.

The prototype does not yet have a completed commercial user-account and subscription system.

The exact technical logs retained by hosting and backend providers must be confirmed with those providers.

Future commercial features must not be described as already implemented.

## 18. Privacy by Design

Privacy must be considered during the design and development of every major feature.

Before introducing a new feature, the project should consider:

- What information is required?
- Why is it required?
- Who can access it?
- How long should it be retained?
- Can the feature operate with less information?
- Does the feature introduce additional privacy risks?

## 19. Public Privacy Notice Requirements

A separate public-facing Privacy Policy must be prepared before commercial release.

It must accurately explain:

- The identity and contact details of the responsible organization.
- What information is collected.
- Why information is collected.
- How information is used and shared.
- How long information is retained.
- User privacy rights and request procedures.
- Contact details for privacy enquiries.
- Relevant service providers and international processing arrangements.

The public notice must reflect the actual application and its operating practices.

## 20. Pre-Launch Privacy Checklist

Before commercial release, confirm that:

- [ ] A qualified professional has reviewed the privacy framework.
- [ ] The public Privacy Policy has been prepared.
- [ ] Data collection and processing purposes are documented.
- [ ] Appropriate lawful bases have been identified.
- [ ] Supabase RLS and church data separation have been tested.
- [ ] Service-provider arrangements have been reviewed.
- [ ] Data retention periods have been established.
- [ ] Account access and deletion procedures are available.
- [ ] QR-code privacy has been tested.
- [ ] Incident response procedures are documented.
- [ ] Cross-border processing has been assessed.
- [ ] App store privacy disclosures accurately reflect the application.

## 21. Review and Maintenance

This document must be reviewed whenever significant changes are made to the platform, its data processing activities, service providers, or applicable legal requirements.

**Document Owner:** Revolving Bible Project

**Document Status:** Internal Policy – Draft for Review

**End of Document**
