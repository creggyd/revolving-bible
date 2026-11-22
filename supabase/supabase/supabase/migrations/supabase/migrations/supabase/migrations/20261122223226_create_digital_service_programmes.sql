
-- ============================================================
-- REVOLVING BIBLE
-- Digital Service Programme
--
-- RECONSTRUCTED MIGRATION
-- Original applied migration:
-- 20261122223226_create_digital_service_programmes
--
-- This file was reconstructed from the verified live
-- Supabase schema, constraints, indexes and RLS policies.
-- It is not represented as the original applied SQL source.
--
-- Intended baseline: least-privilege table grants.
-- ============================================================

BEGIN;

-- ------------------------------------------------------------
-- 1. CHURCH REFERENCE CONSTRAINT
-- ------------------------------------------------------------

ALTER TABLE public.churches
ADD CONSTRAINT churches_id_slug_key
UNIQUE (id, slug);


-- ------------------------------------------------------------
-- 2. CHURCH PROGRAMMES TABLE
-- ------------------------------------------------------------

CREATE TABLE public.church_programmes (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),

    church_id uuid NOT NULL,
    church_slug text NOT NULL,

    title text NOT NULL,
    theme text,

    event_date date NOT NULL,
    start_time time,

    venue text,
    introduction text,

    status text NOT NULL DEFAULT 'draft',

    published_at timestamptz,

    created_by uuid REFERENCES auth.users(id)
        ON DELETE SET NULL,

    updated_by uuid REFERENCES auth.users(id)
        ON DELETE SET NULL,

    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),

    CONSTRAINT church_programmes_title_check
        CHECK (
            char_length(btrim(title)) >= 2
            AND char_length(btrim(title)) <= 180
        ),

    CONSTRAINT church_programmes_status_check
        CHECK (
            status IN ('draft', 'published', 'archived')
        ),

    CONSTRAINT church_programmes_church_pair_fkey
        FOREIGN KEY (church_id, church_slug)
        REFERENCES public.churches(id, slug)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);


-- Only one published programme per church.
CREATE UNIQUE INDEX church_programmes_one_published_per_church
ON public.church_programmes (church_id)
WHERE status = 'published';

CREATE INDEX church_programmes_slug_status_date_idx
ON public.church_programmes (church_slug, status, event_date);


-- ------------------------------------------------------------
-- 3. CHURCH PROGRAMME ITEMS TABLE
-- ------------------------------------------------------------

CREATE TABLE public.church_programme_items (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),

    programme_id uuid NOT NULL
        REFERENCES public.church_programmes(id)
        ON DELETE CASCADE,

    sort_order integer NOT NULL DEFAULT 1,

    item_type text NOT NULL DEFAULT 'other',

    title text NOT NULL,
    details text,
    participant text,

    scheduled_time time,

    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),

    CONSTRAINT church_programme_items_sort_order_check
        CHECK (sort_order > 0),

    CONSTRAINT church_programme_items_title_check
        CHECK (
            char_length(btrim(title)) >= 1
            AND char_length(btrim(title)) <= 180
        ),

    CONSTRAINT church_programme_items_item_type_check
        CHECK (
            item_type IN (
                'welcome',
                'prayer',
                'worship',
                'scripture',
                'song',
                'presentation',
                'sermon',
                'offering',
                'announcements',
                'closing',
                'other'
            )
        ),

    CONSTRAINT church_programme_items_order_unique
        UNIQUE (programme_id, sort_order)
);

CREATE INDEX church_programme_items_programme_order_idx
ON public.church_programme_items (programme_id, sort_order);


-- ------------------------------------------------------------
-- 4. ENABLE ROW LEVEL SECURITY
-- ------------------------------------------------------------

ALTER TABLE public.church_programmes
ENABLE ROW LEVEL SECURITY;

ALTER TABLE public.church_programme_items
ENABLE ROW LEVEL SECURITY;


-- ------------------------------------------------------------
-- 5. PROGRAMME POLICIES
-- ------------------------------------------------------------

-- Public visitors can view published programmes only.
CREATE POLICY "Public can view published church programmes"
ON public.church_programmes
FOR SELECT
TO anon
USING (status = 'published');


-- Signed-in users can view published programmes.
-- Authorised active church staff can also view their
-- own church's unpublished programmes.
CREATE POLICY "Authenticated users can view published programmes or manage the"
ON public.church_programmes
FOR SELECT
TO authenticated
USING (
    status = 'published'
    OR EXISTS (
        SELECT 1
        FROM public.church_memberships cm
        WHERE cm.church_id = church_programmes.church_id
          AND cm.user_id = (SELECT auth.uid())
          AND cm.status = 'active'
          AND cm.role IN (
              'church_admin',
              'pastor',
              'elder',
              'service_operator'
          )
    )
);


-- Only active authorised church staff can create programmes.
CREATE POLICY "Active authorised staff can insert church programmes"
ON public.church_programmes
FOR INSERT
TO authenticated
WITH CHECK (
    EXISTS (
        SELECT 1
        FROM public.church_memberships cm
        WHERE cm.church_id = church_programmes.church_id
          AND cm.user_id = (SELECT auth.uid())
          AND cm.status = 'active'
          AND cm.role IN (
              'church_admin',
              'pastor',
              'elder',
              'service_operator'
          )
    )
);


