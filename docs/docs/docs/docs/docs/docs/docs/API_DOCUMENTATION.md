# Revolving Bible — API Documentation

**Document ID:** RB-API-001  
**Version:** 1.0  
**Status:** Current Prototype Documentation  
**Project:** Revolving Bible  
**Document Owner:** Revolving Bible Project  

---

## 1. Purpose

This document describes how the Revolving Bible application communicates with its Supabase backend.

It identifies the database tables, existing database function, access permissions, and current data-retrieval approach.

It also identifies API functionality planned for future commercial releases.

This document must be updated whenever the application introduces or changes backend functionality.

## 2. Current Backend Architecture

The current prototype uses Supabase as its backend service.

The application communicates with Supabase through the Supabase JavaScript client library.

**Supabase project URL:**

`https://tthgeaiokpltmfxxmibb.supabase.co`

**JavaScript client library:**

`https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2`

The current prototype does not have a separately developed custom REST API server. Database access is handled through Supabase.

## 3. Current Database Resources

The following database tables have been created.

| Database table | Purpose |
|---|---|
| `bible_passages` | Stores Bible passages used by the revolving display. |
| `rotation_settings` | Stores the rotation interval and rotation start time. |
| `preacher_readings` | Stores Scripture readings selected for church services. |

All three tables have Row Level Security (RLS) enabled.

### 3.1 Bible Passages

**Table:** `public.bible_passages`

The application retrieves active Bible passages from this table.

Known query:

```javascript
const { data: bibleData, error: bibleError } =
    await supabaseClient
        .from("bible_passages")
        .select("*")
        .eq("active", true)
        .order("id", { ascending: true });

if (bibleError) throw bibleError;
```

The returned passages are used by the revolving Scripture display.

Relevant fields include:

- `id`
- `book`
- `chapter`
- `verse_start`
- `verse_end`
- `passage_text`
- `translation`
- `active`
- `created_at`

Only active passages are retrieved by the known application query.

### 3.2 Rotation Settings

**Table:** `public.rotation_settings`

This table stores the settings controlling Scripture rotation.

Relevant fields include:

- `id`
- `rotation_interval_seconds`
- `rotation_start_at`
- `updated_at`

The current rotation interval is intended to be 60 seconds.

The application uses the rotation settings and server time to calculate which passage should be displayed.

The precise database query and update operations should be verified against the current application source code before another developer changes this functionality.

### 3.3 Preacher Readings

**Table:** `public.preacher_readings`

This table is intended to store the Scripture selected for a church service or preacher-controlled display.

Relevant fields include:

- `id`
- `book`
- `chapter`
- `verse_start`
- `verse_end`
- `passage_text`
- `translation`
- `service_date`
- `service_type`
- `created_at`

Public read access is configured through RLS.

The complete preacher-reading workflow must be verified in the application before it is classified as fully implemented.

## 4. Server Time API Function

**Function name:** `get_server_time()`

**Type:** Supabase PostgreSQL RPC function

The function returns the current timestamp from the Supabase database server.

Its SQL definition is:

```sql
CREATE OR REPLACE FUNCTION public.get_server_time()
RETURNS timestamptz
LANGUAGE sql
VOLATILE
AS $$
    SELECT clock_timestamp();
$$;
```

Execution permission has been granted to:

- `anon`
- `authenticated`

### 4.1 Calling the Function

The application calls the function through the Supabase JavaScript client:

```javascript
const { data: serverTimeData, error: serverTimeError } =
    await supabaseClient.rpc("get_server_time");

if (serverTimeError) throw serverTimeError;
```

### 4.2 Purpose

The function helps synchronize the Scripture rotation across different devices.

The application compares the returned server timestamp with the local device time and calculates a time offset.

The offset is then used when determining the current Scripture and countdown.

This reduces differences caused by individual device clocks.

### 4.3 Current Synchronization Approach

The application records:

- The time immediately before the server request.
- The time immediately after the server request.
- The timestamp returned by Supabase.

It uses the midpoint of the request interval to estimate the difference between the device clock and server clock.

The estimated offset is stored in:

`serverTimeOffset`

The rotation calculation then uses the estimated server time rather than relying entirely on the device clock.

## 5. Security and Access Control

Row Level Security is enabled on the current database tables.

