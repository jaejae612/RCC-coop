-- ============================================================
-- RCC COOP - Seed Data (April 2026 Excel records)
-- Run AFTER 001_initial_schema.sql in Supabase SQL Editor
--
-- IMPORTANT: Before running, disable email confirmation in
-- Supabase Dashboard > Authentication > Settings:
--   Toggle OFF: Enable email confirmations
-- ============================================================

CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Auth Users
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '9f9da6ae-da26-40ac-9e42-0e80b5a5e561', 'authenticated', 'authenticated', 'mariza.abellana@rcccoop.com', crypt('abellana1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '681a62bd-16f3-4f9a-8948-1dfc46244cdd', 'authenticated', 'authenticated', 'jomar.abellana@rcccoop.com', crypt('abellana1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '995223c1-dbf5-46af-b412-825ae2d10b4a', 'authenticated', 'authenticated', 'renato.abais@rcccoop.com', crypt('abais1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '96519b64-132c-4b10-bb33-a41be56f1161', 'authenticated', 'authenticated', 'john.abayan@rcccoop.com', crypt('abayan1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'ccf153bb-17c5-4747-aae4-ad624003b581', 'authenticated', 'authenticated', 'jay.arganza@rcccoop.com', crypt('arganza1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '877cceaa-9fd9-46d3-98d7-10aec6980401', 'authenticated', 'authenticated', 'kimrider.abordonado@rcccoop.com', crypt('abordonado1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '28805271-89af-4c97-bcd0-fe3109a1f451', 'authenticated', 'authenticated', 'myrna.almocera@rcccoop.com', crypt('almocera1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '4f1ef5c1-84fb-4339-b252-10d931f8bced', 'authenticated', 'authenticated', 'marlon.anon@rcccoop.com', crypt('anon1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'd1b869a0-7986-4394-be54-94c71b14162a', 'authenticated', 'authenticated', 'roselyn.amit@rcccoop.com', crypt('amit1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '68561fa3-56d4-4504-8817-4b2e5496dce0', 'authenticated', 'authenticated', 'marilyn.amit@rcccoop.com', crypt('amit1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '565ccea3-83e4-4658-b091-03899ef2bbed', 'authenticated', 'authenticated', 'cristiane.apostol@rcccoop.com', crypt('apostol1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '8db7b6b3-6a21-4d69-bc59-735b55ba7008', 'authenticated', 'authenticated', 'jessamier.apostol@rcccoop.com', crypt('apostol1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'e0090aed-2dcf-4fff-84cf-330432a331dc', 'authenticated', 'authenticated', 'analie.autor@rcccoop.com', crypt('autor1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '38eae22a-37c0-49fc-94e9-9ffe7a21da3e', 'authenticated', 'authenticated', 'jeorge.bahian@rcccoop.com', crypt('bahian1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '37e6c6fc-4022-4df0-83c6-1ae672d07105', 'authenticated', 'authenticated', 'megan.bacus@rcccoop.com', crypt('bacus1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'ecea2ecc-53a2-4722-a6b5-323b87262be3', 'authenticated', 'authenticated', 'virgillia.bacus@rcccoop.com', crypt('bacus1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'cc9b7eea-7e0c-4872-bfe8-e737cc4f732a', 'authenticated', 'authenticated', 'reymond.banguiran@rcccoop.com', crypt('banguiran1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'b15f38c2-73d5-4013-b542-7b250ebbef0f', 'authenticated', 'authenticated', 'baoy.ester@rcccoop.com', crypt('ester1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '71713857-6fcc-4807-8697-f178e19f8e74', 'authenticated', 'authenticated', 'baoy.macristine@rcccoop.com', crypt('macristine1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '28e4ff31-f061-4f10-8010-f9ff86537a48', 'authenticated', 'authenticated', 'mariza.batayola@rcccoop.com', crypt('batayola1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '634e1bd9-ab12-46fe-99ae-e3945bc2ae29', 'authenticated', 'authenticated', 'charlie.bicbic@rcccoop.com', crypt('bicbic1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '2a5d8329-dce2-4c81-8ed7-93448a9c92ab', 'authenticated', 'authenticated', 'bec.bec@rcccoop.com', crypt('bec1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'e9215ec7-3f43-4fec-9f15-f336c75518ab', 'authenticated', 'authenticated', 'brian.barraca@rcccoop.com', crypt('barraca1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '539426c0-66c2-4701-94df-07357c25248d', 'authenticated', 'authenticated', 'joseph.bracero@rcccoop.com', crypt('bracero1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'f20dc9e0-8a60-4f9e-914e-dcd6921c19c4', 'authenticated', 'authenticated', 'lea.buenaconsejo@rcccoop.com', crypt('buenaconsejo1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '0a145a52-1385-4388-9193-cd0dd895a3b3', 'authenticated', 'authenticated', 'liberata.canacao@rcccoop.com', crypt('canacao1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '78a6503c-bcd2-4b5f-90ed-a8900df03e6b', 'authenticated', 'authenticated', 'wilfredo.canacao@rcccoop.com', crypt('canacao1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'aa78659e-ac8b-4e4b-aafa-5f7701d019ad', 'authenticated', 'authenticated', 'irishel.caete@rcccoop.com', crypt('caete1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '7cf5178e-e62a-4395-8cb7-2b6e01ae9bc4', 'authenticated', 'authenticated', 'jordan.carulasan@rcccoop.com', crypt('carulasan1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a572d81b-1571-456a-9d17-04e197688da2', 'authenticated', 'authenticated', 'wilson.castaneda@rcccoop.com', crypt('castaneda1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '26b5ef41-613c-40ee-a00b-b20c522b487d', 'authenticated', 'authenticated', 'rosalinda.catamisan@rcccoop.com', crypt('catamisan1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '350fe3b7-8a20-4b66-9915-7e7b3becaa6d', 'authenticated', 'authenticated', 'monico.catulong@rcccoop.com', crypt('catulong1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '848207ba-3a15-4406-86cb-fc5274d47023', 'authenticated', 'authenticated', 'corazon.cuizon@rcccoop.com', crypt('cuizon1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '4877d859-f6ae-4d38-bd32-ccdf95e9382f', 'authenticated', 'authenticated', 'benzon.delavictoria@rcccoop.com', crypt('delavictoria1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '22abbf52-31d7-4566-9384-87aa6f6d5ec5', 'authenticated', 'authenticated', 'edielone.elustrisimo@rcccoop.com', crypt('elustrisimo1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '7cbc8b7f-f22e-4335-a639-1f2e38e9a7c9', 'authenticated', 'authenticated', 'haydee.delavictoria@rcccoop.com', crypt('delavictoria1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'df76bb73-1227-4107-87f2-538caec0f5ee', 'authenticated', 'authenticated', 'olivertransfer.fernandez@rcccoop.com', crypt('fernandez1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '7e9fac36-b0ee-415a-8ae4-7c220941ff2f', 'authenticated', 'authenticated', 'dino.huerti@rcccoop.com', crypt('huerti1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'eaa35825-b80b-4d15-ac71-49f9d452c83d', 'authenticated', 'authenticated', 'shela.fuentes@rcccoop.com', crypt('fuentes1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '595ee36c-c09d-419d-aa37-c8263a95b952', 'authenticated', 'authenticated', 'lucas.garga@rcccoop.com', crypt('garga1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'e4d43305-f29c-448c-8dc7-e2058fc66688', 'authenticated', 'authenticated', 'agosta.gabriel@rcccoop.com', crypt('gabriel1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '8700e8ee-2263-47d1-adb1-8136ad3aa23c', 'authenticated', 'authenticated', 'maria.gonzales@rcccoop.com', crypt('gonzales1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '03814ffe-8f60-45f0-a021-1a3fde0fb045', 'authenticated', 'authenticated', 'romel.generalao@rcccoop.com', crypt('generalao1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'ea7b1e3c-7af7-4adb-b9c5-00452c39456f', 'authenticated', 'authenticated', 'kevin.illustrisimo@rcccoop.com', crypt('illustrisimo1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a0ee8655-ed78-4a36-a80a-c7469da81995', 'authenticated', 'authenticated', 'jurienathaniel.filipinas@rcccoop.com', crypt('filipinas1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'eb899683-3f82-4e8e-bfb7-61d2c5bec08d', 'authenticated', 'authenticated', 'cerela.jorulan@rcccoop.com', crypt('jorulan1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '17358009-3eae-47fe-a37d-928816fc5f76', 'authenticated', 'authenticated', 'edgardo.judico@rcccoop.com', crypt('judico1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '989dae0e-af24-48b0-95d7-cda9a3650dbc', 'authenticated', 'authenticated', 'as.jumao@rcccoop.com', crypt('jumao1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '2f741529-1c4b-489b-a489-93095de108e4', 'authenticated', 'authenticated', 'as.jumao2@rcccoop.com', crypt('jumao1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'f5dd11f0-c69d-4995-8ad6-ff8091f93c16', 'authenticated', 'authenticated', 'kanchanampairoj.jovie@rcccoop.com', crypt('jovie1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'eb02fbb0-c07c-4fc8-8c97-f8c334591026', 'authenticated', 'authenticated', 'eras.las@rcccoop.com', crypt('las1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '1daa07f2-4fdc-460c-aed8-3f0b0576b101', 'authenticated', 'authenticated', 'grethel.laude@rcccoop.com', crypt('laude1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '6a1c3120-3de8-4ed6-aaec-b8d97fd83cef', 'authenticated', 'authenticated', 'sofia.layug@rcccoop.com', crypt('layug1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '2de9d47f-f742-4652-86b9-d9316e60ad6e', 'authenticated', 'authenticated', 'joselyn.leong@rcccoop.com', crypt('leong1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '15cac695-7a70-4356-858d-14728d10f089', 'authenticated', 'authenticated', 'ryan.llaxamana@rcccoop.com', crypt('llaxamana1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '7640ccf7-c726-4361-9889-d2559c554205', 'authenticated', 'authenticated', 'rene.mariano@rcccoop.com', crypt('mariano1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '62347c07-aa20-48b9-a714-c058e7325c0e', 'authenticated', 'authenticated', 'ralfie.montalban@rcccoop.com', crypt('montalban1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '9cfd5646-18ed-4644-a73e-371430e5e8f8', 'authenticated', 'authenticated', 'mc.liong@rcccoop.com', crypt('liong1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a1adf861-2059-45fb-b901-6450d0f46756', 'authenticated', 'authenticated', 'renato.mangunlay@rcccoop.com', crypt('mangunlay1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'b901d6a4-5675-4168-af37-84da3f26aebf', 'authenticated', 'authenticated', 'ratchell.nillama@rcccoop.com', crypt('nillama1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '38ff8a05-22df-4ee5-9bb7-7f0d7d402b2d', 'authenticated', 'authenticated', 'ronald.napulis@rcccoop.com', crypt('napulis1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'd2566860-6b31-4c17-a02a-9f439a55e614', 'authenticated', 'authenticated', 'mirasol.pancito@rcccoop.com', crypt('pancito1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '0295af7f-7104-4079-87c6-9885cce22023', 'authenticated', 'authenticated', 'cristopher.patatag@rcccoop.com', crypt('patatag1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '8ad8f6b3-e6ff-43a5-83a6-aa09dcad5cf7', 'authenticated', 'authenticated', 'alex.pioquinto@rcccoop.com', crypt('pioquinto1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '594c094e-704f-4dbc-812b-03cb2a1f5421', 'authenticated', 'authenticated', 'pastor.plotenia@rcccoop.com', crypt('plotenia1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '11b4356e-318d-45cb-a676-14c353081760', 'authenticated', 'authenticated', 'plotenia.macleofe@rcccoop.com', crypt('macleofe1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '895d0b34-822c-4c34-a413-4a1371169397', 'authenticated', 'authenticated', 'romeo.ramirez@rcccoop.com', crypt('ramirez1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '4c18f4d3-b040-482b-a853-f95ab1058c53', 'authenticated', 'authenticated', 'reymart.rosales@rcccoop.com', crypt('rosales1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '13ddac08-c130-480a-82eb-c3dd51247fbd', 'authenticated', 'authenticated', 'kim.rizon@rcccoop.com', crypt('rizon1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'f6d7e324-d3c5-48d9-8a02-44cddaba48c8', 'authenticated', 'authenticated', 'juveline.sagolili@rcccoop.com', crypt('sagolili1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'd944f819-635e-4955-9b1d-89d06915a4e6', 'authenticated', 'authenticated', 'alexander.salazar@rcccoop.com', crypt('salazar1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'c37fb9e1-650f-48da-a443-21ebd8ad813e', 'authenticated', 'authenticated', 'emmanuel.sanchez@rcccoop.com', crypt('sanchez1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'ab0fec15-df7e-404f-9836-f36198b4d20f', 'authenticated', 'authenticated', 'rhonvic.sanchez@rcccoop.com', crypt('sanchez1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a6bd7146-1517-4fbe-84ec-af1c4a04cd5c', 'authenticated', 'authenticated', 'rutchele.sanchez@rcccoop.com', crypt('sanchez1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'cf9279bb-731f-4d79-8cc4-7d1281013025', 'authenticated', 'authenticated', 'reymar.saycon@rcccoop.com', crypt('saycon1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '56ea4c4d-7978-4b31-a28d-f6d8a75f15fe', 'authenticated', 'authenticated', 'rogelito.salvo@rcccoop.com', crypt('salvo1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'd35b68e4-7870-4cbe-a32c-96ecf0153fa4', 'authenticated', 'authenticated', 'jendelh.soreneo@rcccoop.com', crypt('soreneo1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '8f1352d6-900d-451c-acab-71d23718ec18', 'authenticated', 'authenticated', 'rowena.suello@rcccoop.com', crypt('suello1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'd28bfad6-ddff-497a-aaad-965f459167b9', 'authenticated', 'authenticated', 'juneil.tikling@rcccoop.com', crypt('tikling1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '87d3ea7b-3552-4ef8-8c6a-3c412f3a4e4d', 'authenticated', 'authenticated', 'uy.joe@rcccoop.com', crypt('joe1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '2c398350-2029-47a1-a44a-6ce868e9d3d5', 'authenticated', 'authenticated', 'josie.uy@rcccoop.com', crypt('uy1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '34a5108b-27a7-4c90-90e0-a42be41095a7', 'authenticated', 'authenticated', 'anthony.jose@rcccoop.com', crypt('jose1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'f66b5457-9232-48fd-ac49-abd69832a811', 'authenticated', 'authenticated', 'dolly.yangyang@rcccoop.com', crypt('yangyang1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '309a6190-cfae-4bba-a3a7-9ab81cfbd6a1', 'authenticated', 'authenticated', 'eduarda.abella@rcccoop.com', crypt('abella1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '1d8ec0f6-c0f6-415e-bc8f-7910d39e21f6', 'authenticated', 'authenticated', 'jandelyn.abong@rcccoop.com', crypt('abong1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '123ca8ff-43c7-4764-8901-1512cbc6eebe', 'authenticated', 'authenticated', 'acabo.bonita@rcccoop.com', crypt('bonita1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '1bf67a4e-d6a4-482d-85e0-d7b40429662e', 'authenticated', 'authenticated', 'aguhob.maricel@rcccoop.com', crypt('maricel1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'ad94a179-cc62-4b48-ab4f-e0e0b1ca15ce', 'authenticated', 'authenticated', 'magdalina.alegarme@rcccoop.com', crypt('alegarme1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '728ae4e4-c298-4baa-9d0a-b8ac6f7f7261', 'authenticated', 'authenticated', 'mabel.alegarme@rcccoop.com', crypt('alegarme1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'adb23736-8e4a-49c6-b2dc-abfd101a34d6', 'authenticated', 'authenticated', 'lanie.albon@rcccoop.com', crypt('albon1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '2b14ca6e-3078-4f9b-8f63-8a1bda21ba1b', 'authenticated', 'authenticated', 'almario.mikel@rcccoop.com', crypt('mikel1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'c5eee7f5-5d2d-4c0f-a5cf-07afdff4e33e', 'authenticated', 'authenticated', 'suzettesis.anodan@rcccoop.com', crypt('anodan1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a9a79186-a203-41f2-8b7e-f834a2bbeba9', 'authenticated', 'authenticated', 'alma.asenjo@rcccoop.com', crypt('asenjo1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'e7965cb1-48a7-415a-a742-6ad96a645d15', 'authenticated', 'authenticated', 'judy.bagasbas@rcccoop.com', crypt('bagasbas1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '5d3a9f43-0864-4ed5-a448-231d6b3fbaee', 'authenticated', 'authenticated', 'ericson.baoy@rcccoop.com', crypt('baoy1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'e55ceba9-84c7-4a55-96d9-0352e823977a', 'authenticated', 'authenticated', 'florencio.baraya@rcccoop.com', crypt('baraya1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '68d33d21-3979-4e45-8e38-64d8ce508eb5', 'authenticated', 'authenticated', 'gladwin.caballa@rcccoop.com', crypt('caballa1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '50f658ef-5ed9-496e-aa92-21b44e4f253c', 'authenticated', 'authenticated', 'dianne.cuarez@rcccoop.com', crypt('cuarez1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'e68401d7-86f3-48ff-b117-471727b0a761', 'authenticated', 'authenticated', 'reymart.calumba@rcccoop.com', crypt('calumba1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'dddcbac2-b9d0-4cfe-9e58-895e5cfd44fe', 'authenticated', 'authenticated', 'merly.dejeto@rcccoop.com', crypt('dejeto1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'b93d39a9-1890-4781-a99e-2e15cf0d7940', 'authenticated', 'authenticated', 'gabato.dante@rcccoop.com', crypt('dante1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'c93735ff-c755-434c-8a29-73b31121cd68', 'authenticated', 'authenticated', 'malonie.gabriel@rcccoop.com', crypt('gabriel1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'c247dc24-fab5-435e-805b-6c1cb88884e3', 'authenticated', 'authenticated', 'gonzaga.lito@rcccoop.com', crypt('lito1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '04449aa4-9d68-4740-8f15-ccfe4c51a555', 'authenticated', 'authenticated', 'kevin.gonzales@rcccoop.com', crypt('gonzales1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'f43322f0-138f-4a0e-bec9-c8f38257b1af', 'authenticated', 'authenticated', 'mary.gonzales@rcccoop.com', crypt('gonzales1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a4ffc224-5e7f-4364-b95e-f841a5bd6b8d', 'authenticated', 'authenticated', 'armela.halos@rcccoop.com', crypt('halos1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '72782906-84ce-4b7d-81ae-6e6cd1550ce5', 'authenticated', 'authenticated', 'michael.jorolan@rcccoop.com', crypt('jorolan1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '7d52104d-90ef-4a9b-a73a-f1a1da2e00e8', 'authenticated', 'authenticated', 'fe.inihao@rcccoop.com', crypt('inihao1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '849988ea-350f-485d-a642-a7aa91d57a1d', 'authenticated', 'authenticated', 'erlinda.kismundo@rcccoop.com', crypt('kismundo1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '0cdb9357-cbee-4d3e-885c-df6bdcf9c79b', 'authenticated', 'authenticated', 'lorena.kismundo@rcccoop.com', crypt('kismundo1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'bbf2f5a7-3587-46ab-9edb-50a21cbad6a8', 'authenticated', 'authenticated', 'ramon.kismundo@rcccoop.com', crypt('kismundo1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '2a1f8cfa-fb98-44dd-aa7c-e667b57cb810', 'authenticated', 'authenticated', 'jaime.kanchanapairoj@rcccoop.com', crypt('kanchanapairoj1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'c954ae31-88f5-4143-be6e-c62a038328a5', 'authenticated', 'authenticated', 'james.kanchanapairoj@rcccoop.com', crypt('kanchanapairoj1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'ab0080f4-543a-4018-9118-c9138143ec4f', 'authenticated', 'authenticated', 'julius.laiz@rcccoop.com', crypt('laiz1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '850e21f4-b754-40bd-9211-c96d60c29c9e', 'authenticated', 'authenticated', 'gemma.layson@rcccoop.com', crypt('layson1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '562a3ff0-3c50-4224-907b-2790c48a6fbd', 'authenticated', 'authenticated', 'chine.lobiano@rcccoop.com', crypt('lobiano1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '4ab694d4-51a9-4495-aa8a-48446763d3ff', 'authenticated', 'authenticated', 'kimberly.magallon@rcccoop.com', crypt('magallon1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '4c11955b-eaed-4710-97ad-f25e7775bb7e', 'authenticated', 'authenticated', 'miraflor.mirasol@rcccoop.com', crypt('mirasol1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'e27606d9-9be1-4042-ae64-51f895c02867', 'authenticated', 'authenticated', 'mila.mendoza@rcccoop.com', crypt('mendoza1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '799212c1-f48d-4e60-ad8d-ae0bf7436ae8', 'authenticated', 'authenticated', 'nemenio.primo@rcccoop.com', crypt('primo1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '40404ebe-ecc2-45bf-877d-7d97006255b4', 'authenticated', 'authenticated', 'agnes.nillas@rcccoop.com', crypt('nillas1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '302f68a4-ced1-434d-b3d6-7d9422696ea6', 'authenticated', 'authenticated', 'ryan.omandam@rcccoop.com', crypt('omandam1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'afc74491-d01d-4b4d-9fc9-e199b290bf75', 'authenticated', 'authenticated', 'chanelita.padin@rcccoop.com', crypt('padin1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'b41b826f-72f4-4a24-b7fc-694952455e67', 'authenticated', 'authenticated', 'helen.perales@rcccoop.com', crypt('perales1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '9db80205-c415-4b63-af54-0a4722abd775', 'authenticated', 'authenticated', 'perez.joice@rcccoop.com', crypt('joice1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '7efc9f1e-c19a-4551-a2e3-1d8c12d58ca9', 'authenticated', 'authenticated', 'eugenia.plotenia@rcccoop.com', crypt('plotenia1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '46a9a1aa-1af8-46d1-ab9d-bb3a6500dec2', 'authenticated', 'authenticated', 'rigortransfer.plando@rcccoop.com', crypt('plando1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'e93a3a46-7e24-47b9-b254-15178072bf21', 'authenticated', 'authenticated', 'mariel.quilat@rcccoop.com', crypt('quilat1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'b874dd35-f192-469c-8b7b-4c4d2b9a1128', 'authenticated', 'authenticated', 'gina.saberon@rcccoop.com', crypt('saberon1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '267f6687-797e-40db-9727-c5f5a81c63b0', 'authenticated', 'authenticated', 'sermilon.samer@rcccoop.com', crypt('samer1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '889b498e-7625-47c6-8057-27c502f377fa', 'authenticated', 'authenticated', 'shirly.sedon@rcccoop.com', crypt('sedon1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '3cb75ce7-5a10-4730-94c0-687aa988a0a3', 'authenticated', 'authenticated', 'jonie.repdos@rcccoop.com', crypt('repdos1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '54b88133-126f-4184-8fc0-9f7d20260fdc', 'authenticated', 'authenticated', 'lemuelwithdraw.sencil@rcccoop.com', crypt('sencil1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '5c79b88a-8939-45ce-89ed-b8aca84cf827', 'authenticated', 'authenticated', 'marichu.silva@rcccoop.com', crypt('silva1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'c24c39f8-8413-42a6-bc65-e0ab4d779b0c', 'authenticated', 'authenticated', 'mildred.sumampong@rcccoop.com', crypt('sumampong1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'b0417094-e8c1-482d-bda7-1c41aa03a1c3', 'authenticated', 'authenticated', 'sumampong.almae@rcccoop.com', crypt('almae1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '72781bb5-d533-4eb8-af29-2040f1ed7dca', 'authenticated', 'authenticated', 'malotis.solero@rcccoop.com', crypt('solero1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'dac5c784-ea6b-4d72-b017-4d21268bfae6', 'authenticated', 'authenticated', 'rowel.rodrigues@rcccoop.com', crypt('rodrigues1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'de7b2f22-9ab1-4975-843a-a07394b45f73', 'authenticated', 'authenticated', 'elsa.talingting@rcccoop.com', crypt('talingting1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'ff3c4585-4bb5-41d6-a1c8-e9579191a37a', 'authenticated', 'authenticated', 'marissa.tampos@rcccoop.com', crypt('tampos1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', 'a72a3538-f67b-4a52-9e96-9f059b839284', 'authenticated', 'authenticated', 'uy.vicky@rcccoop.com', crypt('vicky1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '1da83a9c-2f15-4dba-a730-8a81f1d5176b', 'authenticated', 'authenticated', 'uy.jona@rcccoop.com', crypt('jona1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');
INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, confirmation_token, email_change, email_change_token_new, recovery_token)
VALUES ('00000000-0000-0000-0000-000000000000', '06751019-b286-42bd-8df1-a304fd0d68d2', 'authenticated', 'authenticated', 'ronald.uy@rcccoop.com', crypt('uy1234', gen_salt('bf')), NOW(), NOW(), NOW(), '{"provider":"email","providers":["email"]}', '{}', false, '', '', '', '');

-- Auth Identities
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('e99baeed-28d2-4241-bb71-1c2ee86d538a', '9f9da6ae-da26-40ac-9e42-0e80b5a5e561', '9f9da6ae-da26-40ac-9e42-0e80b5a5e561', '{"sub":"9f9da6ae-da26-40ac-9e42-0e80b5a5e561","email":"mariza.abellana@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('79db05c0-f529-467f-8d22-bb645736f100', '681a62bd-16f3-4f9a-8948-1dfc46244cdd', '681a62bd-16f3-4f9a-8948-1dfc46244cdd', '{"sub":"681a62bd-16f3-4f9a-8948-1dfc46244cdd","email":"jomar.abellana@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('dbe3c25a-6ec4-4e22-9e11-6d96c1995b0c', '995223c1-dbf5-46af-b412-825ae2d10b4a', '995223c1-dbf5-46af-b412-825ae2d10b4a', '{"sub":"995223c1-dbf5-46af-b412-825ae2d10b4a","email":"renato.abais@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('ce610eb4-becb-4430-949c-6bbcc672c1bb', '96519b64-132c-4b10-bb33-a41be56f1161', '96519b64-132c-4b10-bb33-a41be56f1161', '{"sub":"96519b64-132c-4b10-bb33-a41be56f1161","email":"john.abayan@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('7d395f15-3008-4bee-ac5e-f5dccbdce2df', 'ccf153bb-17c5-4747-aae4-ad624003b581', 'ccf153bb-17c5-4747-aae4-ad624003b581', '{"sub":"ccf153bb-17c5-4747-aae4-ad624003b581","email":"jay.arganza@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('85d39623-77a8-497f-be0a-498bded7fc37', '877cceaa-9fd9-46d3-98d7-10aec6980401', '877cceaa-9fd9-46d3-98d7-10aec6980401', '{"sub":"877cceaa-9fd9-46d3-98d7-10aec6980401","email":"kimrider.abordonado@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('3f190d06-f3a8-4871-bdcd-3823cb8da879', '28805271-89af-4c97-bcd0-fe3109a1f451', '28805271-89af-4c97-bcd0-fe3109a1f451', '{"sub":"28805271-89af-4c97-bcd0-fe3109a1f451","email":"myrna.almocera@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('f7cd66d9-a6fc-455c-89ed-a0d29aff5bd4', '4f1ef5c1-84fb-4339-b252-10d931f8bced', '4f1ef5c1-84fb-4339-b252-10d931f8bced', '{"sub":"4f1ef5c1-84fb-4339-b252-10d931f8bced","email":"marlon.anon@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('1fe1438d-2496-42f3-89f2-0844ab7ff99a', 'd1b869a0-7986-4394-be54-94c71b14162a', 'd1b869a0-7986-4394-be54-94c71b14162a', '{"sub":"d1b869a0-7986-4394-be54-94c71b14162a","email":"roselyn.amit@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('a9e69cd3-73b2-4ac0-a04b-4a56de255474', '68561fa3-56d4-4504-8817-4b2e5496dce0', '68561fa3-56d4-4504-8817-4b2e5496dce0', '{"sub":"68561fa3-56d4-4504-8817-4b2e5496dce0","email":"marilyn.amit@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('56bbe21a-eb4e-4dc1-843c-6fa51d1d2c22', '565ccea3-83e4-4658-b091-03899ef2bbed', '565ccea3-83e4-4658-b091-03899ef2bbed', '{"sub":"565ccea3-83e4-4658-b091-03899ef2bbed","email":"cristiane.apostol@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('dda20214-4085-4c27-b17f-b65176b68447', '8db7b6b3-6a21-4d69-bc59-735b55ba7008', '8db7b6b3-6a21-4d69-bc59-735b55ba7008', '{"sub":"8db7b6b3-6a21-4d69-bc59-735b55ba7008","email":"jessamier.apostol@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('0c58ce80-a807-4e1a-81d3-f315e36efbbb', 'e0090aed-2dcf-4fff-84cf-330432a331dc', 'e0090aed-2dcf-4fff-84cf-330432a331dc', '{"sub":"e0090aed-2dcf-4fff-84cf-330432a331dc","email":"analie.autor@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('2639e6e7-3dab-41e4-b8c1-899e7deadadc', '38eae22a-37c0-49fc-94e9-9ffe7a21da3e', '38eae22a-37c0-49fc-94e9-9ffe7a21da3e', '{"sub":"38eae22a-37c0-49fc-94e9-9ffe7a21da3e","email":"jeorge.bahian@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('82a53318-8f2a-44ec-98c6-1dd4a0189352', '37e6c6fc-4022-4df0-83c6-1ae672d07105', '37e6c6fc-4022-4df0-83c6-1ae672d07105', '{"sub":"37e6c6fc-4022-4df0-83c6-1ae672d07105","email":"megan.bacus@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('beaa77f1-acdb-4df2-b988-eeb6ec0eb74d', 'ecea2ecc-53a2-4722-a6b5-323b87262be3', 'ecea2ecc-53a2-4722-a6b5-323b87262be3', '{"sub":"ecea2ecc-53a2-4722-a6b5-323b87262be3","email":"virgillia.bacus@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('da6cca44-65b0-4d52-b9b8-d47fce4f806b', 'cc9b7eea-7e0c-4872-bfe8-e737cc4f732a', 'cc9b7eea-7e0c-4872-bfe8-e737cc4f732a', '{"sub":"cc9b7eea-7e0c-4872-bfe8-e737cc4f732a","email":"reymond.banguiran@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('3def52f4-d7bd-42a1-884c-2ff1234539c2', 'b15f38c2-73d5-4013-b542-7b250ebbef0f', 'b15f38c2-73d5-4013-b542-7b250ebbef0f', '{"sub":"b15f38c2-73d5-4013-b542-7b250ebbef0f","email":"baoy.ester@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('b7fa3078-af9b-4c3a-a41e-77c63c12b4b4', '71713857-6fcc-4807-8697-f178e19f8e74', '71713857-6fcc-4807-8697-f178e19f8e74', '{"sub":"71713857-6fcc-4807-8697-f178e19f8e74","email":"baoy.macristine@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('cb1959a6-205f-4985-b9fc-d63032a695dc', '28e4ff31-f061-4f10-8010-f9ff86537a48', '28e4ff31-f061-4f10-8010-f9ff86537a48', '{"sub":"28e4ff31-f061-4f10-8010-f9ff86537a48","email":"mariza.batayola@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('d50d4eab-a4e1-432a-ba0b-e75723afb37c', '634e1bd9-ab12-46fe-99ae-e3945bc2ae29', '634e1bd9-ab12-46fe-99ae-e3945bc2ae29', '{"sub":"634e1bd9-ab12-46fe-99ae-e3945bc2ae29","email":"charlie.bicbic@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('02fa9e48-8fb2-4326-9f30-26de56640486', '2a5d8329-dce2-4c81-8ed7-93448a9c92ab', '2a5d8329-dce2-4c81-8ed7-93448a9c92ab', '{"sub":"2a5d8329-dce2-4c81-8ed7-93448a9c92ab","email":"bec.bec@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('ebd9db80-6cbf-4452-81be-4fc6665cff52', 'e9215ec7-3f43-4fec-9f15-f336c75518ab', 'e9215ec7-3f43-4fec-9f15-f336c75518ab', '{"sub":"e9215ec7-3f43-4fec-9f15-f336c75518ab","email":"brian.barraca@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('3077e64b-0f52-40c8-af88-4f7d24385c35', '539426c0-66c2-4701-94df-07357c25248d', '539426c0-66c2-4701-94df-07357c25248d', '{"sub":"539426c0-66c2-4701-94df-07357c25248d","email":"joseph.bracero@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('3e994574-9b8b-483c-9385-026757255f99', 'f20dc9e0-8a60-4f9e-914e-dcd6921c19c4', 'f20dc9e0-8a60-4f9e-914e-dcd6921c19c4', '{"sub":"f20dc9e0-8a60-4f9e-914e-dcd6921c19c4","email":"lea.buenaconsejo@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('0ad4037d-1635-47e5-b532-b64c997fcfb1', '0a145a52-1385-4388-9193-cd0dd895a3b3', '0a145a52-1385-4388-9193-cd0dd895a3b3', '{"sub":"0a145a52-1385-4388-9193-cd0dd895a3b3","email":"liberata.canacao@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('70514671-163c-4cc0-9f1a-0e05c0edfb9b', '78a6503c-bcd2-4b5f-90ed-a8900df03e6b', '78a6503c-bcd2-4b5f-90ed-a8900df03e6b', '{"sub":"78a6503c-bcd2-4b5f-90ed-a8900df03e6b","email":"wilfredo.canacao@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('a2fdcda4-0e31-4aca-b185-9c688c54ad6b', 'aa78659e-ac8b-4e4b-aafa-5f7701d019ad', 'aa78659e-ac8b-4e4b-aafa-5f7701d019ad', '{"sub":"aa78659e-ac8b-4e4b-aafa-5f7701d019ad","email":"irishel.caete@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('a1f920d6-00d0-4905-a59d-f574d3102337', '7cf5178e-e62a-4395-8cb7-2b6e01ae9bc4', '7cf5178e-e62a-4395-8cb7-2b6e01ae9bc4', '{"sub":"7cf5178e-e62a-4395-8cb7-2b6e01ae9bc4","email":"jordan.carulasan@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('53dae091-ea33-48ae-bd3f-5bb4d6f4b442', 'a572d81b-1571-456a-9d17-04e197688da2', 'a572d81b-1571-456a-9d17-04e197688da2', '{"sub":"a572d81b-1571-456a-9d17-04e197688da2","email":"wilson.castaneda@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('0b665fb9-2b96-40e8-b681-f0bb361629e7', '26b5ef41-613c-40ee-a00b-b20c522b487d', '26b5ef41-613c-40ee-a00b-b20c522b487d', '{"sub":"26b5ef41-613c-40ee-a00b-b20c522b487d","email":"rosalinda.catamisan@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('dd3b6315-0f87-4a97-99ee-1501bc870375', '350fe3b7-8a20-4b66-9915-7e7b3becaa6d', '350fe3b7-8a20-4b66-9915-7e7b3becaa6d', '{"sub":"350fe3b7-8a20-4b66-9915-7e7b3becaa6d","email":"monico.catulong@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('6ce83868-af0e-44f2-a140-826cd3e7530a', '848207ba-3a15-4406-86cb-fc5274d47023', '848207ba-3a15-4406-86cb-fc5274d47023', '{"sub":"848207ba-3a15-4406-86cb-fc5274d47023","email":"corazon.cuizon@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('b4d1deed-3304-4ec1-bf0b-d2a746e9ee10', '4877d859-f6ae-4d38-bd32-ccdf95e9382f', '4877d859-f6ae-4d38-bd32-ccdf95e9382f', '{"sub":"4877d859-f6ae-4d38-bd32-ccdf95e9382f","email":"benzon.delavictoria@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('c45846e2-ec03-442f-9be3-9b1e5df16f90', '22abbf52-31d7-4566-9384-87aa6f6d5ec5', '22abbf52-31d7-4566-9384-87aa6f6d5ec5', '{"sub":"22abbf52-31d7-4566-9384-87aa6f6d5ec5","email":"edielone.elustrisimo@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('85eb1dc2-178b-4863-a40c-21a7144b96c0', '7cbc8b7f-f22e-4335-a639-1f2e38e9a7c9', '7cbc8b7f-f22e-4335-a639-1f2e38e9a7c9', '{"sub":"7cbc8b7f-f22e-4335-a639-1f2e38e9a7c9","email":"haydee.delavictoria@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('f1d27ce8-3025-4cba-8f1c-1e67de3eb351', 'df76bb73-1227-4107-87f2-538caec0f5ee', 'df76bb73-1227-4107-87f2-538caec0f5ee', '{"sub":"df76bb73-1227-4107-87f2-538caec0f5ee","email":"olivertransfer.fernandez@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('38bbd50b-197b-4a8c-9087-3d60fdab5dce', '7e9fac36-b0ee-415a-8ae4-7c220941ff2f', '7e9fac36-b0ee-415a-8ae4-7c220941ff2f', '{"sub":"7e9fac36-b0ee-415a-8ae4-7c220941ff2f","email":"dino.huerti@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('2d0d1512-dca4-483f-8604-1323910fad83', 'eaa35825-b80b-4d15-ac71-49f9d452c83d', 'eaa35825-b80b-4d15-ac71-49f9d452c83d', '{"sub":"eaa35825-b80b-4d15-ac71-49f9d452c83d","email":"shela.fuentes@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('bd401740-15c1-448b-8e7f-ab1d8dea4d8a', '595ee36c-c09d-419d-aa37-c8263a95b952', '595ee36c-c09d-419d-aa37-c8263a95b952', '{"sub":"595ee36c-c09d-419d-aa37-c8263a95b952","email":"lucas.garga@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('65bf31b2-ae34-4e2f-8135-5693baa0f7b4', 'e4d43305-f29c-448c-8dc7-e2058fc66688', 'e4d43305-f29c-448c-8dc7-e2058fc66688', '{"sub":"e4d43305-f29c-448c-8dc7-e2058fc66688","email":"agosta.gabriel@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('61d05639-06fd-4a1b-8234-ffd38932fd98', '8700e8ee-2263-47d1-adb1-8136ad3aa23c', '8700e8ee-2263-47d1-adb1-8136ad3aa23c', '{"sub":"8700e8ee-2263-47d1-adb1-8136ad3aa23c","email":"maria.gonzales@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('a7597a05-68f8-409c-b809-c94d183a79ee', '03814ffe-8f60-45f0-a021-1a3fde0fb045', '03814ffe-8f60-45f0-a021-1a3fde0fb045', '{"sub":"03814ffe-8f60-45f0-a021-1a3fde0fb045","email":"romel.generalao@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('7f19302a-7315-4fb7-8bc3-ed532f066455', 'ea7b1e3c-7af7-4adb-b9c5-00452c39456f', 'ea7b1e3c-7af7-4adb-b9c5-00452c39456f', '{"sub":"ea7b1e3c-7af7-4adb-b9c5-00452c39456f","email":"kevin.illustrisimo@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('942694d3-9565-4d1b-a3a9-4b29b91cc7f6', 'a0ee8655-ed78-4a36-a80a-c7469da81995', 'a0ee8655-ed78-4a36-a80a-c7469da81995', '{"sub":"a0ee8655-ed78-4a36-a80a-c7469da81995","email":"jurienathaniel.filipinas@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('05e482d1-9c3e-451b-8a5e-18e679fd1df5', 'eb899683-3f82-4e8e-bfb7-61d2c5bec08d', 'eb899683-3f82-4e8e-bfb7-61d2c5bec08d', '{"sub":"eb899683-3f82-4e8e-bfb7-61d2c5bec08d","email":"cerela.jorulan@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('f092624f-da18-40f7-9a83-fdfe54fdc3d2', '17358009-3eae-47fe-a37d-928816fc5f76', '17358009-3eae-47fe-a37d-928816fc5f76', '{"sub":"17358009-3eae-47fe-a37d-928816fc5f76","email":"edgardo.judico@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('72187fb7-3480-4e6d-8de4-fcdc005b7a6e', '989dae0e-af24-48b0-95d7-cda9a3650dbc', '989dae0e-af24-48b0-95d7-cda9a3650dbc', '{"sub":"989dae0e-af24-48b0-95d7-cda9a3650dbc","email":"as.jumao@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('12c3fe13-b245-4163-99ea-ef790342a1a8', '2f741529-1c4b-489b-a489-93095de108e4', '2f741529-1c4b-489b-a489-93095de108e4', '{"sub":"2f741529-1c4b-489b-a489-93095de108e4","email":"as.jumao2@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('f0629ed1-5608-4deb-b2f7-099353c16d5b', 'f5dd11f0-c69d-4995-8ad6-ff8091f93c16', 'f5dd11f0-c69d-4995-8ad6-ff8091f93c16', '{"sub":"f5dd11f0-c69d-4995-8ad6-ff8091f93c16","email":"kanchanampairoj.jovie@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('106f794e-adc8-4f33-ad47-a529327659bb', 'eb02fbb0-c07c-4fc8-8c97-f8c334591026', 'eb02fbb0-c07c-4fc8-8c97-f8c334591026', '{"sub":"eb02fbb0-c07c-4fc8-8c97-f8c334591026","email":"eras.las@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('54b6018d-db2a-419f-afb4-937c5e9642c3', '1daa07f2-4fdc-460c-aed8-3f0b0576b101', '1daa07f2-4fdc-460c-aed8-3f0b0576b101', '{"sub":"1daa07f2-4fdc-460c-aed8-3f0b0576b101","email":"grethel.laude@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('26dc25a2-fa92-4ed4-a79c-032f3b803a3b', '6a1c3120-3de8-4ed6-aaec-b8d97fd83cef', '6a1c3120-3de8-4ed6-aaec-b8d97fd83cef', '{"sub":"6a1c3120-3de8-4ed6-aaec-b8d97fd83cef","email":"sofia.layug@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('5b4d815c-0af3-4d8e-a60b-2e994ee4bf86', '2de9d47f-f742-4652-86b9-d9316e60ad6e', '2de9d47f-f742-4652-86b9-d9316e60ad6e', '{"sub":"2de9d47f-f742-4652-86b9-d9316e60ad6e","email":"joselyn.leong@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('6ec7ae4f-f7eb-4a5e-9ab0-563e039a8b8c', '15cac695-7a70-4356-858d-14728d10f089', '15cac695-7a70-4356-858d-14728d10f089', '{"sub":"15cac695-7a70-4356-858d-14728d10f089","email":"ryan.llaxamana@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('9b120eef-a148-40dd-96b2-61299dbe7109', '7640ccf7-c726-4361-9889-d2559c554205', '7640ccf7-c726-4361-9889-d2559c554205', '{"sub":"7640ccf7-c726-4361-9889-d2559c554205","email":"rene.mariano@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('8c1759b6-4a27-4914-86af-d201e8b2a189', '62347c07-aa20-48b9-a714-c058e7325c0e', '62347c07-aa20-48b9-a714-c058e7325c0e', '{"sub":"62347c07-aa20-48b9-a714-c058e7325c0e","email":"ralfie.montalban@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('cdcc2b95-eec7-482a-bae9-85b3b5dabdb4', '9cfd5646-18ed-4644-a73e-371430e5e8f8', '9cfd5646-18ed-4644-a73e-371430e5e8f8', '{"sub":"9cfd5646-18ed-4644-a73e-371430e5e8f8","email":"mc.liong@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('94d30069-8b16-4094-a32c-acb3160b8a07', 'a1adf861-2059-45fb-b901-6450d0f46756', 'a1adf861-2059-45fb-b901-6450d0f46756', '{"sub":"a1adf861-2059-45fb-b901-6450d0f46756","email":"renato.mangunlay@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('81d0c85e-2da2-4f6c-9770-216c21c235b0', 'b901d6a4-5675-4168-af37-84da3f26aebf', 'b901d6a4-5675-4168-af37-84da3f26aebf', '{"sub":"b901d6a4-5675-4168-af37-84da3f26aebf","email":"ratchell.nillama@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('4146dd5f-1726-4c27-aa0f-9f1f8308ab42', '38ff8a05-22df-4ee5-9bb7-7f0d7d402b2d', '38ff8a05-22df-4ee5-9bb7-7f0d7d402b2d', '{"sub":"38ff8a05-22df-4ee5-9bb7-7f0d7d402b2d","email":"ronald.napulis@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('dd35277a-2c5d-4953-a08c-80f57b135c6b', 'd2566860-6b31-4c17-a02a-9f439a55e614', 'd2566860-6b31-4c17-a02a-9f439a55e614', '{"sub":"d2566860-6b31-4c17-a02a-9f439a55e614","email":"mirasol.pancito@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('885f047b-4d22-4c80-8af8-13ebe046ba0c', '0295af7f-7104-4079-87c6-9885cce22023', '0295af7f-7104-4079-87c6-9885cce22023', '{"sub":"0295af7f-7104-4079-87c6-9885cce22023","email":"cristopher.patatag@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('f2679c04-84dd-455a-bb39-7f761d84c7e1', '8ad8f6b3-e6ff-43a5-83a6-aa09dcad5cf7', '8ad8f6b3-e6ff-43a5-83a6-aa09dcad5cf7', '{"sub":"8ad8f6b3-e6ff-43a5-83a6-aa09dcad5cf7","email":"alex.pioquinto@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('8cc72ada-d9e0-4ac3-9ea6-438762404f7b', '594c094e-704f-4dbc-812b-03cb2a1f5421', '594c094e-704f-4dbc-812b-03cb2a1f5421', '{"sub":"594c094e-704f-4dbc-812b-03cb2a1f5421","email":"pastor.plotenia@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('eff93f09-5dbd-4a54-a82b-49fdadc39fd9', '11b4356e-318d-45cb-a676-14c353081760', '11b4356e-318d-45cb-a676-14c353081760', '{"sub":"11b4356e-318d-45cb-a676-14c353081760","email":"plotenia.macleofe@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('5a0fcb65-3784-4bac-8268-dd11c1b136e8', '895d0b34-822c-4c34-a413-4a1371169397', '895d0b34-822c-4c34-a413-4a1371169397', '{"sub":"895d0b34-822c-4c34-a413-4a1371169397","email":"romeo.ramirez@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('d8e9f4c7-cb14-454a-a7f2-c366e77215cd', '4c18f4d3-b040-482b-a853-f95ab1058c53', '4c18f4d3-b040-482b-a853-f95ab1058c53', '{"sub":"4c18f4d3-b040-482b-a853-f95ab1058c53","email":"reymart.rosales@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('4600be21-a02e-4789-b056-c4d51d2d3dcd', '13ddac08-c130-480a-82eb-c3dd51247fbd', '13ddac08-c130-480a-82eb-c3dd51247fbd', '{"sub":"13ddac08-c130-480a-82eb-c3dd51247fbd","email":"kim.rizon@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('deca0836-eb67-443f-bc1f-139c66bbd6a3', 'f6d7e324-d3c5-48d9-8a02-44cddaba48c8', 'f6d7e324-d3c5-48d9-8a02-44cddaba48c8', '{"sub":"f6d7e324-d3c5-48d9-8a02-44cddaba48c8","email":"juveline.sagolili@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('785bd1c4-ac74-43b5-9ec2-953059f7d8be', 'd944f819-635e-4955-9b1d-89d06915a4e6', 'd944f819-635e-4955-9b1d-89d06915a4e6', '{"sub":"d944f819-635e-4955-9b1d-89d06915a4e6","email":"alexander.salazar@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('244e4c40-5bac-4388-acc2-25dd7a1ed54e', 'c37fb9e1-650f-48da-a443-21ebd8ad813e', 'c37fb9e1-650f-48da-a443-21ebd8ad813e', '{"sub":"c37fb9e1-650f-48da-a443-21ebd8ad813e","email":"emmanuel.sanchez@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('0972c7f7-c845-4f61-81e2-1545266b5cb8', 'ab0fec15-df7e-404f-9836-f36198b4d20f', 'ab0fec15-df7e-404f-9836-f36198b4d20f', '{"sub":"ab0fec15-df7e-404f-9836-f36198b4d20f","email":"rhonvic.sanchez@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('b4131892-a1ed-4a9f-8497-7558d63ff4d7', 'a6bd7146-1517-4fbe-84ec-af1c4a04cd5c', 'a6bd7146-1517-4fbe-84ec-af1c4a04cd5c', '{"sub":"a6bd7146-1517-4fbe-84ec-af1c4a04cd5c","email":"rutchele.sanchez@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('efe7c3f9-7871-42be-a199-7fa793009bb4', 'cf9279bb-731f-4d79-8cc4-7d1281013025', 'cf9279bb-731f-4d79-8cc4-7d1281013025', '{"sub":"cf9279bb-731f-4d79-8cc4-7d1281013025","email":"reymar.saycon@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('55b451f1-4270-4f0f-8ad6-d720371f0eae', '56ea4c4d-7978-4b31-a28d-f6d8a75f15fe', '56ea4c4d-7978-4b31-a28d-f6d8a75f15fe', '{"sub":"56ea4c4d-7978-4b31-a28d-f6d8a75f15fe","email":"rogelito.salvo@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('4a97c99a-63f1-401d-9470-f95efa192880', 'd35b68e4-7870-4cbe-a32c-96ecf0153fa4', 'd35b68e4-7870-4cbe-a32c-96ecf0153fa4', '{"sub":"d35b68e4-7870-4cbe-a32c-96ecf0153fa4","email":"jendelh.soreneo@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('80b94dc0-5da4-4f60-a81b-6e9f91b9832a', '8f1352d6-900d-451c-acab-71d23718ec18', '8f1352d6-900d-451c-acab-71d23718ec18', '{"sub":"8f1352d6-900d-451c-acab-71d23718ec18","email":"rowena.suello@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('4a9a2500-f39d-48f1-a337-cbd45a4a12a1', 'd28bfad6-ddff-497a-aaad-965f459167b9', 'd28bfad6-ddff-497a-aaad-965f459167b9', '{"sub":"d28bfad6-ddff-497a-aaad-965f459167b9","email":"juneil.tikling@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('c544808e-5bc0-4e81-bb45-6184856daa7e', '87d3ea7b-3552-4ef8-8c6a-3c412f3a4e4d', '87d3ea7b-3552-4ef8-8c6a-3c412f3a4e4d', '{"sub":"87d3ea7b-3552-4ef8-8c6a-3c412f3a4e4d","email":"uy.joe@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('3fa20555-3160-4404-9b29-d29ae2be2558', '2c398350-2029-47a1-a44a-6ce868e9d3d5', '2c398350-2029-47a1-a44a-6ce868e9d3d5', '{"sub":"2c398350-2029-47a1-a44a-6ce868e9d3d5","email":"josie.uy@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('515cc1e1-c350-4e9a-9b9a-d2997adef487', '34a5108b-27a7-4c90-90e0-a42be41095a7', '34a5108b-27a7-4c90-90e0-a42be41095a7', '{"sub":"34a5108b-27a7-4c90-90e0-a42be41095a7","email":"anthony.jose@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('457aed75-326f-44cf-af5f-e6d350ff5b57', 'f66b5457-9232-48fd-ac49-abd69832a811', 'f66b5457-9232-48fd-ac49-abd69832a811', '{"sub":"f66b5457-9232-48fd-ac49-abd69832a811","email":"dolly.yangyang@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('be313d86-e433-458e-bbf8-207d8e3563cd', '309a6190-cfae-4bba-a3a7-9ab81cfbd6a1', '309a6190-cfae-4bba-a3a7-9ab81cfbd6a1', '{"sub":"309a6190-cfae-4bba-a3a7-9ab81cfbd6a1","email":"eduarda.abella@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('ec05f54f-dc87-4c87-8622-67b1141fc920', '1d8ec0f6-c0f6-415e-bc8f-7910d39e21f6', '1d8ec0f6-c0f6-415e-bc8f-7910d39e21f6', '{"sub":"1d8ec0f6-c0f6-415e-bc8f-7910d39e21f6","email":"jandelyn.abong@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('8628dbc8-e7a8-4328-88dd-dccebdd2eac9', '123ca8ff-43c7-4764-8901-1512cbc6eebe', '123ca8ff-43c7-4764-8901-1512cbc6eebe', '{"sub":"123ca8ff-43c7-4764-8901-1512cbc6eebe","email":"acabo.bonita@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('8e5f6d10-c398-4e2f-b340-5aa7ab5fa1ac', '1bf67a4e-d6a4-482d-85e0-d7b40429662e', '1bf67a4e-d6a4-482d-85e0-d7b40429662e', '{"sub":"1bf67a4e-d6a4-482d-85e0-d7b40429662e","email":"aguhob.maricel@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('5cfa3876-5eea-46d0-b905-ffa6fffe793d', 'ad94a179-cc62-4b48-ab4f-e0e0b1ca15ce', 'ad94a179-cc62-4b48-ab4f-e0e0b1ca15ce', '{"sub":"ad94a179-cc62-4b48-ab4f-e0e0b1ca15ce","email":"magdalina.alegarme@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('0d3f8faf-7858-4781-83d6-7b436e5b33c8', '728ae4e4-c298-4baa-9d0a-b8ac6f7f7261', '728ae4e4-c298-4baa-9d0a-b8ac6f7f7261', '{"sub":"728ae4e4-c298-4baa-9d0a-b8ac6f7f7261","email":"mabel.alegarme@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('d7c28494-f0af-4562-ab64-adaf8f6058b4', 'adb23736-8e4a-49c6-b2dc-abfd101a34d6', 'adb23736-8e4a-49c6-b2dc-abfd101a34d6', '{"sub":"adb23736-8e4a-49c6-b2dc-abfd101a34d6","email":"lanie.albon@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('53a1aef0-4e60-4935-88b2-05c7e287ccc0', '2b14ca6e-3078-4f9b-8f63-8a1bda21ba1b', '2b14ca6e-3078-4f9b-8f63-8a1bda21ba1b', '{"sub":"2b14ca6e-3078-4f9b-8f63-8a1bda21ba1b","email":"almario.mikel@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('18a7edf6-3349-431d-94b2-01ee97a3a6ad', 'c5eee7f5-5d2d-4c0f-a5cf-07afdff4e33e', 'c5eee7f5-5d2d-4c0f-a5cf-07afdff4e33e', '{"sub":"c5eee7f5-5d2d-4c0f-a5cf-07afdff4e33e","email":"suzettesis.anodan@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('5cfadedb-d35c-48d8-801b-397c65021bea', 'a9a79186-a203-41f2-8b7e-f834a2bbeba9', 'a9a79186-a203-41f2-8b7e-f834a2bbeba9', '{"sub":"a9a79186-a203-41f2-8b7e-f834a2bbeba9","email":"alma.asenjo@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('5670255f-1e4c-4a78-a3d7-b5003b5581d0', 'e7965cb1-48a7-415a-a742-6ad96a645d15', 'e7965cb1-48a7-415a-a742-6ad96a645d15', '{"sub":"e7965cb1-48a7-415a-a742-6ad96a645d15","email":"judy.bagasbas@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('1165bead-6818-45e4-bfb3-6f20aca9c546', '5d3a9f43-0864-4ed5-a448-231d6b3fbaee', '5d3a9f43-0864-4ed5-a448-231d6b3fbaee', '{"sub":"5d3a9f43-0864-4ed5-a448-231d6b3fbaee","email":"ericson.baoy@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('30681f8b-3e96-4287-9d56-a9f58314494d', 'e55ceba9-84c7-4a55-96d9-0352e823977a', 'e55ceba9-84c7-4a55-96d9-0352e823977a', '{"sub":"e55ceba9-84c7-4a55-96d9-0352e823977a","email":"florencio.baraya@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('911ce157-f0be-49bd-932e-4792d6a175c1', '68d33d21-3979-4e45-8e38-64d8ce508eb5', '68d33d21-3979-4e45-8e38-64d8ce508eb5', '{"sub":"68d33d21-3979-4e45-8e38-64d8ce508eb5","email":"gladwin.caballa@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('f78cd1de-02ec-4ed2-b3de-5e3dfbbe2f80', '50f658ef-5ed9-496e-aa92-21b44e4f253c', '50f658ef-5ed9-496e-aa92-21b44e4f253c', '{"sub":"50f658ef-5ed9-496e-aa92-21b44e4f253c","email":"dianne.cuarez@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('486e457c-1549-499d-abd8-a343f4e2c034', 'e68401d7-86f3-48ff-b117-471727b0a761', 'e68401d7-86f3-48ff-b117-471727b0a761', '{"sub":"e68401d7-86f3-48ff-b117-471727b0a761","email":"reymart.calumba@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('b17be6a0-c684-489b-9205-0c1e943c4acb', 'dddcbac2-b9d0-4cfe-9e58-895e5cfd44fe', 'dddcbac2-b9d0-4cfe-9e58-895e5cfd44fe', '{"sub":"dddcbac2-b9d0-4cfe-9e58-895e5cfd44fe","email":"merly.dejeto@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('2f9b8377-36c6-487b-9293-7a439c6d7af7', 'b93d39a9-1890-4781-a99e-2e15cf0d7940', 'b93d39a9-1890-4781-a99e-2e15cf0d7940', '{"sub":"b93d39a9-1890-4781-a99e-2e15cf0d7940","email":"gabato.dante@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('e057071a-ac47-4783-8e00-e84b05972fb8', 'c93735ff-c755-434c-8a29-73b31121cd68', 'c93735ff-c755-434c-8a29-73b31121cd68', '{"sub":"c93735ff-c755-434c-8a29-73b31121cd68","email":"malonie.gabriel@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('c8dc77e1-4415-49db-952d-3a643d71b088', 'c247dc24-fab5-435e-805b-6c1cb88884e3', 'c247dc24-fab5-435e-805b-6c1cb88884e3', '{"sub":"c247dc24-fab5-435e-805b-6c1cb88884e3","email":"gonzaga.lito@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('46e65813-7750-4e09-917a-b0853dad2426', '04449aa4-9d68-4740-8f15-ccfe4c51a555', '04449aa4-9d68-4740-8f15-ccfe4c51a555', '{"sub":"04449aa4-9d68-4740-8f15-ccfe4c51a555","email":"kevin.gonzales@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('dc568ea9-1625-4b93-bb24-a9d3177216e7', 'f43322f0-138f-4a0e-bec9-c8f38257b1af', 'f43322f0-138f-4a0e-bec9-c8f38257b1af', '{"sub":"f43322f0-138f-4a0e-bec9-c8f38257b1af","email":"mary.gonzales@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('504c5763-9906-4a97-93ea-d25d73997121', 'a4ffc224-5e7f-4364-b95e-f841a5bd6b8d', 'a4ffc224-5e7f-4364-b95e-f841a5bd6b8d', '{"sub":"a4ffc224-5e7f-4364-b95e-f841a5bd6b8d","email":"armela.halos@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('2c93ed60-523f-4b1a-941f-5166a353b528', '72782906-84ce-4b7d-81ae-6e6cd1550ce5', '72782906-84ce-4b7d-81ae-6e6cd1550ce5', '{"sub":"72782906-84ce-4b7d-81ae-6e6cd1550ce5","email":"michael.jorolan@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('00046161-356e-4f1e-aae5-1366a32cb393', '7d52104d-90ef-4a9b-a73a-f1a1da2e00e8', '7d52104d-90ef-4a9b-a73a-f1a1da2e00e8', '{"sub":"7d52104d-90ef-4a9b-a73a-f1a1da2e00e8","email":"fe.inihao@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('a3b6eee6-e791-4281-904f-c20fc10ece53', '849988ea-350f-485d-a642-a7aa91d57a1d', '849988ea-350f-485d-a642-a7aa91d57a1d', '{"sub":"849988ea-350f-485d-a642-a7aa91d57a1d","email":"erlinda.kismundo@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('aabf0369-b130-46cb-a527-dd34fffc3afa', '0cdb9357-cbee-4d3e-885c-df6bdcf9c79b', '0cdb9357-cbee-4d3e-885c-df6bdcf9c79b', '{"sub":"0cdb9357-cbee-4d3e-885c-df6bdcf9c79b","email":"lorena.kismundo@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('cf34c716-eeae-4e4b-a014-6326f5fe9e2a', 'bbf2f5a7-3587-46ab-9edb-50a21cbad6a8', 'bbf2f5a7-3587-46ab-9edb-50a21cbad6a8', '{"sub":"bbf2f5a7-3587-46ab-9edb-50a21cbad6a8","email":"ramon.kismundo@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('3bd50851-dfec-4ec9-8cfb-88a6a8966771', '2a1f8cfa-fb98-44dd-aa7c-e667b57cb810', '2a1f8cfa-fb98-44dd-aa7c-e667b57cb810', '{"sub":"2a1f8cfa-fb98-44dd-aa7c-e667b57cb810","email":"jaime.kanchanapairoj@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('afdda1a2-2e95-44aa-8a77-0ea40b5fffda', 'c954ae31-88f5-4143-be6e-c62a038328a5', 'c954ae31-88f5-4143-be6e-c62a038328a5', '{"sub":"c954ae31-88f5-4143-be6e-c62a038328a5","email":"james.kanchanapairoj@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('aec4418b-9d96-431c-a5b2-98b8aabfa71b', 'ab0080f4-543a-4018-9118-c9138143ec4f', 'ab0080f4-543a-4018-9118-c9138143ec4f', '{"sub":"ab0080f4-543a-4018-9118-c9138143ec4f","email":"julius.laiz@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('e44a2dde-fd29-4871-99aa-825ba92cf582', '850e21f4-b754-40bd-9211-c96d60c29c9e', '850e21f4-b754-40bd-9211-c96d60c29c9e', '{"sub":"850e21f4-b754-40bd-9211-c96d60c29c9e","email":"gemma.layson@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('7e263e1b-6a29-4971-8d8d-3232d9e709dd', '562a3ff0-3c50-4224-907b-2790c48a6fbd', '562a3ff0-3c50-4224-907b-2790c48a6fbd', '{"sub":"562a3ff0-3c50-4224-907b-2790c48a6fbd","email":"chine.lobiano@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('115786dc-6567-4006-8fce-d7efc7791ccb', '4ab694d4-51a9-4495-aa8a-48446763d3ff', '4ab694d4-51a9-4495-aa8a-48446763d3ff', '{"sub":"4ab694d4-51a9-4495-aa8a-48446763d3ff","email":"kimberly.magallon@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('f840aada-5ca3-4a0f-9ce7-185e32c9d165', '4c11955b-eaed-4710-97ad-f25e7775bb7e', '4c11955b-eaed-4710-97ad-f25e7775bb7e', '{"sub":"4c11955b-eaed-4710-97ad-f25e7775bb7e","email":"miraflor.mirasol@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('223f7b15-1e7e-415f-92e8-8de88d56306a', 'e27606d9-9be1-4042-ae64-51f895c02867', 'e27606d9-9be1-4042-ae64-51f895c02867', '{"sub":"e27606d9-9be1-4042-ae64-51f895c02867","email":"mila.mendoza@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('91439a9f-fd28-4928-ac0a-31d76702676b', '799212c1-f48d-4e60-ad8d-ae0bf7436ae8', '799212c1-f48d-4e60-ad8d-ae0bf7436ae8', '{"sub":"799212c1-f48d-4e60-ad8d-ae0bf7436ae8","email":"nemenio.primo@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('f1eff07b-a3ec-4f83-b249-d1dc5275d791', '40404ebe-ecc2-45bf-877d-7d97006255b4', '40404ebe-ecc2-45bf-877d-7d97006255b4', '{"sub":"40404ebe-ecc2-45bf-877d-7d97006255b4","email":"agnes.nillas@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('efe1a43d-e9c9-41d9-9c3f-a4473150a4e3', '302f68a4-ced1-434d-b3d6-7d9422696ea6', '302f68a4-ced1-434d-b3d6-7d9422696ea6', '{"sub":"302f68a4-ced1-434d-b3d6-7d9422696ea6","email":"ryan.omandam@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('619320a8-e094-4860-9005-1fe9f89c8f19', 'afc74491-d01d-4b4d-9fc9-e199b290bf75', 'afc74491-d01d-4b4d-9fc9-e199b290bf75', '{"sub":"afc74491-d01d-4b4d-9fc9-e199b290bf75","email":"chanelita.padin@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('897a420e-a1bc-49ad-bbec-83437403e300', 'b41b826f-72f4-4a24-b7fc-694952455e67', 'b41b826f-72f4-4a24-b7fc-694952455e67', '{"sub":"b41b826f-72f4-4a24-b7fc-694952455e67","email":"helen.perales@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('b1e81262-c373-4261-a55b-23b2b8826179', '9db80205-c415-4b63-af54-0a4722abd775', '9db80205-c415-4b63-af54-0a4722abd775', '{"sub":"9db80205-c415-4b63-af54-0a4722abd775","email":"perez.joice@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('ffbfc3dc-30d9-4eba-8be8-b79236248f39', '7efc9f1e-c19a-4551-a2e3-1d8c12d58ca9', '7efc9f1e-c19a-4551-a2e3-1d8c12d58ca9', '{"sub":"7efc9f1e-c19a-4551-a2e3-1d8c12d58ca9","email":"eugenia.plotenia@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('c219dc26-c3df-4045-adf1-765d41a2cad3', '46a9a1aa-1af8-46d1-ab9d-bb3a6500dec2', '46a9a1aa-1af8-46d1-ab9d-bb3a6500dec2', '{"sub":"46a9a1aa-1af8-46d1-ab9d-bb3a6500dec2","email":"rigortransfer.plando@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('4b26996e-4dad-4a1a-a623-0a46dbc49550', 'e93a3a46-7e24-47b9-b254-15178072bf21', 'e93a3a46-7e24-47b9-b254-15178072bf21', '{"sub":"e93a3a46-7e24-47b9-b254-15178072bf21","email":"mariel.quilat@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('b832bac1-babe-4095-95a5-6f39fb6d7071', 'b874dd35-f192-469c-8b7b-4c4d2b9a1128', 'b874dd35-f192-469c-8b7b-4c4d2b9a1128', '{"sub":"b874dd35-f192-469c-8b7b-4c4d2b9a1128","email":"gina.saberon@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('d7ed27fc-ac81-423d-b464-c349006d080e', '267f6687-797e-40db-9727-c5f5a81c63b0', '267f6687-797e-40db-9727-c5f5a81c63b0', '{"sub":"267f6687-797e-40db-9727-c5f5a81c63b0","email":"sermilon.samer@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('15fe8554-d6f1-4a3c-bf41-abba1f8f7227', '889b498e-7625-47c6-8057-27c502f377fa', '889b498e-7625-47c6-8057-27c502f377fa', '{"sub":"889b498e-7625-47c6-8057-27c502f377fa","email":"shirly.sedon@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('b00f6cbf-ed9e-4131-841a-8889f6171b8c', '3cb75ce7-5a10-4730-94c0-687aa988a0a3', '3cb75ce7-5a10-4730-94c0-687aa988a0a3', '{"sub":"3cb75ce7-5a10-4730-94c0-687aa988a0a3","email":"jonie.repdos@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('6ce28b1d-2cba-41ad-9e52-ae3d8d00cc5a', '54b88133-126f-4184-8fc0-9f7d20260fdc', '54b88133-126f-4184-8fc0-9f7d20260fdc', '{"sub":"54b88133-126f-4184-8fc0-9f7d20260fdc","email":"lemuelwithdraw.sencil@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('9b8fe163-e5be-468b-be37-b2fa81be6cf5', '5c79b88a-8939-45ce-89ed-b8aca84cf827', '5c79b88a-8939-45ce-89ed-b8aca84cf827', '{"sub":"5c79b88a-8939-45ce-89ed-b8aca84cf827","email":"marichu.silva@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('40c78294-f477-4361-8e45-510352e94a1c', 'c24c39f8-8413-42a6-bc65-e0ab4d779b0c', 'c24c39f8-8413-42a6-bc65-e0ab4d779b0c', '{"sub":"c24c39f8-8413-42a6-bc65-e0ab4d779b0c","email":"mildred.sumampong@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('0dd7b399-18f9-4e31-b28d-7bff1dc01898', 'b0417094-e8c1-482d-bda7-1c41aa03a1c3', 'b0417094-e8c1-482d-bda7-1c41aa03a1c3', '{"sub":"b0417094-e8c1-482d-bda7-1c41aa03a1c3","email":"sumampong.almae@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('3c1159d5-be68-49fb-a971-58f8017a1853', '72781bb5-d533-4eb8-af29-2040f1ed7dca', '72781bb5-d533-4eb8-af29-2040f1ed7dca', '{"sub":"72781bb5-d533-4eb8-af29-2040f1ed7dca","email":"malotis.solero@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('3ec5a4e3-fd8d-4f96-acd6-896135cdd08d', 'dac5c784-ea6b-4d72-b017-4d21268bfae6', 'dac5c784-ea6b-4d72-b017-4d21268bfae6', '{"sub":"dac5c784-ea6b-4d72-b017-4d21268bfae6","email":"rowel.rodrigues@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('086365f1-0d18-431f-96f4-eed24cce414b', 'de7b2f22-9ab1-4975-843a-a07394b45f73', 'de7b2f22-9ab1-4975-843a-a07394b45f73', '{"sub":"de7b2f22-9ab1-4975-843a-a07394b45f73","email":"elsa.talingting@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('e92a8c8f-566b-4aca-bb53-e6976cc93f79', 'ff3c4585-4bb5-41d6-a1c8-e9579191a37a', 'ff3c4585-4bb5-41d6-a1c8-e9579191a37a', '{"sub":"ff3c4585-4bb5-41d6-a1c8-e9579191a37a","email":"marissa.tampos@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('776fe22e-2ed0-4fed-a8f2-adc8bf239255', 'a72a3538-f67b-4a52-9e96-9f059b839284', 'a72a3538-f67b-4a52-9e96-9f059b839284', '{"sub":"a72a3538-f67b-4a52-9e96-9f059b839284","email":"uy.vicky@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('1b8f2288-5a6d-4442-9ad1-0cc87edf95dd', '1da83a9c-2f15-4dba-a730-8a81f1d5176b', '1da83a9c-2f15-4dba-a730-8a81f1d5176b', '{"sub":"1da83a9c-2f15-4dba-a730-8a81f1d5176b","email":"uy.jona@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());
INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, created_at, updated_at)
VALUES ('e9b3c110-c771-49df-9a6d-c8a716519a55', '06751019-b286-42bd-8df1-a304fd0d68d2', '06751019-b286-42bd-8df1-a304fd0d68d2', '{"sub":"06751019-b286-42bd-8df1-a304fd0d68d2","email":"ronald.uy@rcccoop.com","email_verified":false,"phone_verified":false}', 'email', NOW(), NOW());

-- Members
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('f40777d4-15b6-4304-8625-38373b20c3f9', 'Mariza Abellana', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('5f0ef312-17d3-4f2a-b2dd-502d2badde7b', 'Jomar Abellana', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('cf0697cd-a44e-4665-a2f6-5f91b72e271d', 'Renato Abais', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('a498cb9a-2444-4f70-acc5-58d114fd42fe', 'John Ervin Abayan', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('8e2cd01e-e60d-42b8-ad20-cde2ead603f8', 'Jay Arganza', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('806f2eee-8e93-4e86-933b-86debe01501d', 'Kim-Rider Abordonado', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('dd13aa81-81b8-431e-808e-9bb289cbd9f6', 'Myrna Almocera', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('21735b8d-02bc-4164-a701-1f6fb4b97329', 'Marlon Anon', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('56066d95-50f2-4c5d-a1ce-56198c1d9423', 'Roselyn Amit', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('2a18d329-e39d-497b-8833-8478b52ccd44', 'Marilyn Amit', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('9ccad733-39f1-4b81-ac65-b68df8488905', 'Cristiane Apostol', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('dd72060d-1add-49a6-ad5d-2b79ee7d80d2', 'Jessamier Apostol', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('49a0c0a7-2759-4572-9c15-d2380114537c', 'Analie Autor', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('8c9be971-aa44-49a1-a513-f2ca9132c821', 'Jeorge Bahian', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('381e667c-7eea-42b1-9ce0-0a53aa69af9c', 'Megan Bacus', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('820c6797-ec42-44a0-839e-334dc6dc488e', 'Virgillia Bacus', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('6b91a41a-a82e-4b0d-9a03-437cd678cc1d', 'Reymond Banguiran', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('5ebbb709-4817-4465-8f07-abeb79b8fe66', 'Baoy Ester', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('5bb83520-89b0-4290-bbb0-d2e298064a2c', 'Baoy Ma.Cristine', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('71bcb419-e85e-490d-aa66-b42ff492a7cf', 'Ma.Riza Batayola', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('e892c534-ca10-4a86-b1db-a0e3ed305abd', 'Charlie Bicbic', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('087f9f45-40c3-42ba-9187-085dbfc1d984', 'Bec Micho Bec', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('86a17dcb-3713-4976-8701-decb0d15f486', 'Brian Barraca', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('e8d19d6a-a6a1-4dee-8e3b-56253f3794ce', 'Joseph Bracero', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('7044c2c7-27c5-4d68-b715-aae0dd6c0977', 'Lea Buenaconsejo', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('834ee026-fc35-473e-a34b-804d14c6a4bd', 'Liberata Canacao', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('5fe04b5f-d536-4b48-a17f-afdd95131b5a', 'Wilfredo Canacao', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('3b354e50-04bd-4878-826c-eca1b851f2e8', 'Irishel Cañete', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('b7203b3a-71fe-49dd-846c-f14761dc1b15', 'Jordan Carulasan', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('bf31960a-467f-4abb-9df2-3f824a04f614', 'Wilson Castaneda', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('a9af5466-0be0-4bc5-a8c7-39c8fc990822', 'Rosalinda Catam-Isan', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('9d72d652-093a-48f1-aa2d-f90e7c7296ce', 'Monico Catulong', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('7b7dc269-3db7-4153-b459-ae47cf332148', 'Corazon Cuizon', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('df3a6923-3786-40dc-ae78-06a8c7dd1850', 'Benzon Delavictoria', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('f074d1d1-6689-45b6-8a4b-d6e87c7c5b0e', 'Edielone Elustrisimo', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('24c5ebe1-9831-4888-9f5a-5bc9b06d7efa', 'Haydee Delavictoria', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('fcdb3efc-6dfc-4c0e-9f71-3baf6a857afd', 'Oliver-Transfer Justin Fernandez', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('f604b874-c1e3-4133-b613-6ae4f0d38f7d', 'Dino Huerti', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('5f376b4d-3511-4fe3-9fef-175ee987f87e', 'Shela Mae Fuentes', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('2bbb1d73-cf9c-4421-a8c1-91f225983784', 'Lucas Garga', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('b9f1a998-746e-4893-951f-ae0acb779de9', 'Agosta Gabriel', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('2ee06f84-8c07-43b3-97c2-9343d26585f1', 'Maria Gonzales', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('154b6706-f474-42c7-8445-f3ce5b6904c2', 'Romel Generalao', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('fee09941-ac2f-4876-aeb7-c15c2a4d1e10', 'Kevin Illustrisimo', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('733c4be3-3b67-43cc-a807-90c808a7bab3', 'Jurie-Nathaniel Alisbo Filipinas', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('099b18f8-71f9-46b7-a69a-8493e8cbe6c0', 'Cerela Jorulan', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('a62b9820-8430-44e6-bbc4-bb087e2e43fd', 'Edgardo Judico', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('56641a48-093c-422a-8658-d39858f396a9', 'As Vince Jumao', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('2d0d5892-9279-49b1-8219-1e753087bdb4', 'As Angel Jumao', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('5e9459d0-7ced-4679-bb76-524c0d540413', 'Kanchanampairoj Jovie', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('e83127b2-ec03-4915-b041-ade927e95ccd', 'Eras Marife Las', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('c33a63ed-df0a-4438-a95b-b1abc5e0c03d', 'Grethel Laude', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('306f9f8d-1e1f-480f-ae78-06518a33c177', 'Sofia Layug', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('577b45ad-e7ca-4342-966e-4881eb4522cb', 'Joselyn Leong', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('c38d5860-f8aa-4540-b002-ffca2da3cc2c', 'Ryan Llaxamana', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('3e447c16-d5c4-478f-b637-611e78e3ae36', 'Rene Mariano', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('e8139667-9f3a-4b32-804b-7afb83c8ec4f', 'Ralfie Montalban', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('31c78eb2-7b21-4fd7-bc2a-46be717add48', 'Mc Quary Kyle Liong', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('b8772c60-17df-4663-8f2a-445904739e38', 'Renato Mangunlay', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('adb593c9-3b28-4430-af58-5901315f44fe', 'Ratchell Nillama', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('55d7ca92-c9bd-4d07-aa7e-bbbc41737cff', 'Ronald Napulis', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('9b28682e-924c-49ce-ae6c-76d63b5c049e', 'Mirasol =Ahongs Pancito', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('a7c21b84-21f5-405f-b0cb-13819de7952c', 'Cristopher Patatag', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('d2103bf1-57fc-4be4-b87f-017d88bb1a92', 'Alex Pioquinto', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('63899dd3-eb07-4751-83ff-b153b29c9f64', 'Pastor Plotenia', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('5a37817b-139f-4082-a818-cb7d50514ae0', 'Plotenia Ma.Cleofe-', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('3293f191-80ee-4220-b417-a5843f12a2ba', 'Romeo Jr Ramirez', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('9ba96819-3ff2-4201-bf48-53171e4e40ba', 'Reymart Rosales', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('fc494f99-0c4d-4c00-8dff-8799f4460aa2', 'Kim Rizon', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('ee1005a8-7cb6-4489-b070-2bfa167dd5d9', 'Juveline Sagolili', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('60253f8e-520a-4445-ad9e-3bcf09fd0220', 'Alexander Salazar', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('2489002d-a8b3-42bd-9f35-bb6f69433de2', 'Emmanuel Sanchez', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('1b1868f3-cc97-4ed2-b47a-92d3d8523424', 'Rhonvic Sanchez', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('0d76fd44-f980-4d3e-b10f-c7ddb00a5d0b', 'Rutchele Sanchez', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('08b7ad68-61dc-4a43-b6e0-f97ed25aa83f', 'Reymar Saycon', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('c2335b57-8c8c-4ac8-9b01-d6e1fb46bfb8', 'Rogelito Salvo', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('b371a0b8-79c2-4f8c-8943-826b1e8f382b', 'Jendelh Soreneo', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('d56a4dc0-eeae-4579-8a98-8e889f340f22', 'Rowena Suello', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('c5672686-2a5a-4e24-b160-74a2a825a475', 'Juneil Tikling', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('bf3f9702-2885-4c27-875a-88a035d56f79', 'Uy Joe', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('95e4d8d4-1ad8-4dcf-82d6-e8e99768695f', 'Josie Uy', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('9303dcf8-506b-4695-9a64-447528d854e3', 'Anthony Uy Jose', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('32e83ce8-83a0-4c2f-bb30-71fc71fd74b8', 'Dolly Yang-Yang', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('83d7f41d-a373-4741-9444-2abf7281941c', 'Eduarda Abella', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('55af0f6b-42e1-4dd7-b677-d3c8325ef95c', 'Jandelyn Abong', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('f5cc8668-d2e5-439c-8272-76be823f9e02', 'Acabo Bonita', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('3885894a-d563-44df-bf8e-3ffa5542737e', 'Aguhob Maricel', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('87674db7-4a7e-4158-8e5e-1fce7292fdfc', 'Magdalina Alegarme', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('62c5b722-eb07-48ca-8747-00f605cb9f16', 'Mabel Alegarme', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('edea73dc-abcf-45fb-ac02-bb8be9d87329', 'Lanie Albon', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('9cd82115-4ca5-434f-8b2b-4df91b1a59b4', 'Almario Mikel', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('b47a9d13-4b81-491a-904f-611a4c2b8fca', 'Suzette-Sis Kuya Edgar Anodan', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('0ffd3e35-2068-481b-bd95-8b0bcacbb853', 'Alma Asenjo', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('1707ccdf-e604-4055-80bd-5bc23fcbb48f', 'Judy Bagasbas', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('324b1b04-ba33-42a0-a6cb-b713d2261a62', 'Ericson Baoy', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('69ded56d-600b-49e5-abea-7ce5badac103', 'Florencio Baraya', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('0c628b9b-88db-4bdf-a09b-b67b5a97e35d', 'Gladwin Caballa', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('55d143a4-7292-4f87-9e93-347ddd9e5772', 'Dianne Less 35K Pay Loan Cuarez', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('aca68062-71c7-46b7-876f-a3b405a5538d', 'Reymart Calumba', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('739af10b-5ea8-48df-88fd-a06594c4db27', 'Merly Dejeto', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('f02d47d9-efad-4736-bc74-60a5bac08a7b', 'Gabato Dante', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('5d39f7c8-518b-45ef-ae86-cfb8b4fab3f5', 'Ma.Lonie Gabriel', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('6ceb9bed-9af1-441a-bd2b-499e3e1c3a81', 'Gonzaga Lito', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('e8512b7c-8a7b-4bdf-9aed-e7b89eb078e3', 'Kevin Gonzales', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('26cc7075-1440-4c77-8cd0-89ab8168d19b', 'Mary Rose Gonzales', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('c92c80ca-2d33-48b2-ada5-ed51cc2e2434', 'Armela Halos', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('45a6fa23-c29d-42fe-a1ec-2058cbf6516c', 'Michael Jorolan', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('43811e6e-89b7-451a-b5c3-d27bb352089b', 'Fe Inihao', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('d1140de8-95ab-4c62-b527-375cb901d2c1', 'Erlinda Kismundo', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('3ee90b37-65c3-43d2-bb5e-2341552f40c3', 'Lorena Kismundo', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('cf4ca3bf-ebbb-4420-b2fa-33bbf776b1e0', 'Ramon Kismundo', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('4569fe61-a019-4053-afd5-8a855aa9f917', 'Jaime Kanchanapairoj', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('9dfd4109-4f92-44c8-aec0-7b7cdc0feb4b', 'James Kanchanapairoj', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('b8397bd0-b148-4bce-8b42-bd2fca670a74', 'Julius Laiz', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('eb9592ea-9aae-45a2-865d-22f90883903a', 'Gemma Layson', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('25970ed0-bf1f-4cc1-92b0-d2b26f3afe3e', 'Chine Lobiano', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('2d02746b-a468-49fa-8c0d-67c7d539cccd', 'Kimberly Magallon', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('3c849536-20db-4b95-acb3-6126d078e77e', 'Miraflor Mirasol', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('93e75c35-d70f-4566-b0e5-34abd86783d1', 'Mila Mendoza', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('49264683-2f7a-4a33-9821-5944851ead88', 'Nemenio Primo', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('1f41a179-dc25-47d7-865f-fc2e9474aa72', 'Agnes Nillas', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('13d62c94-ee14-41e8-915e-f2e0e1d5efc2', 'Ryan Omandam', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('487985e4-17d4-4449-acf8-3ea61e97d7cc', 'Chanelita Padin', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('2fa58400-2419-48c8-89a0-ca890ec88f03', 'Helen Perales', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('a9911e61-f551-4184-be44-6cea7b026e24', 'Perez Joice', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('926e3ccc-4656-4cbc-ba0f-0ab8e02c893b', 'Eugenia Plotenia', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('aea775f8-ee54-4155-b56b-fd66c1e76c12', 'Rigor=Transfer To Sir Joe 10K Plando', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('9b5292e4-5a17-4482-8b19-5fed75d821d3', 'Mariel Quilat', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('f2e92340-8b3c-4cbe-ba87-105d1ae74198', 'Gina Saberon', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('fd8c1e4a-5589-4543-bf7c-802b2bcc995a', 'Sermilon Samer', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('55744579-d756-4d97-b3ed-c22fcaf3b6ad', 'Shirly Sedon', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('966ca935-ccb3-4ba2-8f58-87c067ffa4e3', 'Jonie Repdos', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('00d2e455-71fa-4746-b78c-d06075addbc9', 'Lemuel-Withdraw Pay Loan Sencil', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('509568f0-22f8-4034-be42-4da05ba9cc01', 'Marichu Silva', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('f173418c-deb4-4c48-90e7-7a7ca446b1c6', 'Mildred Sumampong', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('fceaac81-d11d-4dff-820a-688587c6f9c5', 'Sumampong Almae', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('121af14b-b90c-48e9-a2e7-97cf34362898', 'Ma.Lotis Solero', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('0e05aea8-4994-46ca-95b6-2ddde6511584', 'Rowel Rodrigues', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('735ea21f-0f67-4909-9e57-feb712ee279c', 'Elsa Talingting', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('7600b5b1-1a7d-4208-a41e-2b5d37a12ec3', 'Marissa Tampos', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('4d0fc613-1a8b-4894-9fa3-7826362f0225', 'Uy Vicky', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('6a6766a1-55ac-496f-88b8-a76663ee5656', 'Uy Jona', 'regular', 'regular_member', '2020-01-01', 'active', 0);
INSERT INTO members (id, full_name, employment_type, membership_tier, date_joined, status, contribution_per_cutoff)
VALUES ('dafb7be0-1a66-44b6-99dd-6b631c7bf22b', 'Ronald Uy', 'regular', 'regular_member', '2020-01-01', 'active', 0);

-- Profiles
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('9f9da6ae-da26-40ac-9e42-0e80b5a5e561', 'f40777d4-15b6-4304-8625-38373b20c3f9', 'member', 'Mariza Abellana', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('681a62bd-16f3-4f9a-8948-1dfc46244cdd', '5f0ef312-17d3-4f2a-b2dd-502d2badde7b', 'member', 'Jomar Abellana', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('995223c1-dbf5-46af-b412-825ae2d10b4a', 'cf0697cd-a44e-4665-a2f6-5f91b72e271d', 'member', 'Renato Abais', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('96519b64-132c-4b10-bb33-a41be56f1161', 'a498cb9a-2444-4f70-acc5-58d114fd42fe', 'member', 'John Ervin Abayan', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('ccf153bb-17c5-4747-aae4-ad624003b581', '8e2cd01e-e60d-42b8-ad20-cde2ead603f8', 'member', 'Jay Arganza', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('877cceaa-9fd9-46d3-98d7-10aec6980401', '806f2eee-8e93-4e86-933b-86debe01501d', 'member', 'Kim-Rider Abordonado', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('28805271-89af-4c97-bcd0-fe3109a1f451', 'dd13aa81-81b8-431e-808e-9bb289cbd9f6', 'member', 'Myrna Almocera', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('4f1ef5c1-84fb-4339-b252-10d931f8bced', '21735b8d-02bc-4164-a701-1f6fb4b97329', 'member', 'Marlon Anon', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('d1b869a0-7986-4394-be54-94c71b14162a', '56066d95-50f2-4c5d-a1ce-56198c1d9423', 'member', 'Roselyn Amit', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('68561fa3-56d4-4504-8817-4b2e5496dce0', '2a18d329-e39d-497b-8833-8478b52ccd44', 'member', 'Marilyn Amit', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('565ccea3-83e4-4658-b091-03899ef2bbed', '9ccad733-39f1-4b81-ac65-b68df8488905', 'member', 'Cristiane Apostol', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('8db7b6b3-6a21-4d69-bc59-735b55ba7008', 'dd72060d-1add-49a6-ad5d-2b79ee7d80d2', 'member', 'Jessamier Apostol', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('e0090aed-2dcf-4fff-84cf-330432a331dc', '49a0c0a7-2759-4572-9c15-d2380114537c', 'member', 'Analie Autor', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('38eae22a-37c0-49fc-94e9-9ffe7a21da3e', '8c9be971-aa44-49a1-a513-f2ca9132c821', 'member', 'Jeorge Bahian', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('37e6c6fc-4022-4df0-83c6-1ae672d07105', '381e667c-7eea-42b1-9ce0-0a53aa69af9c', 'member', 'Megan Bacus', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('ecea2ecc-53a2-4722-a6b5-323b87262be3', '820c6797-ec42-44a0-839e-334dc6dc488e', 'member', 'Virgillia Bacus', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('cc9b7eea-7e0c-4872-bfe8-e737cc4f732a', '6b91a41a-a82e-4b0d-9a03-437cd678cc1d', 'member', 'Reymond Banguiran', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('b15f38c2-73d5-4013-b542-7b250ebbef0f', '5ebbb709-4817-4465-8f07-abeb79b8fe66', 'member', 'Baoy Ester', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('71713857-6fcc-4807-8697-f178e19f8e74', '5bb83520-89b0-4290-bbb0-d2e298064a2c', 'member', 'Baoy Ma.Cristine', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('28e4ff31-f061-4f10-8010-f9ff86537a48', '71bcb419-e85e-490d-aa66-b42ff492a7cf', 'member', 'Ma.Riza Batayola', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('634e1bd9-ab12-46fe-99ae-e3945bc2ae29', 'e892c534-ca10-4a86-b1db-a0e3ed305abd', 'member', 'Charlie Bicbic', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('2a5d8329-dce2-4c81-8ed7-93448a9c92ab', '087f9f45-40c3-42ba-9187-085dbfc1d984', 'member', 'Bec Micho Bec', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('e9215ec7-3f43-4fec-9f15-f336c75518ab', '86a17dcb-3713-4976-8701-decb0d15f486', 'member', 'Brian Barraca', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('539426c0-66c2-4701-94df-07357c25248d', 'e8d19d6a-a6a1-4dee-8e3b-56253f3794ce', 'member', 'Joseph Bracero', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('f20dc9e0-8a60-4f9e-914e-dcd6921c19c4', '7044c2c7-27c5-4d68-b715-aae0dd6c0977', 'member', 'Lea Buenaconsejo', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('0a145a52-1385-4388-9193-cd0dd895a3b3', '834ee026-fc35-473e-a34b-804d14c6a4bd', 'member', 'Liberata Canacao', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('78a6503c-bcd2-4b5f-90ed-a8900df03e6b', '5fe04b5f-d536-4b48-a17f-afdd95131b5a', 'member', 'Wilfredo Canacao', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('aa78659e-ac8b-4e4b-aafa-5f7701d019ad', '3b354e50-04bd-4878-826c-eca1b851f2e8', 'member', 'Irishel Cañete', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('7cf5178e-e62a-4395-8cb7-2b6e01ae9bc4', 'b7203b3a-71fe-49dd-846c-f14761dc1b15', 'member', 'Jordan Carulasan', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('a572d81b-1571-456a-9d17-04e197688da2', 'bf31960a-467f-4abb-9df2-3f824a04f614', 'member', 'Wilson Castaneda', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('26b5ef41-613c-40ee-a00b-b20c522b487d', 'a9af5466-0be0-4bc5-a8c7-39c8fc990822', 'member', 'Rosalinda Catam-Isan', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('350fe3b7-8a20-4b66-9915-7e7b3becaa6d', '9d72d652-093a-48f1-aa2d-f90e7c7296ce', 'member', 'Monico Catulong', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('848207ba-3a15-4406-86cb-fc5274d47023', '7b7dc269-3db7-4153-b459-ae47cf332148', 'member', 'Corazon Cuizon', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('4877d859-f6ae-4d38-bd32-ccdf95e9382f', 'df3a6923-3786-40dc-ae78-06a8c7dd1850', 'member', 'Benzon Delavictoria', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('22abbf52-31d7-4566-9384-87aa6f6d5ec5', 'f074d1d1-6689-45b6-8a4b-d6e87c7c5b0e', 'member', 'Edielone Elustrisimo', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('7cbc8b7f-f22e-4335-a639-1f2e38e9a7c9', '24c5ebe1-9831-4888-9f5a-5bc9b06d7efa', 'member', 'Haydee Delavictoria', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('df76bb73-1227-4107-87f2-538caec0f5ee', 'fcdb3efc-6dfc-4c0e-9f71-3baf6a857afd', 'member', 'Oliver-Transfer Justin Fernandez', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('7e9fac36-b0ee-415a-8ae4-7c220941ff2f', 'f604b874-c1e3-4133-b613-6ae4f0d38f7d', 'member', 'Dino Huerti', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('eaa35825-b80b-4d15-ac71-49f9d452c83d', '5f376b4d-3511-4fe3-9fef-175ee987f87e', 'member', 'Shela Mae Fuentes', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('595ee36c-c09d-419d-aa37-c8263a95b952', '2bbb1d73-cf9c-4421-a8c1-91f225983784', 'member', 'Lucas Garga', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('e4d43305-f29c-448c-8dc7-e2058fc66688', 'b9f1a998-746e-4893-951f-ae0acb779de9', 'member', 'Agosta Gabriel', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('8700e8ee-2263-47d1-adb1-8136ad3aa23c', '2ee06f84-8c07-43b3-97c2-9343d26585f1', 'member', 'Maria Gonzales', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('03814ffe-8f60-45f0-a021-1a3fde0fb045', '154b6706-f474-42c7-8445-f3ce5b6904c2', 'member', 'Romel Generalao', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('ea7b1e3c-7af7-4adb-b9c5-00452c39456f', 'fee09941-ac2f-4876-aeb7-c15c2a4d1e10', 'member', 'Kevin Illustrisimo', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('a0ee8655-ed78-4a36-a80a-c7469da81995', '733c4be3-3b67-43cc-a807-90c808a7bab3', 'member', 'Jurie-Nathaniel Alisbo Filipinas', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('eb899683-3f82-4e8e-bfb7-61d2c5bec08d', '099b18f8-71f9-46b7-a69a-8493e8cbe6c0', 'member', 'Cerela Jorulan', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('17358009-3eae-47fe-a37d-928816fc5f76', 'a62b9820-8430-44e6-bbc4-bb087e2e43fd', 'member', 'Edgardo Judico', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('989dae0e-af24-48b0-95d7-cda9a3650dbc', '56641a48-093c-422a-8658-d39858f396a9', 'member', 'As Vince Jumao', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('2f741529-1c4b-489b-a489-93095de108e4', '2d0d5892-9279-49b1-8219-1e753087bdb4', 'member', 'As Angel Jumao', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('f5dd11f0-c69d-4995-8ad6-ff8091f93c16', '5e9459d0-7ced-4679-bb76-524c0d540413', 'owner', 'Kanchanampairoj Jovie', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('eb02fbb0-c07c-4fc8-8c97-f8c334591026', 'e83127b2-ec03-4915-b041-ade927e95ccd', 'member', 'Eras Marife Las', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('1daa07f2-4fdc-460c-aed8-3f0b0576b101', 'c33a63ed-df0a-4438-a95b-b1abc5e0c03d', 'member', 'Grethel Laude', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('6a1c3120-3de8-4ed6-aaec-b8d97fd83cef', '306f9f8d-1e1f-480f-ae78-06518a33c177', 'member', 'Sofia Layug', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('2de9d47f-f742-4652-86b9-d9316e60ad6e', '577b45ad-e7ca-4342-966e-4881eb4522cb', 'owner', 'Joselyn Leong', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('15cac695-7a70-4356-858d-14728d10f089', 'c38d5860-f8aa-4540-b002-ffca2da3cc2c', 'member', 'Ryan Llaxamana', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('7640ccf7-c726-4361-9889-d2559c554205', '3e447c16-d5c4-478f-b637-611e78e3ae36', 'member', 'Rene Mariano', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('62347c07-aa20-48b9-a714-c058e7325c0e', 'e8139667-9f3a-4b32-804b-7afb83c8ec4f', 'member', 'Ralfie Montalban', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('9cfd5646-18ed-4644-a73e-371430e5e8f8', '31c78eb2-7b21-4fd7-bc2a-46be717add48', 'member', 'Mc Quary Kyle Liong', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('a1adf861-2059-45fb-b901-6450d0f46756', 'b8772c60-17df-4663-8f2a-445904739e38', 'member', 'Renato Mangunlay', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('b901d6a4-5675-4168-af37-84da3f26aebf', 'adb593c9-3b28-4430-af58-5901315f44fe', 'member', 'Ratchell Nillama', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('38ff8a05-22df-4ee5-9bb7-7f0d7d402b2d', '55d7ca92-c9bd-4d07-aa7e-bbbc41737cff', 'member', 'Ronald Napulis', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('d2566860-6b31-4c17-a02a-9f439a55e614', '9b28682e-924c-49ce-ae6c-76d63b5c049e', 'member', 'Mirasol =Ahongs Pancito', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('0295af7f-7104-4079-87c6-9885cce22023', 'a7c21b84-21f5-405f-b0cb-13819de7952c', 'member', 'Cristopher Patatag', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('8ad8f6b3-e6ff-43a5-83a6-aa09dcad5cf7', 'd2103bf1-57fc-4be4-b87f-017d88bb1a92', 'member', 'Alex Pioquinto', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('594c094e-704f-4dbc-812b-03cb2a1f5421', '63899dd3-eb07-4751-83ff-b153b29c9f64', 'member', 'Pastor Plotenia', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('11b4356e-318d-45cb-a676-14c353081760', '5a37817b-139f-4082-a818-cb7d50514ae0', 'owner', 'Plotenia Ma.Cleofe-', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('895d0b34-822c-4c34-a413-4a1371169397', '3293f191-80ee-4220-b417-a5843f12a2ba', 'member', 'Romeo Jr Ramirez', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('4c18f4d3-b040-482b-a853-f95ab1058c53', '9ba96819-3ff2-4201-bf48-53171e4e40ba', 'member', 'Reymart Rosales', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('13ddac08-c130-480a-82eb-c3dd51247fbd', 'fc494f99-0c4d-4c00-8dff-8799f4460aa2', 'member', 'Kim Rizon', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('f6d7e324-d3c5-48d9-8a02-44cddaba48c8', 'ee1005a8-7cb6-4489-b070-2bfa167dd5d9', 'member', 'Juveline Sagolili', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('d944f819-635e-4955-9b1d-89d06915a4e6', '60253f8e-520a-4445-ad9e-3bcf09fd0220', 'member', 'Alexander Salazar', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('c37fb9e1-650f-48da-a443-21ebd8ad813e', '2489002d-a8b3-42bd-9f35-bb6f69433de2', 'member', 'Emmanuel Sanchez', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('ab0fec15-df7e-404f-9836-f36198b4d20f', '1b1868f3-cc97-4ed2-b47a-92d3d8523424', 'member', 'Rhonvic Sanchez', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('a6bd7146-1517-4fbe-84ec-af1c4a04cd5c', '0d76fd44-f980-4d3e-b10f-c7ddb00a5d0b', 'member', 'Rutchele Sanchez', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('cf9279bb-731f-4d79-8cc4-7d1281013025', '08b7ad68-61dc-4a43-b6e0-f97ed25aa83f', 'member', 'Reymar Saycon', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('56ea4c4d-7978-4b31-a28d-f6d8a75f15fe', 'c2335b57-8c8c-4ac8-9b01-d6e1fb46bfb8', 'member', 'Rogelito Salvo', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('d35b68e4-7870-4cbe-a32c-96ecf0153fa4', 'b371a0b8-79c2-4f8c-8943-826b1e8f382b', 'member', 'Jendelh Soreneo', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('8f1352d6-900d-451c-acab-71d23718ec18', 'd56a4dc0-eeae-4579-8a98-8e889f340f22', 'member', 'Rowena Suello', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('d28bfad6-ddff-497a-aaad-965f459167b9', 'c5672686-2a5a-4e24-b160-74a2a825a475', 'member', 'Juneil Tikling', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('87d3ea7b-3552-4ef8-8c6a-3c412f3a4e4d', 'bf3f9702-2885-4c27-875a-88a035d56f79', 'member', 'Uy Joe', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('2c398350-2029-47a1-a44a-6ce868e9d3d5', '95e4d8d4-1ad8-4dcf-82d6-e8e99768695f', 'owner', 'Josie Uy', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('34a5108b-27a7-4c90-90e0-a42be41095a7', '9303dcf8-506b-4695-9a64-447528d854e3', 'member', 'Anthony Uy Jose', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('f66b5457-9232-48fd-ac49-abd69832a811', '32e83ce8-83a0-4c2f-bb30-71fc71fd74b8', 'member', 'Dolly Yang-Yang', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('309a6190-cfae-4bba-a3a7-9ab81cfbd6a1', '83d7f41d-a373-4741-9444-2abf7281941c', 'member', 'Eduarda Abella', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('1d8ec0f6-c0f6-415e-bc8f-7910d39e21f6', '55af0f6b-42e1-4dd7-b677-d3c8325ef95c', 'member', 'Jandelyn Abong', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('123ca8ff-43c7-4764-8901-1512cbc6eebe', 'f5cc8668-d2e5-439c-8272-76be823f9e02', 'member', 'Acabo Bonita', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('1bf67a4e-d6a4-482d-85e0-d7b40429662e', '3885894a-d563-44df-bf8e-3ffa5542737e', 'member', 'Aguhob Maricel', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('ad94a179-cc62-4b48-ab4f-e0e0b1ca15ce', '87674db7-4a7e-4158-8e5e-1fce7292fdfc', 'member', 'Magdalina Alegarme', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('728ae4e4-c298-4baa-9d0a-b8ac6f7f7261', '62c5b722-eb07-48ca-8747-00f605cb9f16', 'member', 'Mabel Alegarme', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('adb23736-8e4a-49c6-b2dc-abfd101a34d6', 'edea73dc-abcf-45fb-ac02-bb8be9d87329', 'member', 'Lanie Albon', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('2b14ca6e-3078-4f9b-8f63-8a1bda21ba1b', '9cd82115-4ca5-434f-8b2b-4df91b1a59b4', 'member', 'Almario Mikel', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('c5eee7f5-5d2d-4c0f-a5cf-07afdff4e33e', 'b47a9d13-4b81-491a-904f-611a4c2b8fca', 'member', 'Suzette-Sis Kuya Edgar Anodan', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('a9a79186-a203-41f2-8b7e-f834a2bbeba9', '0ffd3e35-2068-481b-bd95-8b0bcacbb853', 'member', 'Alma Asenjo', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('e7965cb1-48a7-415a-a742-6ad96a645d15', '1707ccdf-e604-4055-80bd-5bc23fcbb48f', 'member', 'Judy Bagasbas', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('5d3a9f43-0864-4ed5-a448-231d6b3fbaee', '324b1b04-ba33-42a0-a6cb-b713d2261a62', 'member', 'Ericson Baoy', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('e55ceba9-84c7-4a55-96d9-0352e823977a', '69ded56d-600b-49e5-abea-7ce5badac103', 'member', 'Florencio Baraya', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('68d33d21-3979-4e45-8e38-64d8ce508eb5', '0c628b9b-88db-4bdf-a09b-b67b5a97e35d', 'member', 'Gladwin Caballa', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('50f658ef-5ed9-496e-aa92-21b44e4f253c', '55d143a4-7292-4f87-9e93-347ddd9e5772', 'member', 'Dianne Less 35K Pay Loan Cuarez', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('e68401d7-86f3-48ff-b117-471727b0a761', 'aca68062-71c7-46b7-876f-a3b405a5538d', 'member', 'Reymart Calumba', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('dddcbac2-b9d0-4cfe-9e58-895e5cfd44fe', '739af10b-5ea8-48df-88fd-a06594c4db27', 'member', 'Merly Dejeto', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('b93d39a9-1890-4781-a99e-2e15cf0d7940', 'f02d47d9-efad-4736-bc74-60a5bac08a7b', 'member', 'Gabato Dante', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('c93735ff-c755-434c-8a29-73b31121cd68', '5d39f7c8-518b-45ef-ae86-cfb8b4fab3f5', 'member', 'Ma.Lonie Gabriel', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('c247dc24-fab5-435e-805b-6c1cb88884e3', '6ceb9bed-9af1-441a-bd2b-499e3e1c3a81', 'member', 'Gonzaga Lito', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('04449aa4-9d68-4740-8f15-ccfe4c51a555', 'e8512b7c-8a7b-4bdf-9aed-e7b89eb078e3', 'member', 'Kevin Gonzales', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('f43322f0-138f-4a0e-bec9-c8f38257b1af', '26cc7075-1440-4c77-8cd0-89ab8168d19b', 'member', 'Mary Rose Gonzales', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('a4ffc224-5e7f-4364-b95e-f841a5bd6b8d', 'c92c80ca-2d33-48b2-ada5-ed51cc2e2434', 'member', 'Armela Halos', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('72782906-84ce-4b7d-81ae-6e6cd1550ce5', '45a6fa23-c29d-42fe-a1ec-2058cbf6516c', 'member', 'Michael Jorolan', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('7d52104d-90ef-4a9b-a73a-f1a1da2e00e8', '43811e6e-89b7-451a-b5c3-d27bb352089b', 'member', 'Fe Inihao', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('849988ea-350f-485d-a642-a7aa91d57a1d', 'd1140de8-95ab-4c62-b527-375cb901d2c1', 'member', 'Erlinda Kismundo', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('0cdb9357-cbee-4d3e-885c-df6bdcf9c79b', '3ee90b37-65c3-43d2-bb5e-2341552f40c3', 'member', 'Lorena Kismundo', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('bbf2f5a7-3587-46ab-9edb-50a21cbad6a8', 'cf4ca3bf-ebbb-4420-b2fa-33bbf776b1e0', 'member', 'Ramon Kismundo', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('2a1f8cfa-fb98-44dd-aa7c-e667b57cb810', '4569fe61-a019-4053-afd5-8a855aa9f917', 'member', 'Jaime Kanchanapairoj', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('c954ae31-88f5-4143-be6e-c62a038328a5', '9dfd4109-4f92-44c8-aec0-7b7cdc0feb4b', 'member', 'James Kanchanapairoj', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('ab0080f4-543a-4018-9118-c9138143ec4f', 'b8397bd0-b148-4bce-8b42-bd2fca670a74', 'member', 'Julius Laiz', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('850e21f4-b754-40bd-9211-c96d60c29c9e', 'eb9592ea-9aae-45a2-865d-22f90883903a', 'member', 'Gemma Layson', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('562a3ff0-3c50-4224-907b-2790c48a6fbd', '25970ed0-bf1f-4cc1-92b0-d2b26f3afe3e', 'member', 'Chine Lobiano', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('4ab694d4-51a9-4495-aa8a-48446763d3ff', '2d02746b-a468-49fa-8c0d-67c7d539cccd', 'member', 'Kimberly Magallon', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('4c11955b-eaed-4710-97ad-f25e7775bb7e', '3c849536-20db-4b95-acb3-6126d078e77e', 'member', 'Miraflor Mirasol', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('e27606d9-9be1-4042-ae64-51f895c02867', '93e75c35-d70f-4566-b0e5-34abd86783d1', 'member', 'Mila Mendoza', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('799212c1-f48d-4e60-ad8d-ae0bf7436ae8', '49264683-2f7a-4a33-9821-5944851ead88', 'member', 'Nemenio Primo', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('40404ebe-ecc2-45bf-877d-7d97006255b4', '1f41a179-dc25-47d7-865f-fc2e9474aa72', 'member', 'Agnes Nillas', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('302f68a4-ced1-434d-b3d6-7d9422696ea6', '13d62c94-ee14-41e8-915e-f2e0e1d5efc2', 'member', 'Ryan Omandam', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('afc74491-d01d-4b4d-9fc9-e199b290bf75', '487985e4-17d4-4449-acf8-3ea61e97d7cc', 'member', 'Chanelita Padin', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('b41b826f-72f4-4a24-b7fc-694952455e67', '2fa58400-2419-48c8-89a0-ca890ec88f03', 'member', 'Helen Perales', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('9db80205-c415-4b63-af54-0a4722abd775', 'a9911e61-f551-4184-be44-6cea7b026e24', 'member', 'Perez Joice', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('7efc9f1e-c19a-4551-a2e3-1d8c12d58ca9', '926e3ccc-4656-4cbc-ba0f-0ab8e02c893b', 'member', 'Eugenia Plotenia', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('46a9a1aa-1af8-46d1-ab9d-bb3a6500dec2', 'aea775f8-ee54-4155-b56b-fd66c1e76c12', 'member', 'Rigor=Transfer To Sir Joe 10K Plando', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('e93a3a46-7e24-47b9-b254-15178072bf21', '9b5292e4-5a17-4482-8b19-5fed75d821d3', 'member', 'Mariel Quilat', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('b874dd35-f192-469c-8b7b-4c4d2b9a1128', 'f2e92340-8b3c-4cbe-ba87-105d1ae74198', 'member', 'Gina Saberon', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('267f6687-797e-40db-9727-c5f5a81c63b0', 'fd8c1e4a-5589-4543-bf7c-802b2bcc995a', 'member', 'Sermilon Samer', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('889b498e-7625-47c6-8057-27c502f377fa', '55744579-d756-4d97-b3ed-c22fcaf3b6ad', 'member', 'Shirly Sedon', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('3cb75ce7-5a10-4730-94c0-687aa988a0a3', '966ca935-ccb3-4ba2-8f58-87c067ffa4e3', 'member', 'Jonie Repdos', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('54b88133-126f-4184-8fc0-9f7d20260fdc', '00d2e455-71fa-4746-b78c-d06075addbc9', 'member', 'Lemuel-Withdraw Pay Loan Sencil', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('5c79b88a-8939-45ce-89ed-b8aca84cf827', '509568f0-22f8-4034-be42-4da05ba9cc01', 'member', 'Marichu Silva', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('c24c39f8-8413-42a6-bc65-e0ab4d779b0c', 'f173418c-deb4-4c48-90e7-7a7ca446b1c6', 'member', 'Mildred Sumampong', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('b0417094-e8c1-482d-bda7-1c41aa03a1c3', 'fceaac81-d11d-4dff-820a-688587c6f9c5', 'member', 'Sumampong Almae', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('72781bb5-d533-4eb8-af29-2040f1ed7dca', '121af14b-b90c-48e9-a2e7-97cf34362898', 'member', 'Ma.Lotis Solero', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('dac5c784-ea6b-4d72-b017-4d21268bfae6', '0e05aea8-4994-46ca-95b6-2ddde6511584', 'member', 'Rowel Rodrigues', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('de7b2f22-9ab1-4975-843a-a07394b45f73', '735ea21f-0f67-4909-9e57-feb712ee279c', 'member', 'Elsa Talingting', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('ff3c4585-4bb5-41d6-a1c8-e9579191a37a', '7600b5b1-1a7d-4208-a41e-2b5d37a12ec3', 'member', 'Marissa Tampos', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('a72a3538-f67b-4a52-9e96-9f059b839284', '4d0fc613-1a8b-4894-9fa3-7826362f0225', 'owner', 'Uy Vicky', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('1da83a9c-2f15-4dba-a730-8a81f1d5176b', '6a6766a1-55ac-496f-88b8-a76663ee5656', 'owner', 'Uy Jona', true);
INSERT INTO profiles (id, member_id, role, display_name, first_login)
VALUES ('06751019-b286-42bd-8df1-a304fd0d68d2', 'dafb7be0-1a66-44b6-99dd-6b631c7bf22b', 'member', 'Ronald Uy', true);

-- Share Capital
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('f40777d4-15b6-4304-8625-38373b20c3f9', 60000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('5f0ef312-17d3-4f2a-b2dd-502d2badde7b', 1028.56, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('cf0697cd-a44e-4665-a2f6-5f91b72e271d', 5000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('a498cb9a-2444-4f70-acc5-58d114fd42fe', 3000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('8e2cd01e-e60d-42b8-ad20-cde2ead603f8', 55000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('806f2eee-8e93-4e86-933b-86debe01501d', 10000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('dd13aa81-81b8-431e-808e-9bb289cbd9f6', 70000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('21735b8d-02bc-4164-a701-1f6fb4b97329', 2000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('56066d95-50f2-4c5d-a1ce-56198c1d9423', 5000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('2a18d329-e39d-497b-8833-8478b52ccd44', 5000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('9ccad733-39f1-4b81-ac65-b68df8488905', 10000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('dd72060d-1add-49a6-ad5d-2b79ee7d80d2', 10000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('49a0c0a7-2759-4572-9c15-d2380114537c', 10000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('8c9be971-aa44-49a1-a513-f2ca9132c821', 2000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('381e667c-7eea-42b1-9ce0-0a53aa69af9c', 3000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('820c6797-ec42-44a0-839e-334dc6dc488e', 138000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('6b91a41a-a82e-4b0d-9a03-437cd678cc1d', 3000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('5ebbb709-4817-4465-8f07-abeb79b8fe66', 10000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('5bb83520-89b0-4290-bbb0-d2e298064a2c', 3000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('71bcb419-e85e-490d-aa66-b42ff492a7cf', 25000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('e892c534-ca10-4a86-b1db-a0e3ed305abd', 30000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('087f9f45-40c3-42ba-9187-085dbfc1d984', 2000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('86a17dcb-3713-4976-8701-decb0d15f486', 15000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('e8d19d6a-a6a1-4dee-8e3b-56253f3794ce', 4000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('7044c2c7-27c5-4d68-b715-aae0dd6c0977', 2750.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('834ee026-fc35-473e-a34b-804d14c6a4bd', 80000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('5fe04b5f-d536-4b48-a17f-afdd95131b5a', 100000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('3b354e50-04bd-4878-826c-eca1b851f2e8', 5000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('b7203b3a-71fe-49dd-846c-f14761dc1b15', 5000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('bf31960a-467f-4abb-9df2-3f824a04f614', 150000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('a9af5466-0be0-4bc5-a8c7-39c8fc990822', 5000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('9d72d652-093a-48f1-aa2d-f90e7c7296ce', 4000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('7b7dc269-3db7-4153-b459-ae47cf332148', 50000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('df3a6923-3786-40dc-ae78-06a8c7dd1850', 15000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('f074d1d1-6689-45b6-8a4b-d6e87c7c5b0e', 20000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('24c5ebe1-9831-4888-9f5a-5bc9b06d7efa', 1100.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('fcdb3efc-6dfc-4c0e-9f71-3baf6a857afd', 30000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('f604b874-c1e3-4133-b613-6ae4f0d38f7d', 5000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('5f376b4d-3511-4fe3-9fef-175ee987f87e', 115000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('2bbb1d73-cf9c-4421-a8c1-91f225983784', 2000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('b9f1a998-746e-4893-951f-ae0acb779de9', 5000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('2ee06f84-8c07-43b3-97c2-9343d26585f1', 15000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('154b6706-f474-42c7-8445-f3ce5b6904c2', 5100.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('fee09941-ac2f-4876-aeb7-c15c2a4d1e10', 5000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('733c4be3-3b67-43cc-a807-90c808a7bab3', 2000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('099b18f8-71f9-46b7-a69a-8493e8cbe6c0', 35000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('a62b9820-8430-44e6-bbc4-bb087e2e43fd', 45000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('56641a48-093c-422a-8658-d39858f396a9', 1600.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('2d0d5892-9279-49b1-8219-1e753087bdb4', 2000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('5e9459d0-7ced-4679-bb76-524c0d540413', 271946.82, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('e83127b2-ec03-4915-b041-ade927e95ccd', 40000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('c33a63ed-df0a-4438-a95b-b1abc5e0c03d', 5000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('306f9f8d-1e1f-480f-ae78-06518a33c177', 3000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('577b45ad-e7ca-4342-966e-4881eb4522cb', 234000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('c38d5860-f8aa-4540-b002-ffca2da3cc2c', 1600.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('3e447c16-d5c4-478f-b637-611e78e3ae36', 5000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('e8139667-9f3a-4b32-804b-7afb83c8ec4f', 25000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('31c78eb2-7b21-4fd7-bc2a-46be717add48', 8500.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('b8772c60-17df-4663-8f2a-445904739e38', 15000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('adb593c9-3b28-4430-af58-5901315f44fe', 12000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('55d7ca92-c9bd-4d07-aa7e-bbbc41737cff', 3500.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('9b28682e-924c-49ce-ae6c-76d63b5c049e', 15000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('a7c21b84-21f5-405f-b0cb-13819de7952c', 7500.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('d2103bf1-57fc-4be4-b87f-017d88bb1a92', 3000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('63899dd3-eb07-4751-83ff-b153b29c9f64', 180000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('5a37817b-139f-4082-a818-cb7d50514ae0', 200000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('3293f191-80ee-4220-b417-a5843f12a2ba', 10000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('9ba96819-3ff2-4201-bf48-53171e4e40ba', 2200.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('fc494f99-0c4d-4c00-8dff-8799f4460aa2', 1400.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('ee1005a8-7cb6-4489-b070-2bfa167dd5d9', 50000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('60253f8e-520a-4445-ad9e-3bcf09fd0220', 2100.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('2489002d-a8b3-42bd-9f35-bb6f69433de2', 6000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('1b1868f3-cc97-4ed2-b47a-92d3d8523424', 7000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('0d76fd44-f980-4d3e-b10f-c7ddb00a5d0b', 20000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('08b7ad68-61dc-4a43-b6e0-f97ed25aa83f', 10000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('c2335b57-8c8c-4ac8-9b01-d6e1fb46bfb8', 5000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('b371a0b8-79c2-4f8c-8943-826b1e8f382b', 2300.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('d56a4dc0-eeae-4579-8a98-8e889f340f22', 2000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('c5672686-2a5a-4e24-b160-74a2a825a475', 3000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('bf3f9702-2885-4c27-875a-88a035d56f79', 51582.06, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('95e4d8d4-1ad8-4dcf-82d6-e8e99768695f', 300422.24, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('9303dcf8-506b-4695-9a64-447528d854e3', 150000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('32e83ce8-83a0-4c2f-bb30-71fc71fd74b8', 5000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('83d7f41d-a373-4741-9444-2abf7281941c', 32411.57, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('55af0f6b-42e1-4dd7-b677-d3c8325ef95c', 14032.02, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('f5cc8668-d2e5-439c-8272-76be823f9e02', 3000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('3885894a-d563-44df-bf8e-3ffa5542737e', 5000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('87674db7-4a7e-4158-8e5e-1fce7292fdfc', 5000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('62c5b722-eb07-48ca-8747-00f605cb9f16', 1500.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('edea73dc-abcf-45fb-ac02-bb8be9d87329', 25000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('9cd82115-4ca5-434f-8b2b-4df91b1a59b4', 1000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('b47a9d13-4b81-491a-904f-611a4c2b8fca', 10000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('0ffd3e35-2068-481b-bd95-8b0bcacbb853', 5000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('1707ccdf-e604-4055-80bd-5bc23fcbb48f', 5000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('324b1b04-ba33-42a0-a6cb-b713d2261a62', 6000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('69ded56d-600b-49e5-abea-7ce5badac103', 13000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('0c628b9b-88db-4bdf-a09b-b67b5a97e35d', 5000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('55d143a4-7292-4f87-9e93-347ddd9e5772', 10000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('aca68062-71c7-46b7-876f-a3b405a5538d', 2500.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('739af10b-5ea8-48df-88fd-a06594c4db27', 13000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('f02d47d9-efad-4736-bc74-60a5bac08a7b', 1000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('5d39f7c8-518b-45ef-ae86-cfb8b4fab3f5', 8985.85, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('6ceb9bed-9af1-441a-bd2b-499e3e1c3a81', 3000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('e8512b7c-8a7b-4bdf-9aed-e7b89eb078e3', 2000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('26cc7075-1440-4c77-8cd0-89ab8168d19b', 11000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('c92c80ca-2d33-48b2-ada5-ed51cc2e2434', 70000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('45a6fa23-c29d-42fe-a1ec-2058cbf6516c', 1500.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('43811e6e-89b7-451a-b5c3-d27bb352089b', 15000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('d1140de8-95ab-4c62-b527-375cb901d2c1', 8000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('3ee90b37-65c3-43d2-bb5e-2341552f40c3', 10000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('cf4ca3bf-ebbb-4420-b2fa-33bbf776b1e0', 10000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('4569fe61-a019-4053-afd5-8a855aa9f917', 38185.40, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('9dfd4109-4f92-44c8-aec0-7b7cdc0feb4b', 38093.26, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('b8397bd0-b148-4bce-8b42-bd2fca670a74', 10000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('eb9592ea-9aae-45a2-865d-22f90883903a', 14000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('25970ed0-bf1f-4cc1-92b0-d2b26f3afe3e', 10754.07, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('2d02746b-a468-49fa-8c0d-67c7d539cccd', 17000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('3c849536-20db-4b95-acb3-6126d078e77e', 116000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('93e75c35-d70f-4566-b0e5-34abd86783d1', 29363.07, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('49264683-2f7a-4a33-9821-5944851ead88', 113656.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('1f41a179-dc25-47d7-865f-fc2e9474aa72', 30210.34, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('13d62c94-ee14-41e8-915e-f2e0e1d5efc2', 2200.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('487985e4-17d4-4449-acf8-3ea61e97d7cc', 5000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('2fa58400-2419-48c8-89a0-ca890ec88f03', 5000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('a9911e61-f551-4184-be44-6cea7b026e24', 2000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('926e3ccc-4656-4cbc-ba0f-0ab8e02c893b', 50000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('aea775f8-ee54-4155-b56b-fd66c1e76c12', 1194.91, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('9b5292e4-5a17-4482-8b19-5fed75d821d3', 10000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('f2e92340-8b3c-4cbe-ba87-105d1ae74198', 5000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('fd8c1e4a-5589-4543-bf7c-802b2bcc995a', 10000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('55744579-d756-4d97-b3ed-c22fcaf3b6ad', 5000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('966ca935-ccb3-4ba2-8f58-87c067ffa4e3', 3000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('509568f0-22f8-4034-be42-4da05ba9cc01', 10000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('f173418c-deb4-4c48-90e7-7a7ca446b1c6', 4000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('fceaac81-d11d-4dff-820a-688587c6f9c5', 10000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('121af14b-b90c-48e9-a2e7-97cf34362898', 27500.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('0e05aea8-4994-46ca-95b6-2ddde6511584', 8000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('735ea21f-0f67-4909-9e57-feb712ee279c', 16000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('4d0fc613-1a8b-4894-9fa3-7826362f0225', 605073.69, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('6a6766a1-55ac-496f-88b8-a76663ee5656', 1374186.49, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');
INSERT INTO contributions (member_id, amount, cutoff_period, cutoff_date, payment_date, notes)
VALUES ('dafb7be0-1a66-44b6-99dd-6b631c7bf22b', 145000.00, '2026-03-2ND', '2026-03-15', '2026-03-15', 'Capital seeded from FY2025-2026 dividend records');

-- Outstanding Loans (balances as of April 2026)
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('5f0ef312-17d3-4f2a-b2dd-502d2badde7b', 1, 'regular', 1664.22, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('cf0697cd-a44e-4665-a2f6-5f91b72e271d', 1, 'regular', 5998.58, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('a498cb9a-2444-4f70-acc5-58d114fd42fe', 1, 'regular', 9000.00, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('dd13aa81-81b8-431e-808e-9bb289cbd9f6', 1, 'regular', 7486.28, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('21735b8d-02bc-4164-a701-1f6fb4b97329', 1, 'regular', 11491.75, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('56066d95-50f2-4c5d-a1ce-56198c1d9423', 1, 'regular', 6000.00, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('2a18d329-e39d-497b-8833-8478b52ccd44', 1, 'regular', 3150.87, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('9ccad733-39f1-4b81-ac65-b68df8488905', 1, 'regular', 353.80, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('dd72060d-1add-49a6-ad5d-2b79ee7d80d2', 1, 'regular', 11174.70, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('49a0c0a7-2759-4572-9c15-d2380114537c', 1, 'regular', 92653.64, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('381e667c-7eea-42b1-9ce0-0a53aa69af9c', 1, 'regular', 8519.45, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('5ebbb709-4817-4465-8f07-abeb79b8fe66', 1, 'regular', 32523.86, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('5bb83520-89b0-4290-bbb0-d2e298064a2c', 1, 'regular', 19537.19, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('71bcb419-e85e-490d-aa66-b42ff492a7cf', 1, 'regular', 16447.40, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('86a17dcb-3713-4976-8701-decb0d15f486', 1, 'regular', 21105.46, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('e8d19d6a-a6a1-4dee-8e3b-56253f3794ce', 1, 'regular', 3438.80, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('7044c2c7-27c5-4d68-b715-aae0dd6c0977', 1, 'regular', 3319.47, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('b7203b3a-71fe-49dd-846c-f14761dc1b15', 1, 'regular', 7610.44, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('bf31960a-467f-4abb-9df2-3f824a04f614', 1, 'regular', 55911.16, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('9d72d652-093a-48f1-aa2d-f90e7c7296ce', 1, 'regular', 5820.90, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('7b7dc269-3db7-4153-b459-ae47cf332148', 1, 'regular', 38152.53, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('f074d1d1-6689-45b6-8a4b-d6e87c7c5b0e', 1, 'regular', 55720.14, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('b9f1a998-746e-4893-951f-ae0acb779de9', 1, 'regular', 10000.00, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('154b6706-f474-42c7-8445-f3ce5b6904c2', 1, 'regular', 318.77, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('099b18f8-71f9-46b7-a69a-8493e8cbe6c0', 1, 'regular', 19214.00, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('a62b9820-8430-44e6-bbc4-bb087e2e43fd', 1, 'regular', 31943.11, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('c33a63ed-df0a-4438-a95b-b1abc5e0c03d', 1, 'regular', 15000.00, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('306f9f8d-1e1f-480f-ae78-06518a33c177', 1, 'regular', 5140.00, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('577b45ad-e7ca-4342-966e-4881eb4522cb', 1, 'regular', 12057.76, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('e8139667-9f3a-4b32-804b-7afb83c8ec4f', 1, 'regular', 32606.97, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('adb593c9-3b28-4430-af58-5901315f44fe', 1, 'regular', 6179.16, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('a7c21b84-21f5-405f-b0cb-13819de7952c', 1, 'regular', 14273.79, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('63899dd3-eb07-4751-83ff-b153b29c9f64', 1, 'regular', 6904.60, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('5a37817b-139f-4082-a818-cb7d50514ae0', 1, 'regular', 69811.70, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('ee1005a8-7cb6-4489-b070-2bfa167dd5d9', 1, 'regular', 11915.77, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('60253f8e-520a-4445-ad9e-3bcf09fd0220', 1, 'regular', 1262.90, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('2489002d-a8b3-42bd-9f35-bb6f69433de2', 1, 'regular', 6272.72, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('1b1868f3-cc97-4ed2-b47a-92d3d8523424', 1, 'regular', 10000.00, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('0d76fd44-f980-4d3e-b10f-c7ddb00a5d0b', 1, 'regular', 25548.65, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('c2335b57-8c8c-4ac8-9b01-d6e1fb46bfb8', 1, 'regular', 10000.00, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('c5672686-2a5a-4e24-b160-74a2a825a475', 1, 'regular', 13565.80, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('87674db7-4a7e-4158-8e5e-1fce7292fdfc', 1, 'regular', 6231.31, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('1707ccdf-e604-4055-80bd-5bc23fcbb48f', 1, 'regular', 7397.27, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('324b1b04-ba33-42a0-a6cb-b713d2261a62', 1, 'regular', 18476.53, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('69ded56d-600b-49e5-abea-7ce5badac103', 1, 'regular', 16651.20, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('aca68062-71c7-46b7-876f-a3b405a5538d', 1, 'regular', 4012.02, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('739af10b-5ea8-48df-88fd-a06594c4db27', 1, 'regular', 16726.11, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('f02d47d9-efad-4736-bc74-60a5bac08a7b', 1, 'regular', 3938.29, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('e8512b7c-8a7b-4bdf-9aed-e7b89eb078e3', 1, 'regular', 3987.42, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('c92c80ca-2d33-48b2-ada5-ed51cc2e2434', 1, 'regular', 121742.84, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('43811e6e-89b7-451a-b5c3-d27bb352089b', 1, 'regular', 32624.36, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('3ee90b37-65c3-43d2-bb5e-2341552f40c3', 1, 'regular', 6002.03, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('cf4ca3bf-ebbb-4420-b2fa-33bbf776b1e0', 1, 'regular', 10732.39, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('b8397bd0-b148-4bce-8b42-bd2fca670a74', 1, 'regular', 11172.30, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('eb9592ea-9aae-45a2-865d-22f90883903a', 1, 'regular', 95610.72, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('2d02746b-a468-49fa-8c0d-67c7d539cccd', 1, 'regular', 63258.03, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('13d62c94-ee14-41e8-915e-f2e0e1d5efc2', 1, 'regular', 2364.49, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('2fa58400-2419-48c8-89a0-ca890ec88f03', 1, 'regular', 10487.82, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('9b5292e4-5a17-4482-8b19-5fed75d821d3', 1, 'regular', 36668.76, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('f2e92340-8b3c-4cbe-ba87-105d1ae74198', 1, 'regular', 2069.55, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('fd8c1e4a-5589-4543-bf7c-802b2bcc995a', 1, 'regular', 11360.40, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('966ca935-ccb3-4ba2-8f58-87c067ffa4e3', 1, 'regular', 13989.13, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('509568f0-22f8-4034-be42-4da05ba9cc01', 1, 'regular', 80351.67, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('f173418c-deb4-4c48-90e7-7a7ca446b1c6', 1, 'regular', 37251.02, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');
INSERT INTO loans (member_id, loan_number, loan_type, principal_amount, interest_rate, date_applied, date_released, status, notes)
VALUES ('121af14b-b90c-48e9-a2e7-97cf34362898', 1, 'regular', 59795.66, 2.00, '2020-01-01', '2020-01-01', 'released', 'Balance as of April 2026 seeded from Excel');

-- ============================================================
-- CREDENTIAL REFERENCE — distribute to members, then delete this section
-- Name                              | Temp Email                                      | Temp Password
-- Mariza Abellana                     | mariza.abellana@rcccoop.com                      | abellana1234
-- Jomar Abellana                      | jomar.abellana@rcccoop.com                       | abellana1234
-- Renato Abais                        | renato.abais@rcccoop.com                         | abais1234
-- John Ervin Abayan                   | john.abayan@rcccoop.com                          | abayan1234
-- Jay Arganza                         | jay.arganza@rcccoop.com                          | arganza1234
-- Kim-Rider Abordonado                | kimrider.abordonado@rcccoop.com                  | abordonado1234
-- Myrna Almocera                      | myrna.almocera@rcccoop.com                       | almocera1234
-- Marlon Anon                         | marlon.anon@rcccoop.com                          | anon1234
-- Roselyn Amit                        | roselyn.amit@rcccoop.com                         | amit1234
-- Marilyn Amit                        | marilyn.amit@rcccoop.com                         | amit1234
-- Cristiane Apostol                   | cristiane.apostol@rcccoop.com                    | apostol1234
-- Jessamier Apostol                   | jessamier.apostol@rcccoop.com                    | apostol1234
-- Analie Autor                        | analie.autor@rcccoop.com                         | autor1234
-- Jeorge Bahian                       | jeorge.bahian@rcccoop.com                        | bahian1234
-- Megan Bacus                         | megan.bacus@rcccoop.com                          | bacus1234
-- Virgillia Bacus                     | virgillia.bacus@rcccoop.com                      | bacus1234
-- Reymond Banguiran                   | reymond.banguiran@rcccoop.com                    | banguiran1234
-- Baoy Ester                          | baoy.ester@rcccoop.com                           | ester1234
-- Baoy Ma.Cristine                    | baoy.macristine@rcccoop.com                      | macristine1234
-- Ma.Riza Batayola                    | mariza.batayola@rcccoop.com                      | batayola1234
-- Charlie Bicbic                      | charlie.bicbic@rcccoop.com                       | bicbic1234
-- Bec Micho Bec                       | bec.bec@rcccoop.com                              | bec1234
-- Brian Barraca                       | brian.barraca@rcccoop.com                        | barraca1234
-- Joseph Bracero                      | joseph.bracero@rcccoop.com                       | bracero1234
-- Lea Buenaconsejo                    | lea.buenaconsejo@rcccoop.com                     | buenaconsejo1234
-- Liberata Canacao                    | liberata.canacao@rcccoop.com                     | canacao1234
-- Wilfredo Canacao                    | wilfredo.canacao@rcccoop.com                     | canacao1234
-- Irishel Cañete                      | irishel.caete@rcccoop.com                        | caete1234
-- Jordan Carulasan                    | jordan.carulasan@rcccoop.com                     | carulasan1234
-- Wilson Castaneda                    | wilson.castaneda@rcccoop.com                     | castaneda1234
-- Rosalinda Catam-Isan                | rosalinda.catamisan@rcccoop.com                  | catamisan1234
-- Monico Catulong                     | monico.catulong@rcccoop.com                      | catulong1234
-- Corazon Cuizon                      | corazon.cuizon@rcccoop.com                       | cuizon1234
-- Benzon Delavictoria                 | benzon.delavictoria@rcccoop.com                  | delavictoria1234
-- Edielone Elustrisimo                | edielone.elustrisimo@rcccoop.com                 | elustrisimo1234
-- Haydee Delavictoria                 | haydee.delavictoria@rcccoop.com                  | delavictoria1234
-- Oliver-Transfer Justin Fernandez    | olivertransfer.fernandez@rcccoop.com             | fernandez1234
-- Dino Huerti                         | dino.huerti@rcccoop.com                          | huerti1234
-- Shela Mae Fuentes                   | shela.fuentes@rcccoop.com                        | fuentes1234
-- Lucas Garga                         | lucas.garga@rcccoop.com                          | garga1234
-- Agosta Gabriel                      | agosta.gabriel@rcccoop.com                       | gabriel1234
-- Maria Gonzales                      | maria.gonzales@rcccoop.com                       | gonzales1234
-- Romel Generalao                     | romel.generalao@rcccoop.com                      | generalao1234
-- Kevin Illustrisimo                  | kevin.illustrisimo@rcccoop.com                   | illustrisimo1234
-- Jurie-Nathaniel Alisbo Filipinas    | jurienathaniel.filipinas@rcccoop.com             | filipinas1234
-- Cerela Jorulan                      | cerela.jorulan@rcccoop.com                       | jorulan1234
-- Edgardo Judico                      | edgardo.judico@rcccoop.com                       | judico1234
-- As Vince Jumao                      | as.jumao@rcccoop.com                             | jumao1234
-- As Angel Jumao                      | as.jumao2@rcccoop.com                            | jumao1234
-- Kanchanampairoj Jovie               | kanchanampairoj.jovie@rcccoop.com                | jovie1234
-- Eras Marife Las                     | eras.las@rcccoop.com                             | las1234
-- Grethel Laude                       | grethel.laude@rcccoop.com                        | laude1234
-- Sofia Layug                         | sofia.layug@rcccoop.com                          | layug1234
-- Joselyn Leong                       | joselyn.leong@rcccoop.com                        | leong1234
-- Ryan Llaxamana                      | ryan.llaxamana@rcccoop.com                       | llaxamana1234
-- Rene Mariano                        | rene.mariano@rcccoop.com                         | mariano1234
-- Ralfie Montalban                    | ralfie.montalban@rcccoop.com                     | montalban1234
-- Mc Quary Kyle Liong                 | mc.liong@rcccoop.com                             | liong1234
-- Renato Mangunlay                    | renato.mangunlay@rcccoop.com                     | mangunlay1234
-- Ratchell Nillama                    | ratchell.nillama@rcccoop.com                     | nillama1234
-- Ronald Napulis                      | ronald.napulis@rcccoop.com                       | napulis1234
-- Mirasol =Ahongs Pancito             | mirasol.pancito@rcccoop.com                      | pancito1234
-- Cristopher Patatag                  | cristopher.patatag@rcccoop.com                   | patatag1234
-- Alex Pioquinto                      | alex.pioquinto@rcccoop.com                       | pioquinto1234
-- Pastor Plotenia                     | pastor.plotenia@rcccoop.com                      | plotenia1234
-- Plotenia Ma.Cleofe-                 | plotenia.macleofe@rcccoop.com                    | macleofe1234
-- Romeo Jr Ramirez                    | romeo.ramirez@rcccoop.com                        | ramirez1234
-- Reymart Rosales                     | reymart.rosales@rcccoop.com                      | rosales1234
-- Kim Rizon                           | kim.rizon@rcccoop.com                            | rizon1234
-- Juveline Sagolili                   | juveline.sagolili@rcccoop.com                    | sagolili1234
-- Alexander Salazar                   | alexander.salazar@rcccoop.com                    | salazar1234
-- Emmanuel Sanchez                    | emmanuel.sanchez@rcccoop.com                     | sanchez1234
-- Rhonvic Sanchez                     | rhonvic.sanchez@rcccoop.com                      | sanchez1234
-- Rutchele Sanchez                    | rutchele.sanchez@rcccoop.com                     | sanchez1234
-- Reymar Saycon                       | reymar.saycon@rcccoop.com                        | saycon1234
-- Rogelito Salvo                      | rogelito.salvo@rcccoop.com                       | salvo1234
-- Jendelh Soreneo                     | jendelh.soreneo@rcccoop.com                      | soreneo1234
-- Rowena Suello                       | rowena.suello@rcccoop.com                        | suello1234
-- Juneil Tikling                      | juneil.tikling@rcccoop.com                       | tikling1234
-- Uy Joe                              | uy.joe@rcccoop.com                               | joe1234
-- Josie Uy                            | josie.uy@rcccoop.com                             | uy1234
-- Anthony Uy Jose                     | anthony.jose@rcccoop.com                         | jose1234
-- Dolly Yang-Yang                     | dolly.yangyang@rcccoop.com                       | yangyang1234
-- Eduarda Abella                      | eduarda.abella@rcccoop.com                       | abella1234
-- Jandelyn Abong                      | jandelyn.abong@rcccoop.com                       | abong1234
-- Acabo Bonita                        | acabo.bonita@rcccoop.com                         | bonita1234
-- Aguhob Maricel                      | aguhob.maricel@rcccoop.com                       | maricel1234
-- Magdalina Alegarme                  | magdalina.alegarme@rcccoop.com                   | alegarme1234
-- Mabel Alegarme                      | mabel.alegarme@rcccoop.com                       | alegarme1234
-- Lanie Albon                         | lanie.albon@rcccoop.com                          | albon1234
-- Almario Mikel                       | almario.mikel@rcccoop.com                        | mikel1234
-- Suzette-Sis Kuya Edgar Anodan       | suzettesis.anodan@rcccoop.com                    | anodan1234
-- Alma Asenjo                         | alma.asenjo@rcccoop.com                          | asenjo1234
-- Judy Bagasbas                       | judy.bagasbas@rcccoop.com                        | bagasbas1234
-- Ericson Baoy                        | ericson.baoy@rcccoop.com                         | baoy1234
-- Florencio Baraya                    | florencio.baraya@rcccoop.com                     | baraya1234
-- Gladwin Caballa                     | gladwin.caballa@rcccoop.com                      | caballa1234
-- Dianne Less 35K Pay Loan Cuarez     | dianne.cuarez@rcccoop.com                        | cuarez1234
-- Reymart Calumba                     | reymart.calumba@rcccoop.com                      | calumba1234
-- Merly Dejeto                        | merly.dejeto@rcccoop.com                         | dejeto1234
-- Gabato Dante                        | gabato.dante@rcccoop.com                         | dante1234
-- Ma.Lonie Gabriel                    | malonie.gabriel@rcccoop.com                      | gabriel1234
-- Gonzaga Lito                        | gonzaga.lito@rcccoop.com                         | lito1234
-- Kevin Gonzales                      | kevin.gonzales@rcccoop.com                       | gonzales1234
-- Mary Rose Gonzales                  | mary.gonzales@rcccoop.com                        | gonzales1234
-- Armela Halos                        | armela.halos@rcccoop.com                         | halos1234
-- Michael Jorolan                     | michael.jorolan@rcccoop.com                      | jorolan1234
-- Fe Inihao                           | fe.inihao@rcccoop.com                            | inihao1234
-- Erlinda Kismundo                    | erlinda.kismundo@rcccoop.com                     | kismundo1234
-- Lorena Kismundo                     | lorena.kismundo@rcccoop.com                      | kismundo1234
-- Ramon Kismundo                      | ramon.kismundo@rcccoop.com                       | kismundo1234
-- Jaime Kanchanapairoj                | jaime.kanchanapairoj@rcccoop.com                 | kanchanapairoj1234
-- James Kanchanapairoj                | james.kanchanapairoj@rcccoop.com                 | kanchanapairoj1234
-- Julius Laiz                         | julius.laiz@rcccoop.com                          | laiz1234
-- Gemma Layson                        | gemma.layson@rcccoop.com                         | layson1234
-- Chine Lobiano                       | chine.lobiano@rcccoop.com                        | lobiano1234
-- Kimberly Magallon                   | kimberly.magallon@rcccoop.com                    | magallon1234
-- Miraflor Mirasol                    | miraflor.mirasol@rcccoop.com                     | mirasol1234
-- Mila Mendoza                        | mila.mendoza@rcccoop.com                         | mendoza1234
-- Nemenio Primo                       | nemenio.primo@rcccoop.com                        | primo1234
-- Agnes Nillas                        | agnes.nillas@rcccoop.com                         | nillas1234
-- Ryan Omandam                        | ryan.omandam@rcccoop.com                         | omandam1234
-- Chanelita Padin                     | chanelita.padin@rcccoop.com                      | padin1234
-- Helen Perales                       | helen.perales@rcccoop.com                        | perales1234
-- Perez Joice                         | perez.joice@rcccoop.com                          | joice1234
-- Eugenia Plotenia                    | eugenia.plotenia@rcccoop.com                     | plotenia1234
-- Rigor=Transfer To Sir Joe 10K Plando | rigortransfer.plando@rcccoop.com                 | plando1234
-- Mariel Quilat                       | mariel.quilat@rcccoop.com                        | quilat1234
-- Gina Saberon                        | gina.saberon@rcccoop.com                         | saberon1234
-- Sermilon Samer                      | sermilon.samer@rcccoop.com                       | samer1234
-- Shirly Sedon                        | shirly.sedon@rcccoop.com                         | sedon1234
-- Jonie Repdos                        | jonie.repdos@rcccoop.com                         | repdos1234
-- Lemuel-Withdraw Pay Loan Sencil     | lemuelwithdraw.sencil@rcccoop.com                | sencil1234
-- Marichu Silva                       | marichu.silva@rcccoop.com                        | silva1234
-- Mildred Sumampong                   | mildred.sumampong@rcccoop.com                    | sumampong1234
-- Sumampong Almae                     | sumampong.almae@rcccoop.com                      | almae1234
-- Ma.Lotis Solero                     | malotis.solero@rcccoop.com                       | solero1234
-- Rowel Rodrigues                     | rowel.rodrigues@rcccoop.com                      | rodrigues1234
-- Elsa Talingting                     | elsa.talingting@rcccoop.com                      | talingting1234
-- Marissa Tampos                      | marissa.tampos@rcccoop.com                       | tampos1234
-- Uy Vicky                            | uy.vicky@rcccoop.com                             | vicky1234
-- Uy Jona                             | uy.jona@rcccoop.com                              | jona1234
-- Ronald Uy                           | ronald.uy@rcccoop.com                            | uy1234
-- ============================================================