-- Migration 007: Backfill first_name and last_name for existing members
-- Splits full_name on the FIRST space:
--   "Juan Dela Cruz"  → first_name = "Juan",  last_name = "Dela Cruz"
--   "Agnes Nillas"    → first_name = "Agnes", last_name = "Nillas"
--   "MC Quary Liong"  → first_name = "MC",    last_name = "Quary Liong"
--
-- Review and manually correct any entries where the split is not ideal
-- (e.g. double first names like "Maria Rosario") via the Admin → Members page
-- or directly in the Supabase table editor.
--
-- Run once in the Supabase SQL editor.

UPDATE members
SET
  first_name = CASE
    WHEN POSITION(' ' IN full_name) > 0
      THEN split_part(full_name, ' ', 1)
    ELSE full_name
  END,
  last_name = CASE
    WHEN POSITION(' ' IN full_name) > 0
      THEN TRIM(SUBSTRING(full_name FROM POSITION(' ' IN full_name) + 1))
    ELSE ''
  END
WHERE first_name IS NULL
   OR last_name  IS NULL;
