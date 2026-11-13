# Project Risk Register

## 1. Purpose

This document identifies potential risks that could affect the development, security, reliability, commercial viability, and long-term operation of the Revolving Bible platform.

It establishes a structured approach to identifying, assessing, monitoring, and reducing those risks.

The register should be updated as the project develops.

## 2. Risk Assessment Method

Each risk is assessed using two factors:

**Likelihood**

- Low: Unlikely to occur.
- Medium: Could reasonably occur.
- High: Likely to occur or has a significant chance of occurring.

**Impact**

- Low: Minor inconvenience or limited disruption.
- Medium: Noticeable disruption or additional cost.
- High: Significant financial, operational, security, or reputational consequences.

Risk priority should be determined by considering both likelihood and impact.

## 3. Project Risk Register

| ID | Risk | Likelihood | Impact | Mitigation |
|---|---|---|---|---|
| R01 | Loss of source code or project documentation | Low | High | Maintain GitHub version control and independent backups. |
| R02 | Supabase service interruption | Medium | High | Maintain recovery procedures and consider offline Scripture caching. |
| R03 | Unauthorized database access | Medium | High | Enforce Row Level Security, secure authentication, and regular permission reviews. |
| R04 | Accidental deletion or corruption of Scripture content | Medium | High | Maintain independent database backups and test restoration. |
| R05 | Scripture rotation synchronization problems | Medium | Medium | Use server-based time synchronization and test across multiple devices. |
| R06 | Incorrect Scripture wording or references | Medium | High | Verify passages against the approved source and review content before publication. |
| R07 | Copyright or licensing dispute | Medium | High | Verify Bible text sources, software licences, and third-party permissions before commercial use. |
| R08 | Unexpected hosting or database costs | Medium | Medium | Monitor usage, establish budgets, and review service plans. |
| R09 | Delays in mobile application development | Medium | Medium | Develop in manageable stages and test features incrementally. |
| R10 | Application rejection by Google Play or Apple | Medium | High | Review current store policies and submission requirements before release. |
| R11 | Loss of administrative access | Low | High | Maintain secure recovery procedures and more than one authorized administrator where appropriate. |
| R12 | Inadequate testing before release | Medium | High | Maintain a testing plan and require release checks. |
| R13 | Third-party software vulnerability | Medium | High | Monitor dependencies and apply security updates. |
| R14 | Poor user adoption | Medium | Medium | Gather feedback from individuals and churches and improve usability. |
| R15 | Failure to maintain project knowledge and documentation | Medium | High | Keep technical decisions, setup instructions, and procedures in GitHub. |
| R16 | Internet failure during a church service | Medium | Medium | Plan for cached Scripture content and offline display capabilities. |
| R17 | Loss of the primary project developer or administrator | Medium | High | Maintain complete documentation, backups, and a developer handover package. |
| R18 | Privacy or personal information exposure | Low | High | Minimize collected information, enforce access controls, and maintain incident procedures. |

These ratings are initial planning assessments, not results of a completed formal risk audit.

## 4. Key Risk Areas

### 4.1 Technical Risks

The platform depends on reliable application code, database connectivity, hosting, and synchronization.

Technical risks should be reduced through:

- Incremental development.
- Testing before deployment.
- Version-controlled changes.
- Monitoring and error reporting.
- Independent backups.
- Documented recovery procedures.

### 4.2 Security Risks

As the platform introduces individual accounts and church administration, protecting user information and church-specific data will become increasingly important.

Security measures should include:

- Secure authentication.
- Role-based access control.
- Row Level Security.
- Restricted administrative permissions.
- Secure handling of credentials.
- Periodic security reviews.

### 4.3 Content and Licensing Risks

Incorrect Scripture references or unauthorized use of copyrighted material could damage the credibility and commercial viability of the product.

Content and licensing reviews must be completed before commercial distribution.

### 4.4 Commercial Risks

The product may face challenges involving development costs, subscription pricing, competition, and user adoption.

These risks should be addressed through:

- Market research.
- Careful cost management.
- A clear product differentiation strategy.
- Pilot testing with churches and individual users.
- Gradual introduction of premium features.

## 5. Risk Monitoring and Review

The project owner should review the risk register:

- During major development milestones.
- Before introducing significant new features.
- Before commercial launch.
- After major technical or security incidents.
- Whenever a previously identified risk changes.

New risks should be added as they are discovered.

Closed risks should remain documented for historical reference.

## 6. Risk Response Procedure

When a risk becomes an actual problem:

1. Record the event and date.
2. Identify the affected system or project activity.
3. Assess the seriousness of the impact.
4. Determine whether immediate action is required.
5. Apply corrective measures.
6. Verify that the problem has been resolved.
7. Record lessons learned.
8. Update the risk register where necessary.

## 7. Commercial Launch Risk Review

Before commercial release, the following areas must be assessed:

- [ ] Database security and church data separation.
- [ ] Authentication and administrative access.
- [ ] Backup and recovery readiness.
- [ ] Scripture accuracy and content management.
- [ ] Bible translation and software licensing.
- [ ] Privacy and data protection.
- [ ] Mobile application security.
- [ ] Application store compliance.
- [ ] Hosting capacity and operating costs.
- [ ] Subscription and payment arrangements.
- [ ] Customer support and incident response.
- [ ] Developer handover and business continuity.

## 8. Current Project Risk Position

The Revolving Bible project is currently in its prototype and documentation development stage.

The existing web prototype and Supabase backend provide the foundation for further development.

The commercial mobile applications, multi-church administration, subscription infrastructure, automated monitoring, and full production security controls remain future development objectives unless separately implemented and verified.

Risks should therefore be reassessed as the project moves from prototype to commercial production.

## 9. Document Ownership

**Document owner:** Revolving Bible Project

**Version:** 1.0

**Status:** Project planning and risk management document

**Review frequency:** At major development milestones and before commercial release.
