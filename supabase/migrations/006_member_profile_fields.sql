-- Migration 006: Add first_name, last_name, and address to members table
-- Run once in the Supabase SQL editor.

ALTER TABLE members
  ADD COLUMN IF NOT EXISTS first_name text,
  ADD COLUMN IF NOT EXISTS last_name  text,
  ADD COLUMN IF NOT EXISTS address    text;
