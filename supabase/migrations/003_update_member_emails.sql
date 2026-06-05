-- ============================================================
-- RCC COOP — Member Email Updates
-- Updates auth.users and auth.identities so members can log in
-- with their personal email addresses.
--
-- Run in: Supabase Dashboard → SQL Editor
--
-- 27 entries total. Safe to run the entire file.
--
-- NEW MEMBER ACCOUNTS (added at bottom via DO $$ blocks):
--   NEW-1  Nimfa Elustrisimo      — elustrisimonimfa@gmail.com / elustrisimo1234
--   NEW-2  Jun Vincent Sanchez    — jvsanchez1103@gmail.com / sanchez1234
--   (Jamaico Becbec was in seed as bec.bec@rcccoop.com — see #22)
--
-- Kim Rizon (husband of Ma Christine, #25) already has a seed account
-- at kim.rizon@rcccoop.com — collect his personal email separately.
-- ============================================================

-- Helper: updates both auth.users and auth.identities in one go
-- Run each block below one name at a time, or all at once.

-- ------------------------------------------------------------------
-- 1. Sheila Mae Fuentes  (shela.fuentes@rcccoop.com)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'sheilamaefuentes61@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'shela.fuentes@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"sheilamaefuentes61@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'shela.fuentes@rcccoop.com';

-- ------------------------------------------------------------------
-- 2. Jessamer Apostol  (jessamier.apostol@rcccoop.com)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'apostoljessa535@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'jessamier.apostol@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"apostoljessa535@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'jessamier.apostol@rcccoop.com';

-- ------------------------------------------------------------------
-- 3. Reymart Amaro Rosales  (reymart.rosales@rcccoop.com)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'reymartrosales120199@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'reymart.rosales@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"reymartrosales120199@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'reymart.rosales@rcccoop.com';

-- ------------------------------------------------------------------
-- 4. Rommel E. Generalao  (romel.generalao@rcccoop.com)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'rommelgeneralao442@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'romel.generalao@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"rommelgeneralao442@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'romel.generalao@rcccoop.com';

-- ------------------------------------------------------------------
-- 5. Rowena Baluyot  (rowena.suello@rcccoop.com)
--    Confirmed: same person. Also update display name in members table.
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'rowenabaluyot532@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'rowena.suello@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"rowenabaluyot532@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'rowena.suello@rcccoop.com';

-- Update her name in the members table (seed had "Suello"; confirmed last name is "Baluyot")
UPDATE public.members
SET full_name = 'Rowena S. Baluyot'
WHERE full_name ILIKE '%rowena%suello%';

-- ------------------------------------------------------------------
-- 6. Cheeny T. Lobiano  (chine.lobiano@rcccoop.com)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'cheenytrinidad54@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'chine.lobiano@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"cheenytrinidad54@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'chine.lobiano@rcccoop.com';

-- ------------------------------------------------------------------
-- 7. Rochelle Sanchez  (rutchele.sanchez@rcccoop.com)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'rochellesanchez33@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'rutchele.sanchez@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"rochellesanchez33@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'rutchele.sanchez@rcccoop.com';

-- ------------------------------------------------------------------
-- 8. Lucas L. Garga  (lucas.garga@rcccoop.com)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'caimer_cj@yahoo.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'lucas.garga@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"caimer_cj@yahoo.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'lucas.garga@rcccoop.com';

-- ------------------------------------------------------------------
-- 9. Brian Barraca  (brian.barraca@rcccoop.com)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'brianbarraca@yahoo.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'brian.barraca@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"brianbarraca@yahoo.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'brian.barraca@rcccoop.com';

-- ------------------------------------------------------------------
-- 10. Kimberly Kay S. Magallon  (kimberly.magallon@rcccoop.com)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'saysonmagallonkay@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'kimberly.magallon@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"saysonmagallonkay@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'kimberly.magallon@rcccoop.com';

-- ------------------------------------------------------------------
-- 11. Jay Arganza  (jay.arganza@rcccoop.com)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'jinemalinaw@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'jay.arganza@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"jinemalinaw@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'jay.arganza@rcccoop.com';

-- ------------------------------------------------------------------
-- 12. Jordan Carulasan  (jordan.carulasan@rcccoop.com)
--     Confirmed: jordangilbertcarulasan@gmail.com (typo "gmaill.com" corrected)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'jordangilbertcarulasan@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'jordan.carulasan@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"jordangilbertcarulasan@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'jordan.carulasan@rcccoop.com';

-- ------------------------------------------------------------------
-- 13. Ma. Cleofe Baoy Plotenia  (plotenia.macleofe@rcccoop.com)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'baoy_cleofe@yahoo.com.ph', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'plotenia.macleofe@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"baoy_cleofe@yahoo.com.ph"'), updated_at = NOW()
WHERE identity_data->>'email' = 'plotenia.macleofe@rcccoop.com';

-- ------------------------------------------------------------------
-- 14. Nimfa Elustrisimo — NEW MEMBER (no SQL update needed here)
--     Confirmed: NOT the same as Edielone Elustrisimo.
--     Nimfa is a brand-new member who does not yet have an account.
--
--     To add Nimfa:
--       1. Create her member record in Admin → Members.
--       2. Create her auth account in Supabase Dashboard → Authentication → Users
--          (or via Admin → User Accounts → "Add" flow once built).
--       3. Her personal email: elustrisimonimfa@gmail.com
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
-- 15. Charlie B. Bicbic  (charlie.bicbic@rcccoop.com)
--     Confirmed email: charliebicbice@gmail.com (original submission was missing @)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'charliebicbice@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'charlie.bicbic@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"charliebicbice@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'charlie.bicbic@rcccoop.com';

-- ------------------------------------------------------------------
-- 16. Kim Abordonado  (kimrider.abordonado@rcccoop.com)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'kabordonadopcl@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'kimrider.abordonado@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"kabordonadopcl@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'kimrider.abordonado@rcccoop.com';

-- ------------------------------------------------------------------
-- 17. Maria Risa Batayola  (mariza.batayola@rcccoop.com)
--     Confirmed: same person as "Mariza Batayola" in seed
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'marissabatayola.42@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'mariza.batayola@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"marissabatayola.42@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'mariza.batayola@rcccoop.com';

-- ------------------------------------------------------------------
-- 18. Analie H. Autor  (analie.autor@rcccoop.com)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'alitautor@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'analie.autor@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"alitautor@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'analie.autor@rcccoop.com';

-- ------------------------------------------------------------------
-- 19. Virgilia Bacus Arobo  (virgillia.bacus@rcccoop.com)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'ella.ahongs@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'virgillia.bacus@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"ella.ahongs@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'virgillia.bacus@rcccoop.com';

-- ------------------------------------------------------------------
-- 20. Mariah Jean Panit Bacus  (megan.bacus@rcccoop.com)
--     Confirmed: same person as "Megan Bacus" in seed
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'bacusmariahjean@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'megan.bacus@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"bacusmariahjean@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'megan.bacus@rcccoop.com';

-- ------------------------------------------------------------------
-- 21. Wilson T. Castañeda  (wilson.castaneda@rcccoop.com)
--     Confirmed email: castanedawilson944@gmail.com
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'castanedawilson944@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'wilson.castaneda@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"castanedawilson944@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'wilson.castaneda@rcccoop.com';

-- ------------------------------------------------------------------
-- 22. Jamaico "Maico" Becbec  (bec.bec@rcccoop.com)
--     Seed stored his name as "Bec Micho Bec" — same person
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'maicobecbec@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'bec.bec@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"maicobecbec@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'bec.bec@rcccoop.com';

-- ------------------------------------------------------------------
-- 23. Renato C. Mangonlay  (renato.mangunlay@rcccoop.com)
--     Confirmed: same person as "Renato Mangunlay" in seed (spelling variant)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'mangonlayrenato3@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'renato.mangunlay@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"mangonlayrenato3@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'renato.mangunlay@rcccoop.com';

-- ------------------------------------------------------------------
-- 24. Ralfie A. Montalban  (ralfie.montalban@rcccoop.com)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'ralfiemontalban@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'ralfie.montalban@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"ralfiemontalban@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'ralfie.montalban@rcccoop.com';

-- ------------------------------------------------------------------
-- 25. Ma. Christine Baoy Rizon  (baoy.macristine@rcccoop.com)
--     Confirmed: seed has "Baoy Ma.Cristine" — same person (maiden name Baoy).
--     NOTE: "Kim Rizon" in seed is her HUSBAND — he is a NEW member.
--     Kim Rizon's account must be created separately (no SQL here for Kim).
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'machristinerizon@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'baoy.macristine@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"machristinerizon@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'baoy.macristine@rcccoop.com';

-- ------------------------------------------------------------------
-- 26. Jhomar Abellana  (jomar.abellana@rcccoop.com)
--     Seed has "Jomar Abellana" — same person, minor name variant
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'jhomarabellana1@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'jomar.abellana@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"jhomarabellana1@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'jomar.abellana@rcccoop.com';

-- ------------------------------------------------------------------
-- 27. Marife Las Eras  (eras.las@rcccoop.com)
--     Confirmed. Seed stores name as "Eras Marife Las" — same person.
--     (Full name may also include "Elustrisimo" — update member record if needed)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'marifelaseras90@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'eras.las@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"marifelaseras90@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'eras.las@rcccoop.com';

-- ==================================================================
-- NEW MEMBER ACCOUNTS
-- Creates auth user + member record + profile for members who have
-- no existing seed account. Run after the email updates above.
-- ==================================================================

-- ------------------------------------------------------------------
-- NEW-1. Nimfa Elustrisimo  (new member — no prior account)
--        Password: elustrisimo1234  |  first_login = true
--        Safe to re-run: skips INSERT if account already exists.
-- ------------------------------------------------------------------
DO $$
DECLARE
  v_user_id   uuid;
  v_member_id uuid;
BEGIN
  -- Find existing user (account may already have been created)
  SELECT id INTO v_user_id FROM auth.users WHERE email = 'elustrisimonimfa@gmail.com';

  IF v_user_id IS NULL THEN
    -- Create auth account only if it doesn't exist yet
    v_user_id := gen_random_uuid();
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password,
      email_confirmed_at, created_at, updated_at,
      raw_app_meta_data, raw_user_meta_data, is_super_admin,
      confirmation_token, email_change, email_change_token_new, recovery_token
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', v_user_id,
      'authenticated', 'authenticated',
      'elustrisimonimfa@gmail.com', crypt('elustrisimo1234', gen_salt('bf')),
      NOW(), NOW(), NOW(),
      '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''
    );

    INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
    VALUES (
      v_user_id, v_user_id, v_user_id,
      jsonb_build_object(
        'sub', v_user_id::text,
        'email', 'elustrisimonimfa@gmail.com',
        'email_verified', false,
        'phone_verified', false
      ),
      'email', NOW(), NOW()
    );
  END IF;

  -- Create member record if not already there
  SELECT id INTO v_member_id FROM public.members WHERE full_name ILIKE '%nimfa%elustrisimo%';
  IF v_member_id IS NULL THEN
    v_member_id := gen_random_uuid();
    INSERT INTO public.members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
    VALUES (v_member_id, 'Nimfa Elustrisimo', 'regular', 'associate_member', CURRENT_DATE, 'active', 0);
  END IF;

  -- Link profile (upsert)
  INSERT INTO public.profiles (id, member_id, role, display_name, first_login)
  VALUES (v_user_id, v_member_id, 'member', 'Nimfa Elustrisimo', true)
  ON CONFLICT (id) DO UPDATE SET
    member_id    = EXCLUDED.member_id,
    role         = EXCLUDED.role,
    display_name = EXCLUDED.display_name,
    first_login  = EXCLUDED.first_login;
