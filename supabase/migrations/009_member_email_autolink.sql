-- ============================================================
-- RCC COOP — Migration 009
-- Adds email to members + profiles, backfills from auth.users,
-- auto-links profiles to members by name, updates trigger.
-- Run in: Supabase Dashboard → SQL Editor
-- ============================================================

-- 1. Add email columns (safe to re-run)
ALTER TABLE members  ADD COLUMN IF NOT EXISTS email text;
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS email text;

-- 2. Backfill profiles.email from auth.users for all existing accounts
UPDATE profiles p
SET email = u.email
FROM auth.users u
WHERE p.id = u.id
  AND p.email IS NULL;

-- 3. Auto-link profiles to members where display_name matches full_name exactly
--    Only links when there is exactly one matching member (avoids ambiguity).
UPDATE profiles p
SET member_id = m.id
FROM (
  SELECT id, full_name
  FROM members
  WHERE full_name IS NOT NULL AND trim(full_name) <> ''
) m
WHERE p.member_id IS NULL
  AND lower(trim(coalesce(p.display_name, ''))) = lower(trim(m.full_name))
  AND length(trim(coalesce(p.display_name, ''))) > 3
  AND (
    SELECT count(*)
    FROM members m2
    WHERE lower(trim(m2.full_name)) = lower(trim(coalesce(p.display_name, '')))
  ) = 1;

-- 4. Once profiles are linked, copy their auth email back to the member record
UPDATE members m
SET email = p.email
FROM profiles p
WHERE p.member_id = m.id
  AND p.email IS NOT NULL
  AND m.email IS NULL;

-- 5. Update the on_auth_user_created trigger to also capture email going forward
CREATE OR REPLACE FUNCTION handle_new_user()
RETURNS trigger LANGUAGE plpgsql SECURITY DEFINER AS $$
BEGIN
  INSERT INTO profiles (id, display_name, email)
  VALUES (
    new.id,
    new.raw_user_meta_data->>'display_name',
    new.email
  );
  RETURN new;
END;
$$;
