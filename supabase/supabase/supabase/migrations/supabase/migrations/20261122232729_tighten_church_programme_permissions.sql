
BEGIN;

-- Public visitors may only read programme records.
REVOKE ALL PRIVILEGES
ON TABLE public.church_programmes
FROM anon;

REVOKE ALL PRIVILEGES
ON TABLE public.church_programme_items
FROM anon;

GRANT SELECT
ON TABLE public.church_programmes
TO anon;

GRANT SELECT
ON TABLE public.church_programme_items
TO anon;


-- Signed-in users receive only the operations required
-- by the application. RLS policies control which rows
-- they may access or modify.
REVOKE ALL PRIVILEGES
ON TABLE public.church_programmes
FROM authenticated;

REVOKE ALL PRIVILEGES
ON TABLE public.church_programme_items
FROM authenticated;

GRANT SELECT, INSERT, UPDATE, DELETE
ON TABLE public.church_programmes
TO authenticated;

GRANT SELECT, INSERT, UPDATE, DELETE
ON TABLE public.church_programme_items
TO authenticated;


-- Remove the redundant permissive INSERT policy.
-- The remaining INSERT policy requires active,
-- authorised church membership.
DROP POLICY IF EXISTS
"Authorised church staff can create programmes"
ON public.church_programmes;

COMMIT;