END $$;

-- (Jamaico Becbec handled in #22 above — seed account was bec.bec@rcccoop.com)

-- ------------------------------------------------------------------
-- NEW-2. Jun Vincent "JV" Sanchez  (new member — no prior account)
--        Password: sanchez1234  |  first_login = true
--        Safe to re-run: skips INSERT if account already exists.
-- ------------------------------------------------------------------
DO $$
DECLARE
  v_user_id   uuid;
  v_member_id uuid;
BEGIN
  SELECT id INTO v_user_id FROM auth.users WHERE email = 'jvsanchez1103@gmail.com';

  IF v_user_id IS NULL THEN
    v_user_id := gen_random_uuid();
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password,
      email_confirmed_at, created_at, updated_at,
      raw_app_meta_data, raw_user_meta_data, is_super_admin,
      confirmation_token, email_change, email_change_token_new, recovery_token
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', v_user_id,
      'authenticated', 'authenticated',
      'jvsanchez1103@gmail.com', crypt('sanchez1234', gen_salt('bf')),
      NOW(), NOW(), NOW(),
      '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''
    );

    INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
    VALUES (
      v_user_id, v_user_id, v_user_id,
      jsonb_build_object(
        'sub', v_user_id::text,
        'email', 'jvsanchez1103@gmail.com',
        'email_verified', false,
        'phone_verified', false
      ),
      'email', NOW(), NOW()
    );
  END IF;

  SELECT id INTO v_member_id FROM public.members WHERE full_name ILIKE '%jun vincent%sanchez%';
  IF v_member_id IS NULL THEN
    v_member_id := gen_random_uuid();
    INSERT INTO public.members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
    VALUES (v_member_id, 'Jun Vincent Sanchez', 'regular', 'regular_member', CURRENT_DATE, 'active', 0);
  END IF;

  INSERT INTO public.profiles (id, member_id, role, display_name, first_login)
  VALUES (v_user_id, v_member_id, 'member', 'Jun Vincent Sanchez', true)
  ON CONFLICT (id) DO UPDATE SET
    member_id    = EXCLUDED.member_id,
    role         = EXCLUDED.role,
    display_name = EXCLUDED.display_name,
    first_login  = EXCLUDED.first_login;
