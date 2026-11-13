# CONTENT AND BIBLE TRANSLATION POLICY

**Project:** Revolving Bible  
**Document ID:** RB-CTP-001  
**Version:** 1.0  
**Status:** Internal Policy – Draft for Review  
**Document Owner:** Revolving Bible Project  
**Project Owner:** Craig Francis  
**Last Updated:** November 2026

---

## 1. Purpose

This policy establishes the standards for selecting, storing, displaying, reviewing, and maintaining biblical content within the Revolving Bible platform.

Its purpose is to ensure that Scripture is presented accurately, consistently, respectfully, and in accordance with applicable copyright and licensing requirements.

The platform is intended to serve individual Christians and churches across different Christian traditions.

## 2. Content Philosophy

The Revolving Bible platform will follow these principles:

- Scripture must be presented accurately.
- Biblical references must be verifiable.
- Bible translations must be clearly identified.
- Scripture must remain distinct from commentary and reflections.
- Content should be accessible to Christians across different denominations.
- The platform must not promote one denomination's doctrines as universally accepted Christian teaching.
- Users should be able to identify the source and translation of every displayed passage.

## 3. Primary Bible Translation

The initial Scripture translation for the platform will be the **King James Version (KJV)**.

The preferred textual presentation is the traditional KJV wording commonly associated with the 1769 Oxford edition.

The project must maintain a consistent spelling, punctuation, and wording standard throughout its Scripture library.

The project must not describe its text as an exact reproduction of a particular historical printing unless that has been independently verified.

## 4. Translation and Copyright Management

Before any Bible translation is used commercially, the project must verify:

- Copyright status.
- Applicable public-domain status.
- Licensing conditions.
- Permission requirements.
- Attribution requirements.
- Restrictions on digital reproduction and distribution.

The project must not assume that every Bible translation is free for commercial use.

Any additional translation must undergo a licensing review before being added to the commercial platform.

A record should be maintained for every translation, including its name, edition, source, licensing status, and applicable conditions.

## 5. Scripture Reference Accuracy

Every Scripture entry must include sufficient information to identify its source.

The standard passage record should contain:

- Bible book.
- Chapter.
- Starting verse.
- Ending verse, where applicable.
- Complete passage text.
- Translation identifier.
- Active or inactive status.
- Date added.
- Source or verification information.

References must be checked against the selected translation before publication.

The system must avoid:

- Incorrect chapter references.
- Missing verses.
- Duplicate passages.
- Incomplete passage text.
- Incorrect verse ordering.
- Unintended changes to biblical wording.

## 6. Scripture Library Management

The initial prototype contains 30 active Scripture passages.

The commercial platform must support a larger and expandable Scripture library.

The initial commercial target is at least 365 passages, with the ability to expand beyond 1,000 passages as the project grows.

The library must be managed centrally through the backend rather than being permanently restricted to passages hardcoded in the application.

Authorized administrators should be able to:

- Add Scripture passages.
- Edit incorrect entries.
- Activate or deactivate passages.
- Organize passages by category.
- Review passage references.
- Manage translation information.
- Maintain content history.

Inactive passages should not appear in normal automatic rotation.

## 7. Scripture Categories

To make the library easier to navigate, passages may be organized into categories such as:

- Faith.
- Love.
- Hope.
- Wisdom.
- Prayer.
- Forgiveness.
- Strength.
- Family.
- Peace.
- Salvation.
- Patience.
- Encouragement.
- Guidance.
- Gratitude.
- Christian living.

Categories are intended to improve navigation and discovery.

A passage may belong to more than one category where appropriate.

## 8. Scripture Rotation Standards

The revolving Scripture display will present passages automatically according to the configured rotation settings.

The initial prototype uses a 60-second rotation interval.

The commercial version should support configurable rotation intervals where authorized users can select an appropriate duration.

Rotation should:

- Use a shared time reference.
- Keep connected displays synchronized.
- Avoid repeatedly showing the same passage unnecessarily.
- Respect the active status of passages.
- Recover gracefully after a temporary connection interruption.
- Display a clear loading or error message when Scripture content cannot be retrieved.

The system should maintain consistent passage selection across connected devices.

## 9. Preacher-Controlled Scripture Readings

The preacher-controlled reading feature must remain separate from the automatic revolving Scripture display.

Authorized users should be able to select a passage for a church service or special presentation.

