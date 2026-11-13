# Third-Party Services, Software Dependencies and Licensing Register

## 1. Purpose

This document maintains a record of external services, software libraries, development tools, and content licences used or proposed for the Revolving Bible platform.

Its purpose is to:

- Identify external dependencies.
- Track licensing obligations.
- Reduce legal and operational risks.
- Identify services that may introduce recurring costs.
- Support future commercial distribution.
- Ensure that third-party components are reviewed before use.

## 2. Scope

This register covers:

- Cloud hosting and backend services.
- Source code management.
- Frontend development frameworks.
- Mobile application development tools.
- Software libraries and packages.
- Payment processing services.
- Bible translations and Scripture content.
- Fonts, icons, graphics, and other media.
- Application distribution platforms.

## 3. Current and Proposed Services

The following table identifies the principal services associated with the project.

| Service | Purpose | Status |
|---|---|---|
| GitHub | Source code and version control | Currently used |
| GitHub Pages | Hosting the web prototype | Currently used |
| Supabase | Database and backend services | Currently used |
| Supabase JavaScript Client | Connecting the website to Supabase | Currently used |
| Ionic | Shared application interface framework | Proposed |
| React | Application interface development | Proposed |
| Capacitor | Packaging applications for Android and iOS | Proposed |
| Google Play | Android application distribution | Planned |
| Apple App Store | iOS application distribution | Planned |

The use of a proposed service does not mean it has already been installed or implemented.

## 4. Software Dependency Register

Every external software package incorporated into the application should be recorded.

The register should include:

- Package or library name.
- Current version.
- Official project website.
- Licence type.
- Purpose within the application.
- Date introduced.
- Known security concerns.
- Whether commercial use is permitted.

A dependency inventory should be maintained as the application develops.

Dependencies should be reviewed before major releases and updated when security or compatibility issues arise.

## 5. Bible Translation and Scripture Licensing

Scripture content is a central component of the Revolving Bible platform.

The initial prototype uses the King James Version (KJV).

Before commercial distribution, the project must document:

- The exact Scripture edition or source used.
- The source from which the text was obtained.
- Whether the text is public domain in the intended distribution countries.
- Any applicable copyright or database rights.
- Whether commercial redistribution is permitted.
- Any required attribution or acknowledgements.

The project should not assume that every edition, digital transcription, or Bible database labelled KJV has identical licensing conditions.

Additional translations must undergo a separate licensing review before being incorporated.

## 6. Reflections and Other Original Content

Original reflections, explanations, descriptions, and other written material created for the platform should be maintained with appropriate ownership and editorial records.

The following principles apply:

- Distinguish original commentary from biblical text.
- Do not reproduce copyrighted devotional material without permission.
- Record the source of externally obtained content.
- Obtain appropriate permissions where required.
- Keep reflections church-neutral and broadly accessible.
- Review submitted content before publication.

## 7. Fonts, Icons, Images and Media

Any third-party fonts, icons, images, illustrations, sounds, or other media used in the platform must be reviewed.

The review should establish:

- The original creator or provider.
- The applicable licence.
- Whether commercial use is allowed.
- Whether attribution is required.
- Whether modification is permitted.
- Whether redistribution is restricted.

A copy of relevant licence information should be retained where appropriate.

## 8. Payment and Subscription Services

The commercial platform may eventually require an external payment processor.

Before selecting a provider, assess:

- Availability in Jamaica and intended international markets.
- Supported currencies.
- Transaction fees.
- Recurring subscription support.
- Refund and dispute procedures.
- Security requirements.
- Integration with Android and iOS applications.
- Compliance responsibilities.

No payment provider should be treated as selected until the decision is formally documented.

## 9. External Service Costs

Third-party services may introduce operating expenses.

The project should maintain a cost register covering:

- Hosting charges.
- Database usage.
- Storage and bandwidth.
- Application developer account fees.
- Payment processing fees.
- Domain registration.
- Monitoring services.
- Customer support services.
- Other recurring subscriptions.

Free-tier availability must not be assumed to continue indefinitely.

## 10. Security and Privacy Review

Before integrating a third-party service, assess:

- What information the provider receives.
- Whether personal information is processed.
- Where information is stored.
- Available security controls.
- Authentication and access management.
- Data retention and deletion procedures.
- Incident notification arrangements.
- Applicable privacy and data protection obligations.

Third-party services must not receive unnecessary user or church information.

Sensitive credentials must never be placed in public source code.

## 11. Dependency Approval Procedure

Before introducing a new dependency or external service:

1. Identify the business or technical requirement.
2. Research suitable providers or packages.
3. Review the applicable licence and terms.
4. Evaluate security and privacy implications.
5. Assess cost and long-term availability.
6. Test compatibility with the existing platform.
7. Record the selection and justification.
8. Update the project documentation.

Dependencies that are no longer required should be removed where practical.

## 12. Licence and Compliance Records

The project should maintain copies or references to:

- Open-source licence files.
- Third-party service terms.
- Content permissions.
- Bible translation licensing information.
- Font and image licences.
- Payment provider agreements.
- Relevant attribution requirements.

Licence records should be reviewed before commercial release and whenever a significant dependency changes.

## 13. Review Schedule

This register should be reviewed:

- Whenever a new external dependency is introduced.
- Before major software releases.
- Before commercial launch.
- When service terms or licensing conditions change.
- At least annually after commercial launch.

## 14. Commercial Launch Requirements

Before releasing the commercial product, confirm that:

- [ ] All production dependencies are identified.
- [ ] Software licences have been reviewed.
- [ ] Commercial use permissions have been verified.
- [ ] Bible text sources and rights have been documented.
- [ ] Fonts, icons and media have been reviewed.
- [ ] Third-party privacy implications have been assessed.
- [ ] External service costs have been estimated.
- [ ] Payment provider terms have been reviewed.
- [ ] Required attributions are included.
- [ ] Unnecessary or unapproved dependencies have been removed.

## 15. Current Project Status

The current prototype uses GitHub, GitHub Pages, Supabase, and the Supabase JavaScript client.

Ionic, React, Capacitor, payment processing, and commercial app distribution services are proposed or planned components and must be assessed before implementation.

Licensing and commercial-use verification remains an ongoing requirement.

## 16. Document Ownership

**Document owner:** Revolving Bible Project

**Version:** 1.0

**Status:** Development and compliance planning document

**Next review:** Before commercial release or whenever a material dependency changes.