END $$;

-- ------------------------------------------------------------------
-- 28. Edielone Elustrisimo  (edielone.elustrisimo@rcccoop.com)
--     Confirmed email: edieloneelustrisimo@gmail.com
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'edieloneelustrisimo@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'edielone.elustrisimo@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"edieloneelustrisimo@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'edielone.elustrisimo@rcccoop.com';

-- ------------------------------------------------------------------
-- 29. Sofia Faith J. Layug  (sofia.layug@rcccoop.com)
--     Seed has "Sofia Layug" — same person
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'sofiafaithlayug77@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'sofia.layug@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"sofiafaithlayug77@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'sofia.layug@rcccoop.com';

-- ------------------------------------------------------------------
-- 30. Rhonvic Delegencia Sanchez  (rhonvic.sanchez@rcccoop.com)
--     Seed has "Rhonvic Sanchez" — same person
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'rhonvic123@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'rhonvic.sanchez@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"rhonvic123@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'rhonvic.sanchez@rcccoop.com';

-- ------------------------------------------------------------------
-- 31. Anthony Jose  (anthony.jose@rcccoop.com)
--     Email change + role promotion to admin
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'jjnoname@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'anthony.jose@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"jjnoname@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'anthony.jose@rcccoop.com';

UPDATE public.profiles
SET role = 'admin'
WHERE id = (SELECT id FROM auth.users WHERE email = 'jjnoname@gmail.com');

