-- ============================================================
-- RCC COOP — Wilfredo Canacao: email + contact number update
-- Personal email confirmed: pidotcanacao@gmail.com
-- Contact number: 09238597054
-- ============================================================

-- 1. Update auth login email
UPDATE auth.users
SET email = 'pidotcanacao@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'wilfredo.canacao@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"pidotcanacao@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'wilfredo.canacao@rcccoop.com';

-- 2. Update member record
UPDATE public.members
SET
  email          = 'pidotcanacao@gmail.com',
  contact_number = '09238597054'
WHERE full_name ILIKE '%wilfredo%canacao%';

-- 3. Update profile email to stay in sync
UPDATE public.profiles
SET email = 'pidotcanacao@gmail.com'
WHERE id = '78a6503c-bcd2-4b5f-90ed-a8900df03e6b';
