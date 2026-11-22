# Supabase Database Documentation

This directory contains the database documentation and migration records for the Revolving Bible project.

## Directory structure

- `migrations/` — versioned SQL migration files documenting database changes.

## Database platform

The project uses Supabase for:

- PostgreSQL database management.
- Authentication.
- Row Level Security (RLS).
- Church and user data management.
- Backend services and application integrations.

## Development requirements

- Record database changes in version-controlled migration files.
- Maintain least-privilege database permissions.
- Enable and verify RLS on protected tables.
- Never commit confidential credentials or service-role keys.
- Verify database changes before production deployment.

## Technical references

Consult the following documents:

- `docs/SOFTWARE_TECHNICAL_SPECIFICATION.md`
- `docs/DEVELOPER_INSTALLATION_AND_SETUP_MANUAL.md`
- `docs/CODE_AND_DATABASE_CHANGE_REGISTER.md`
- `docs/REVOLVING_BIBLE_MASTER_GUIDE.md`

