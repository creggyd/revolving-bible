# SOFTWARE DEVELOPMENT AND VERSION CONTROL POLICY

**Project:** Revolving Bible  
**Document ID:** RB-SD-001  
**Version:** 1.0  
**Status:** Internal Development Policy  
**Document Owner:** Revolving Bible Project  
**Project Owner:** Craig Francis  
**Last Updated:** November 2026

---

## 1. Purpose

This document establishes the software development, source code management, version control, and change management standards for the Revolving Bible project.

The objectives are to:

- Maintain an organized and reliable codebase.
- Protect the integrity of the application.
- Track every significant software change.
- Reduce the risk of accidental code loss.
- Support future developers and technical handovers.
- Maintain a documented development history.
- Establish a controlled path from prototype to commercial release.

## 2. Development Principles

Development should follow these principles:

1. Make changes in small, manageable stages.
2. Test changes before committing them.
3. Maintain clear documentation.
4. Avoid unnecessary modifications to working features.
5. Keep development and production configurations separate.
6. Protect credentials and sensitive configuration.
7. Record important technical decisions.
8. Ensure that another qualified developer can understand and continue the project.

## 3. Source Code Repository

GitHub is the primary source code version-control platform for the project.

**Repository:** revolving-bible

**Owner:** creggyd

**Repository URL:**  
https://github.com/creggyd/revolving-bible

The repository should contain:

- Application source code.
- Project documentation.
- Database migration scripts.
- Configuration examples.
- Installation instructions.
- Testing procedures.
- Release records.
- Development decision records.

Sensitive credentials, private keys, and confidential user information must never be committed to the repository.

## 4. Branch Management

The project currently uses the `main` branch.

As development becomes more complex, the following branch structure is recommended:

