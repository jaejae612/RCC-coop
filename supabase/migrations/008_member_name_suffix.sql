-- Migration 008: Add name_suffix field and extract existing suffixes
-- Run once in the Supabase SQL editor.

-- 1. Add the column
ALTER TABLE members
  ADD COLUMN IF NOT EXISTS name_suffix text;

-- 2. Extract any suffix that ended up inside last_name from migration 007
--    Matches: Jr. Sr. II III IV V (case-insensitive, at end of string)
UPDATE members
SET
  name_suffix = TRIM((regexp_match(last_name, '\s+(Jr\.|Sr\.|II|III|IV|V)\s*$', 'i'))[1]),
  last_name   = TRIM(regexp_replace(last_name, '\s+(Jr\.|Sr\.|II|III|IV|V)\s*$', '', 'i'))
WHERE last_name ~* '\s+(Jr\.|Sr\.|II|III|IV|V)\s*$';

-- 3. Re-sync full_name for rows that just had a suffix extracted
UPDATE members
SET full_name = TRIM(
  first_name || ' ' || last_name ||
  CASE WHEN name_suffix IS NOT NULL AND name_suffix <> ''
    THEN ' ' || name_suffix
    ELSE ''
  END
)
WHERE name_suffix IS NOT NULL AND name_suffix <> '';
