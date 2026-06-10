-- ============================================================
-- RCC COOP — Remove old test account + create clean test member
-- Safe to re-run: uses IF EXISTS / ON CONFLICT guards
-- ============================================================

-- ------------------------------------------------------------------
-- STEP 1: Remove any existing "test" member + linked profile + auth account
-- (searches by full_name containing 'test', case-insensitive)
-- ------------------------------------------------------------------
DO $$
DECLARE
  v_member_id uuid;
  v_user_id   uuid;
BEGIN
  -- Find member
  SELECT id INTO v_member_id FROM public.members WHERE full_name ILIKE '%test%';

  IF v_member_id IS NOT NULL THEN
    -- Find linked profile
    SELECT id INTO v_user_id FROM public.profiles WHERE member_id = v_member_id;

    -- Remove profile
    DELETE FROM public.profiles WHERE member_id = v_member_id;

    -- Remove auth account
    IF v_user_id IS NOT NULL THEN
      DELETE FROM auth.identities WHERE user_id = v_user_id;
      DELETE FROM auth.users      WHERE id      = v_user_id;
    END IF;

    -- Remove member
    DELETE FROM public.members WHERE id = v_member_id;

    RAISE NOTICE 'Deleted test member (member_id: %, user_id: %)', v_member_id, v_user_id;
  ELSE
    RAISE NOTICE 'No test member found — skipping delete.';
  END IF;
END $$;

-- ------------------------------------------------------------------
-- STEP 2: Create a fresh test member account
--   Name:     Test Member
--   Email:    testmember@rcccoop.com
--   Password: testmember1234
--   Role:     member
-- ------------------------------------------------------------------
DO $$
DECLARE
  v_user_id   uuid;
  v_member_id uuid;
BEGIN
  -- Skip if account already exists
  SELECT id INTO v_user_id FROM auth.users WHERE email = 'testmember@rcccoop.com';

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
      'testmember@rcccoop.com', crypt('testmember1234', gen_salt('bf')),
      NOW(), NOW(), NOW(),
      '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', ''
    );

    INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
    VALUES (
      v_user_id, v_user_id, v_user_id,
      jsonb_build_object(
        'sub', v_user_id::text,
        'email', 'testmember@rcccoop.com',
        'email_verified', false,
        'phone_verified', false
      ),
      'email', NOW(), NOW()
    );
  END IF;

  -- Create member record
  SELECT id INTO v_member_id FROM public.members WHERE full_name = 'Test Member';
  IF v_member_id IS NULL THEN
    v_member_id := gen_random_uuid();
    INSERT INTO public.members (id, full_name, first_name, last_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
    VALUES (v_member_id, 'Test Member', 'Test', 'Member', 'regular', 'regular_member', CURRENT_DATE, 'active', 0);
  END IF;

  -- Link profile (trigger creates the row on signup; use upsert here for safety)
  INSERT INTO public.profiles (id, member_id, role, display_name, email, first_login)
  VALUES (v_user_id, v_member_id, 'member', 'Test Member', 'testmember@rcccoop.com', false)
  ON CONFLICT (id) DO UPDATE SET
    member_id    = EXCLUDED.member_id,
    role         = EXCLUDED.role,
    display_name = EXCLUDED.display_name,
    email        = EXCLUDED.email,
    first_login  = EXCLUDED.first_login;

  RAISE NOTICE 'Test member ready — email: testmember@rcccoop.com / password: testmember1234';
END $$;