| Branch | Purpose |
|---|---|
| main | Stable and approved application version |
| develop | Ongoing development and integration |
| feature/* | Individual new features |
| bugfix/* | Defect corrections |
| release/* | Release preparation |
| hotfix/* | Urgent production corrections |

The branch structure may be introduced gradually.

Changes should be tested before they are merged into the main branch.

## 5. Commit Standards

Every meaningful change should be recorded through a Git commit.

Commit messages should clearly describe what was changed.

Recommended examples:

- Add Scripture rotation synchronization.
- Fix QR Scripture loading.
- Update church administration documentation.
- Add user authentication.
- Improve mobile display layout.
- Correct Scripture reference validation.

Avoid vague commit messages such as:

- Update.
- Changes.
- Fix.
- New file.

Each commit should represent a logical and understandable unit of work.

## 6. Change Management

Changes to the application should follow a controlled process:

1. Identify the requirement or problem.
2. Review the existing implementation.
3. Determine which files or database objects are affected.
4. Plan the proposed modification.
5. Make the change.
6. Test the affected functionality.
7. Review for security or privacy implications.
8. Update relevant documentation.
9. Commit the change.
10. Verify the deployed result where applicable.

Large changes should be divided into smaller tasks.

## 7. Development Environment

Development should initially use the existing GitHub repository and local development environment.

As the project grows, a dedicated local development environment should be established.

The environment should document:

- Required software.
- Supported operating systems.
- Runtime versions.
- Required dependencies.
- Database configuration.
- Environment variables.
- Local testing instructions.
- Deployment procedures.

Developers should be able to reproduce the development environment using the installation documentation.

## 8. Application Configuration

Configuration values should be managed separately from application logic where practical.

Examples include:

- Supabase project URL.
- Supabase publishable key.
- Backend service settings.
- Application environment.
- API configuration.
- Feature settings.

Public client-side configuration must not contain privileged credentials.

Supabase service-role keys, database passwords, private signing keys, and other secrets must be protected through appropriate secret-management mechanisms.

A safe example configuration file may be committed, but actual secret values must not be included.

## 9. Database Change Management

Changes to the Supabase database must be documented.

Database modifications should be maintained through version-controlled migration scripts.

Each migration should identify:

- Migration name or number.
- Date created.
- Purpose.
- Tables or functions affected.
- Security policy changes.
- Expected result.
- Rollback considerations.

Database changes must be tested before being applied to the production environment.

Existing user data must not be deleted or overwritten without an approved migration and backup plan.

## 10. Testing Requirements

Software changes should be tested according to their impact.

Testing should include:

- Functional testing.
- Interface testing.
- Mobile and tablet testing.
- Database testing.
- Authentication testing.
- Access control testing.
- Security testing.
- Performance testing.
- Regression testing.

A change should not be considered complete merely because the code has been committed.

The resulting application must be checked to confirm that the intended functionality works.

## 11. Documentation Standards

Documentation must remain consistent with the actual implementation.

The project should maintain:

- Product specification.
- System architecture.
- Database design.
- Installation instructions.
- Developer guide.
- User guide.
- API documentation.
- Security guidelines.
- Privacy documentation.
- Testing and QA procedures.
- Backup and recovery instructions.
- Release and deployment procedures.
- Change history.
- Project decisions.

When a feature changes, the relevant documentation should also be updated.

## 12. Release Management

Releases should be identified using a consistent versioning approach.

The recommended format is:

`MAJOR.MINOR.PATCH`

Example:

- 1.0.0 – Initial commercial release.
- 1.1.0 – New features.
- 1.1.1 – Bug fixes.
- 2.0.0 – Major product changes.

Development releases should be tested before being identified as stable releases.

Each official release should include:

- Version number.
- Release date.
- New features.
- Bug fixes.
- Known issues.
- Database migration requirements.
- Deployment notes.

## 13. Code Review and Approval

As additional developers join the project, significant changes should receive an appropriate review before deployment.

Reviews should consider:

- Code quality.
- Security.
- Performance.
- Maintainability.
- Compatibility.
- Documentation.
- Testing results.

Changes affecting authentication, payment processing, church data isolation, or sensitive information should receive particular attention.

## 14. Third-Party Dependencies

Third-party software libraries and services must be reviewed before adoption.

The project should record:

- Dependency name.
- Current version.
- Purpose.
- License.
- Security considerations.
- Update requirements.

Dependencies should be updated carefully and tested for compatibility.

## 15. Developer Handover and Continuity

The project must remain transferable to another qualified developer.

The repository should contain enough information to understand:

- What the application does.
- How the system is structured.
- How to install and run it.
- How the database is configured.
- How security is implemented.
- How to test changes.
- How to deploy releases.
- What remains incomplete.
- What decisions have already been made.

A developer handover package should include source code, documentation, migration scripts, dependency information, and relevant configuration instructions.

Credentials must be transferred securely and never embedded in handover documentation.

## 16. Backup and Recovery

The project must maintain independent backups of important source code and database information.

GitHub version history should not be treated as the only backup.

The database backup and recovery procedure is documented separately in:

`BACKUP_AND_RECOVERY.md`

Recovery procedures should be tested periodically.

## 17. Current Development Position

The current project is a working web prototype using GitHub Pages and Supabase.

The prototype includes:

- A central Scripture database.
- An automatic Scripture rotation mechanism.
- A configurable rotation interval.
- Server-time synchronization.
- A countdown display.
- Initial project documentation.

Commercial mobile applications, subscription services, multi-church administration, and advanced account management remain planned development work unless separately verified as implemented.

## 18. Development Completion Checklist

Before considering a major feature complete, confirm that:

- [ ] The requirement is documented.
- [ ] The implementation is complete.
- [ ] Relevant functionality has been tested.
- [ ] Security implications have been reviewed.
- [ ] Documentation has been updated.
- [ ] Database changes have been recorded.
- [ ] The Git commit has been created.
- [ ] The deployed version has been verified where applicable.
- [ ] Known issues have been recorded.

## 19. Policy Review

This document should be reviewed whenever the development process, repository structure, technology stack, or team responsibilities change significantly.

**Document Owner:** Revolving Bible Project

**Project Owner:** Craig Francis

**Status:** Internal Development Policy

**End of Document**
