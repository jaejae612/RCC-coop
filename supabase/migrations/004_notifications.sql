-- ============================================================
-- 004 — Notifications
-- ============================================================

create table if not exists notifications (
  id          uuid        primary key default gen_random_uuid(),
  profile_id  uuid        not null references profiles(id) on delete cascade,
  type        text        not null default 'general',   -- loan_approved | loan_released | payment_received | announcement | general
  title       text        not null,
  message     text,
  is_read     boolean     not null default false,
  created_at  timestamptz not null default now()
);

create index if not exists idx_notifications_profile
  on notifications(profile_id, is_read, created_at desc);

-- ── RLS ──────────────────────────────────────────────────────
alter table notifications enable row level security;

-- Any user reads their own; admins/officers read all
create policy "read notifications"
  on notifications for select
  using (
    profile_id = auth.uid()
    or exists (
      select 1 from profiles
      where id = auth.uid()
        and role in ('admin', 'officer')
    )
  );

-- Users mark their own as read
create policy "update own notifications"
  on notifications for update
  using (profile_id = auth.uid());

-- Admins / officers can create notifications for anyone
create policy "staff create notifications"
  on notifications for insert
  with check (
    exists (
      select 1 from profiles
      where id = auth.uid()
        and role in ('admin', 'officer')
    )
  );

-- Admins can delete old notifications
create policy "admin delete notifications"
  on notifications for delete
  using (
    exists (
      select 1 from profiles
      where id = auth.uid()
        and role = 'admin'
    )
  );
