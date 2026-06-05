-- Migration 005: Allow members to update their own name
-- Run this once in the Supabase SQL editor.

-- Allow a member to update their own row in the members table.
-- Identified via profiles.member_id = auth.uid().
CREATE POLICY "members_self_update"
ON members
FOR UPDATE
USING (
  id = (SELECT member_id FROM profiles WHERE id = auth.uid())
)
WITH CHECK (
  id = (SELECT member_id FROM profiles WHERE id = auth.uid())
);