-- Active authorised staff can update their church's programmes.
CREATE POLICY "Active authorised staff can update church programmes"
ON public.church_programmes
FOR UPDATE
TO authenticated
USING (
    EXISTS (
        SELECT 1
        FROM public.church_memberships cm
        WHERE cm.church_id = church_programmes.church_id
          AND cm.user_id = (SELECT auth.uid())
          AND cm.status = 'active'
          AND cm.role IN (
              'church_admin',
              'pastor',
              'elder',
              'service_operator'
          )
    )
)
WITH CHECK (
    EXISTS (
        SELECT 1
        FROM public.church_memberships cm
        WHERE cm.church_id = church_programmes.church_id
          AND cm.user_id = (SELECT auth.uid())
          AND cm.status = 'active'
          AND cm.role IN (
              'church_admin',
              'pastor',
              'elder',
              'service_operator'
          )
    )
);


-- Only church administrators and pastors can delete programmes.
CREATE POLICY "Church administrators and pastors can delete programmes"
ON public.church_programmes
FOR DELETE
TO authenticated
USING (
    EXISTS (
        SELECT 1
        FROM public.church_memberships cm
        WHERE cm.church_id = church_programmes.church_id
          AND cm.user_id = (SELECT auth.uid())
          AND cm.status = 'active'
          AND cm.role IN ('church_admin', 'pastor')
    )
);


-- ------------------------------------------------------------
-- 6. PROGRAMME ITEM POLICIES
-- ------------------------------------------------------------

-- Public visitors can view items belonging to published
-- programmes only.
CREATE POLICY "Public can view items in published programmes"
ON public.church_programme_items
FOR SELECT
TO anon
USING (
    EXISTS (
        SELECT 1
        FROM public.church_programmes p
        WHERE p.id = church_programme_items.programme_id
          AND p.status = 'published'
    )
);


-- Signed-in users can view published items.
-- Authorised active church staff can also view items
-- belonging to their church's unpublished programmes.
CREATE POLICY "Authenticated users can view published programme items or their"
ON public.church_programme_items
FOR SELECT
TO authenticated
USING (
    EXISTS (
        SELECT 1
        FROM public.church_programmes p
        WHERE p.id = church_programme_items.programme_id
          AND (
              p.status = 'published'
              OR EXISTS (
                  SELECT 1
                  FROM public.church_memberships cm
                  WHERE cm.church_id = p.church_id
                    AND cm.user_id = (SELECT auth.uid())
                    AND cm.status = 'active'
                    AND cm.role IN (
                        'church_admin',
                        'pastor',
                        'elder',
                        'service_operator'
                    )
              )
          )
    )
);


-- Active authorised staff can add items to their church's
-- programmes.
CREATE POLICY "Authorised church staff can add programme items"
ON public.church_programme_items
FOR INSERT
TO authenticated
WITH CHECK (
    EXISTS (
        SELECT 1
        FROM public.church_programmes p
        JOIN public.church_memberships cm
          ON cm.church_id = p.church_id
        WHERE p.id = church_programme_items.programme_id
          AND cm.user_id = (SELECT auth.uid())
          AND cm.status = 'active'
          AND cm.role IN (
              'church_admin',
              'pastor',
              'elder',
              'service_operator'
          )
    )
);


-- Active authorised staff can update programme items.
CREATE POLICY "Authorised church staff can update programme items"
ON public.church_programme_items
FOR UPDATE
TO authenticated
USING (
    EXISTS (
        SELECT 1
        FROM public.church_programmes p
        JOIN public.church_memberships cm
          ON cm.church_id = p.church_id
        WHERE p.id = church_programme_items.programme_id
          AND cm.user_id = (SELECT auth.uid())
          AND cm.status = 'active'
          AND cm.role IN (
              'church_admin',
              'pastor',
              'elder',
              'service_operator'
          )
    )
)
WITH CHECK (
    EXISTS (
        SELECT 1
        FROM public.church_programmes p
        JOIN public.church_memberships cm
          ON cm.church_id = p.church_id
        WHERE p.id = church_programme_items.programme_id
          AND cm.user_id = (SELECT auth.uid())
          AND cm.status = 'active'
          AND cm.role IN (
              'church_admin',
              'pastor',
              'elder',
              'service_operator'
          )
    )
);


-- Only church administrators and pastors can delete items.
CREATE POLICY "Church administrators and pastors can delete programme items"
ON public.church_programme_items
FOR DELETE
TO authenticated
USING (
    EXISTS (
        SELECT 1
        FROM public.church_programmes p
        JOIN public.church_memberships cm
          ON cm.church_id = p.church_id
        WHERE p.id = church_programme_items.programme_id
          AND cm.user_id = (SELECT auth.uid())
          AND cm.status = 'active'
          AND cm.role IN ('church_admin', 'pastor')
    )
);


-- ------------------------------------------------------------
-- 7. TABLE PRIVILEGES
-- ------------------------------------------------------------

-- Public attendees: read-only access.
GRANT SELECT
ON public.church_programmes
TO anon;

GRANT SELECT
ON public.church_programme_items
TO anon;


-- Signed-in application users: operations are further
-- restricted by the Row Level Security policies above.
GRANT SELECT, INSERT, UPDATE, DELETE
ON public.church_programmes
TO authenticated;

GRANT SELECT, INSERT, UPDATE, DELETE
ON public.church_programme_items
TO authenticated;


-- Backend service role.
GRANT ALL PRIVILEGES
ON public.church_programmes
TO service_role;

GRANT ALL PRIVILEGES
ON public.church_programme_items
TO service_role;


COMMIT;