-- ------------------------------------------------------------------
-- 32. Edgardo Judico  (edgardo.judico@rcccoop.com)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'edgardojudico@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'edgardo.judico@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"edgardojudico@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'edgardo.judico@rcccoop.com';

-- ------------------------------------------------------------------
-- 33. Cirila Jorolan  (cerela.jorulan@rcccoop.com)
--     Confirmed name: Cirila Jorolan (seed had "Cerela Jorulan")
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'cirilajorolan@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'cerela.jorulan@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"cirilajorolan@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'cerela.jorulan@rcccoop.com';

-- ------------------------------------------------------------------
-- 34. Maria Rosario Sagarino  (maria.gonzales@rcccoop.com)
--     Confirmed: same person as "Maria Gonzales" in seed — update name too
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'mariarosariozagarino@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'maria.gonzales@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"mariarosariozagarino@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'maria.gonzales@rcccoop.com';

UPDATE public.members
SET full_name = 'Maria Rosario Sagarino'
WHERE full_name ILIKE '%maria%gonzales%';

-- ------------------------------------------------------------------
-- 35. Roselyn Amit  (roselyn.amit@rcccoop.com)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'amitroselyn34@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'roselyn.amit@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"amitroselyn34@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'roselyn.amit@rcccoop.com';

-- ------------------------------------------------------------------
-- 36. Marilyn Amit  (marilyn.amit@rcccoop.com)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'marilynamit9@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'marilyn.amit@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"marilynamit9@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'marilyn.amit@rcccoop.com';

-- ------------------------------------------------------------------
-- 37. Liberata Canacao  (liberata.canacao@rcccoop.com)
--     NOTE: Wilfredo Canacao submitted the same email — collect a
--     separate address for Wilfredo before updating his account.
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'acting.canacao@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'liberata.canacao@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"acting.canacao@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'liberata.canacao@rcccoop.com';

-- ------------------------------------------------------------------
-- 38. Myrna Almocera  (myrna.almocera@rcccoop.com)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'solissheenarose@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'myrna.almocera@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"solissheenarose@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'myrna.almocera@rcccoop.com';

-- ------------------------------------------------------------------
-- 39. Rogelito Salvo  (rogelito.salvo@rcccoop.com)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'salvojhon6@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'rogelito.salvo@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"salvojhon6@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'rogelito.salvo@rcccoop.com';

-- ------------------------------------------------------------------
-- 40. Mary Rose Gonzales  (mary.gonzales@rcccoop.com)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'gonzalesmaryrose42@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'mary.gonzales@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"gonzalesmaryrose42@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'mary.gonzales@rcccoop.com';

-- ------------------------------------------------------------------
-- 41. Romeo Ramirez Jr.  (romeo.ramirez@rcccoop.com)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'romeoramirezjr26@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'romeo.ramirez@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"romeoramirezjr26@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'romeo.ramirez@rcccoop.com';

-- ------------------------------------------------------------------
-- 42. Joseph Yap Bracero  (joseph.bracero@rcccoop.com)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'josephyapbracero031947@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'joseph.bracero@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"josephyapbracero031947@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'joseph.bracero@rcccoop.com';