The selected reading should remain visible until it is changed or the applicable service configuration ends.

The system should identify the passage reference and translation clearly.

Automatic rotation must not unintentionally overwrite the preacher-controlled reading.

## 10. QR-Code Scripture Content

QR-code sharing should provide convenient access to the intended current Scripture passage.

The QR page should:

- Retrieve the appropriate current passage.
- Display the complete passage text.
- Show the biblical reference.
- Identify the translation.
- Work on common mobile devices.
- Avoid exposing private administrative information.

The QR page should retrieve current content when opened rather than relying on an outdated copy.

## 11. Reflections and Commentary

The platform may provide optional short reflections based on selected Scripture passages.

Reflections must:

- Be church-neutral and broadly accessible to Christians.
- Remain grounded in the actual biblical passage.
- Encourage practical Christian living.
- Avoid presenting disputed denominational interpretations as universally accepted doctrine.
- Avoid changing or paraphrasing Scripture while presenting the result as a direct Bible quotation.
- Be clearly identified as supplementary commentary.

The Bible passage must always remain distinguishable from the reflection.

## 12. Reflection Review Standards

Before publication, reflections should be reviewed for:

- Biblical relevance.
- Accuracy of the Scripture reference.
- Clear and understandable language.
- Respectful treatment of different Christian traditions.
- Absence of unsupported theological claims.
- Practical usefulness.
- Appropriate tone.

Where automated tools assist with drafting reflections, human review should occur before content is published as approved project material.

## 13. Content Quality Assurance

The project should maintain a content review process.

Quality checks should include:

1. Confirming the Bible book and chapter.
2. Verifying the verse range.
3. Comparing wording against the approved translation source.
4. Checking punctuation and spelling consistency.
5. Confirming the translation label.
6. Checking the passage display on mobile and tablet devices.
7. Confirming that the passage appears correctly during rotation and QR sharing.

Corrections should be recorded so that the content history remains traceable.

## 14. Content Administration and Permissions

Only authorized personnel should be able to modify the official Scripture library.

The commercial platform should provide appropriate roles for:

- System administrators.
- Content administrators.
- Church administrators.
- Authorized church users.
- Standard individual users.

Church administrators should not be permitted to modify the central Scripture library unless explicitly granted the required system-level permission.

## 15. Future Content Expansion

Future content may include:

- Additional licensed Bible translations.
- Scripture reading plans.
- Thematic Scripture collections.
- Daily Scripture selections.
- Weekly church Scripture selections.
- Short reflections.
- Educational Scripture resources.
- Audio Scripture features, subject to appropriate licensing.

Every new content type must undergo appropriate accuracy, copyright, privacy, and security review before release.

## 16. Content and Copyright Complaints

The project should establish a procedure for receiving and reviewing complaints concerning:

- Incorrect Scripture wording.
- Incorrect references.
- Copyright concerns.
- Unauthorized reproduction.
- Inappropriate supplementary content.

Complaints should be investigated promptly, and affected material should be corrected, restricted, or removed where appropriate.

## 17. Content Maintenance

The Scripture library should be reviewed periodically.

The review should consider:

- Accuracy of references.
- Translation consistency.
- Duplicate entries.
- Broken or incomplete records.
- Content categorization.
- Licensing changes.
- User-reported errors.

Changes should be documented through appropriate project records and version control.

## 18. Commercial Release Requirements

Before commercial release, confirm that:

- [ ] The primary KJV text source has been verified.
- [ ] The intended KJV edition and presentation standard are documented.
- [ ] Commercial translation rights have been assessed.
- [ ] All published passages have been checked.
- [ ] The library supports at least 365 passages.
- [ ] The library can expand beyond 1,000 passages.
- [ ] Content administration permissions are established.
- [ ] Reflections are clearly separated from Scripture.
- [ ] Church-neutral reflection standards are implemented.
- [ ] QR Scripture references are accurate.
- [ ] Rotation and preacher readings have been tested.
- [ ] Content correction procedures are documented.

## 19. Review and Approval

This policy must be reviewed as the platform expands and introduces additional translations or content services.

Changes to the approved Scripture source, translation standards, or content governance process must be documented.

**Document Owner:** Revolving Bible Project  
**Project Owner:** Craig Francis  
**Status:** Internal Policy – Draft for Review

**End of Document**