The current public read permissions are:

| Table | Public access |
|---|---|
| `bible_passages` | Read active passages |
| `rotation_settings` | Read settings |
| `preacher_readings` | Read readings |

Public write permissions have not been configured.

This is intentional. Public visitors should not be able to modify Bible passages, rotation settings, or preacher readings.

Future administration functionality must use authenticated users and properly restricted database permissions.

### 5.1 API Key Protection

The application may use the Supabase publishable key in its frontend when the database is properly protected by RLS.

The following rules are mandatory:

1. Never place a Supabase service-role key in frontend JavaScript.
2. Never publish secret API keys in GitHub.
3. Do not rely on hiding buttons as a security measure.
4. Enforce permissions through Supabase authentication and RLS.
5. Restrict church administrators to their authorized church records.
6. Review database permissions whenever new tables or functions are introduced.

## 6. Current API Status

| Resource | Status |
|---|---|
| Retrieve active Bible passages | Implemented |
| Retrieve server time | Implemented |
| Calculate synchronized rotation | Implemented |
| Store rotation settings | Database table created |
| Retrieve rotation settings | Verify exact implementation in source |
| Store preacher readings | Database table created |
| Retrieve preacher readings | Public read policy configured; application workflow requires verification |
| Secure administrator write operations | Not yet implemented |
| Individual user accounts | Planned |
| Church accounts and membership | Planned |
| Subscription management | Planned |

A database table existing does not automatically mean that its complete application functionality has been implemented.

## 7. Planned Commercial API Functionality

The following backend capabilities are planned for future development.

They must not be treated as existing production APIs until they have been developed, tested, documented, and deployed.

### 7.1 User Authentication

- User registration.
- Secure login and logout.
- Password recovery.
- Account management.
- User profile management.

### 7.2 Church Management

- Create a church account.
- Register church information.
- Add and remove church members.
- Assign church administrators.
- Manage church-specific settings.
- Separate information belonging to different churches.

### 7.3 Administration

- Add and edit Bible passages.
- Activate and deactivate passages.
- Manage rotation intervals.
- Select preacher readings.
- Schedule church Scripture readings.
- Manage registered display devices.

### 7.4 Individual User Features

- Save favourite passages.
- Manage personal Scripture preferences.
- Configure reminders.
- Access personal reading history.
- Share Scripture passages.

### 7.5 Subscription Management

- Individual subscription plans.
- Church subscription plans.
- Subscription status.
- Payment-provider integration.
- Subscription renewal and cancellation.

Payment processing must be handled through an appropriately secured payment provider. Payment credentials must never be stored in publicly accessible application code.

## 8. API Development Standards

All future API and database functionality should follow these standards:

1. Use authenticated access for protected operations.
2. Apply RLS to all tables containing protected information.
3. Validate submitted information.
4. Handle database errors without exposing sensitive information.
5. Use consistent naming conventions.
6. Document all new functions and database operations.
7. Test permissions using different user roles.
8. Maintain backward compatibility where practical.
9. Record important administrative actions where appropriate.
10. Keep development, testing, and production environments separate as the commercial product grows.

## 9. Testing Requirements

Before a new API function or database operation is released, verify:

- It performs the intended operation.
- It returns the expected information.
- It handles invalid input.
- It handles connection failures.
- It respects RLS permissions.
- Unauthorized users cannot perform restricted operations.
- It does not expose secret keys or sensitive information.
- It works with the intended mobile and web clients.

Synchronization tests should include multiple devices using different local clock settings.

## 10. Maintenance and Version Control

Whenever API functionality changes:

1. Update this document.
2. Update the database design document if the schema changes.
3. Update the security guidelines if permissions change.
4. Record significant changes in `CHANGELOG.md`.
5. Save the corresponding source-code changes in GitHub.
6. Maintain database migration scripts and backup copies.

No undocumented production database changes should be made.

## 11. Current Development Position

The current Revolving Bible prototype has an operational Supabase connection, active Bible passage retrieval, a server-time function, and synchronized Scripture rotation.

The project is being prepared for a broader commercial platform supporting individual Christians and churches.

Future developers must distinguish between existing prototype functionality and planned commercial functionality when maintaining or extending the system.

---

**End of Document**

**Document ID:** RB-API-001  
**Version:** 1.0
