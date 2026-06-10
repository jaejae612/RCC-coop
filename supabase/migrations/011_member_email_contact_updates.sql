-- ============================================================
-- RCC COOP — Member email + contact number updates (batch 2)
-- Members: Rosalinda Catamisan, Agosta Tibor Gabriel,
--          Jovie Antonette Uy Kanchanapairoj, Haydee Bacalso Dela Victoria
-- ============================================================

-- ------------------------------------------------------------------
-- 1. Rosalinda Catam-Isan
--    Email: rosalindacatamisan1@gmail.com | Cell: 09664978697
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'rosalindacatamisan1@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'rosalinda.catamisan@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"rosalindacatamisan1@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'rosalinda.catamisan@rcccoop.com';

UPDATE public.members
SET email          = 'rosalindacatamisan1@gmail.com',
    contact_number = '09664978697'
WHERE id = 'a9af5466-0be0-4bc5-a8c7-39c8fc990822';

UPDATE public.profiles
SET email = 'rosalindacatamisan1@gmail.com'
WHERE id = '26b5ef41-613c-40ee-a00b-b20c522b487d';

-- ------------------------------------------------------------------
-- 2. Agosta Tibor Gabriel  (seed stored as "Agosta Gabriel")
--    Email: agostagabriel789@gmail.com | Cell: 09917738853
--    Full name updated to include middle name Tibor
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'agostagabriel789@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'agosta.gabriel@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"agostagabriel789@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'agosta.gabriel@rcccoop.com';

UPDATE public.members
SET email          = 'agostagabriel789@gmail.com',
    contact_number = '09917738853',
    full_name      = 'Agosta Tibor Gabriel',
    first_name     = 'Agosta',
    last_name      = 'Gabriel'
WHERE id = 'b9f1a998-746e-4893-951f-ae0acb779de9';

UPDATE public.profiles
SET email        = 'agostagabriel789@gmail.com',
    display_name = 'Agosta Tibor Gabriel'
WHERE id = 'e4d43305-f29c-448c-8dc7-e2058fc66688';

-- ------------------------------------------------------------------
-- 3. Jovie Antonette Uy Kanchanapairoj
--    Seed stored as "Kanchanampairoj Jovie" (wrong order + spelling)
--    Email: jovie_uy@yahoo.com | Cell: 09778456788 (+63 977 845 6788)
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'jovie_uy@yahoo.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'kanchanampairoj.jovie@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"jovie_uy@yahoo.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'kanchanampairoj.jovie@rcccoop.com';

UPDATE public.members
SET email          = 'jovie_uy@yahoo.com',
    contact_number = '09778456788',
    full_name      = 'Jovie Antonette Uy Kanchanapairoj',
    first_name     = 'Jovie',
    last_name      = 'Kanchanapairoj'
WHERE id = '5e9459d0-7ced-4679-bb76-524c0d540413';

UPDATE public.profiles
SET email        = 'jovie_uy@yahoo.com',
    display_name = 'Jovie Antonette Uy Kanchanapairoj'
WHERE id = 'f5dd11f0-c69d-4995-8ad6-ff8091f93c16';

-- ------------------------------------------------------------------
-- 4. Haydee Bacalso Dela Victoria  (seed stored as "Haydee Delavictoria")
--    Email: haydeeash152@gmail.com | Cell: 09945814772
-- ------------------------------------------------------------------
UPDATE auth.users
SET email = 'haydeeash152@gmail.com', email_confirmed_at = NOW(), updated_at = NOW()
WHERE email = 'haydee.delavictoria@rcccoop.com';

UPDATE auth.identities
SET identity_data = jsonb_set(identity_data, '{email}', '"haydeeash152@gmail.com"'), updated_at = NOW()
WHERE identity_data->>'email' = 'haydee.delavictoria@rcccoop.com';

UPDATE public.members
SET email          = 'haydeeash152@gmail.com',
    contact_number = '09945814772',
    full_name      = 'Haydee Bacalso Dela Victoria',
    first_name     = 'Haydee',
    last_name      = 'Dela Victoria'
WHERE id = '24c5ebe1-9831-4888-9f5a-5bc9b06d7efa';

UPDATE public.profiles
SET email        = 'haydeeash152@gmail.com',
    display_name = 'Haydee Bacalso Dela Victoria'
WHERE id = '7cbc8b7f-f22e-4335-a639-1f2e38e9a7c9';
