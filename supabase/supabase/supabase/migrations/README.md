# Supabase Database Migrations

This directory contains the database migration records for the Revolving Bible project.

## Migration files

| Migration file | Description |
|---|---|
| `20261120153454_restrict_scripture_tables_to_read_only` | Restricts public Scripture table access to read-only operations. |
| `20261120154022_scope_preacher_readings_to_active_church_members` | Restricts preacher reading access to active church members and authorised roles. |
| `20261122223226_create_digital_service_programmes.sql` | Reconstructed schema record for the Digital Service Programme database tables. |
| `20261122232729_tighten_church_programme_permissions.sql` | Tightens programme table privileges and removes a redundant permissive INSERT policy. |

## Important migration guidance

- Migration records must be retained and maintained as part of the project's source code.
- Never apply a migration to an existing database without first checking its migration history and current schema.
- The Digital Service Programme schema file is a reconstructed record of the original migration, not the exact original SQL execution script.
- The permission-tightening migration was applied successfully to the existing Supabase project.
- New database changes should be implemented through properly versioned migration files.
- Database changes must be tested and verified before production deployment.

## Security requirements

- Enable Row Level Security on tables containing church or user-specific information.
- Apply least-privilege database permissions.
- Never expose the Supabase service-role key in front-end code.
- Verify access restrictions for anonymous users, authenticated users and authorised church personnel.

For the complete database architecture and implementation history, consult:

- `docs/SOFTWARE_TECHNICAL_SPECIFICATION.md`
- `docs/CODE_AND_DATABASE_CHANGE_REGISTER.md`
- `docs/DEVELOPER_INSTALLATION_AND_SETUP_MANUAL.md`
- `docs/REVOLVING_BIBLE_MASTER_GUIDE.md`
