-- ============================================================
-- RCC COOP — Initial Schema
-- Run this in Supabase SQL Editor (Dashboard > SQL Editor)
-- ============================================================

-- ── Enums ────────────────────────────────────────────────────

create type employment_type as enum ('regular', 'non_regular');
create type membership_tier as enum ('regular_member', 'associate_member');
create type member_status as enum ('active', 'inactive', 'on_leave');
create type loan_type as enum ('regular', 'emergency', 'multipurpose');
create type loan_status as enum ('pending', 'approved', 'released', 'completed', 'rejected');
create type user_role as enum ('admin', 'officer', 'member', 'owner');
create type cash_tx_type as enum (
  'loan_release', 'loan_payment', 'petty_cash',
  'store_purchase', 'bank_interest', 'bank_tax', 'other'
);

-- ── Members ──────────────────────────────────────────────────

create table members (
  id                     uuid primary key default gen_random_uuid(),
  full_name              text not null,
  employee_id            text unique,
  position               text,
  department             text,
  contact_number         text,
  employment_type        employment_type not null default 'regular',
  membership_tier        membership_tier not null default 'regular_member',
  date_joined            date not null,
  status                 member_status not null default 'active',
  contribution_per_cutoff numeric(10,2) default 0,
  created_at             timestamptz default now()
);

-- ── Share Capital Contributions ───────────────────────────────

create table contributions (
  id             uuid primary key default gen_random_uuid(),
  member_id      uuid not null references members(id) on delete restrict,
  amount         numeric(10,2) not null,
  cutoff_period  text not null,        -- e.g. "2026-05-1ST"
  cutoff_date    date not null,
  payment_date   date,
  recorded_by    uuid references auth.users(id),
  notes          text,
  created_at     timestamptz default now()
);

-- ── Loans ─────────────────────────────────────────────────────

create table loans (
  id               uuid primary key default gen_random_uuid(),
  member_id        uuid not null references members(id) on delete restrict,
  loan_number      int not null default 1,   -- per-member sequence
  loan_type        loan_type not null default 'regular',
  principal_amount numeric(12,2) not null,
  interest_rate    numeric(5,2) not null default 2, -- % per month
  term_months      int,
  monthly_payment  numeric(12,2),
  total_payable    numeric(12,2),
  guarantor_name   text,                     -- "c/o [name]" proxy loans
  date_applied     date not null,
  date_approved    date,
  date_released    date,
  status           loan_status not null default 'pending',
  approved_by      uuid references auth.users(id),
  notes            text,
  created_at       timestamptz default now(),
  unique (member_id, loan_number)
);

-- ── Loan Payments ─────────────────────────────────────────────

create table loan_payments (
  id           uuid primary key default gen_random_uuid(),
  loan_id      uuid not null references loans(id) on delete restrict,
  member_id    uuid not null references members(id) on delete restrict,
  amount_paid  numeric(12,2) not null,
  payment_date date not null,
  recorded_by  uuid references auth.users(id),
  notes        text,
  created_at   timestamptz default now()
);

-- ── Monthly Interest Charges ──────────────────────────────────

create table loan_interest_charges (
  id                uuid primary key default gen_random_uuid(),
  loan_id           uuid not null references loans(id) on delete restrict,
  member_id         uuid not null references members(id) on delete restrict,
  charge_month      text not null,           -- e.g. "2026-04"
  beginning_balance numeric(12,2) not null,
  interest_amount   numeric(12,2) not null,  -- 2% of beginning_balance
  created_at        timestamptz default now(),
  unique (loan_id, charge_month)
);

-- ── Annual Dividends ──────────────────────────────────────────

create table dividends (
  id                  uuid primary key default gen_random_uuid(),
  member_id           uuid not null references members(id) on delete restrict,
  fiscal_year         text not null,           -- e.g. "2025-2026"
  capital_amount      numeric(12,2) not null,
  interest_rate       numeric(5,2) not null,   -- e.g. 16.56
  interest_earned     numeric(12,2) not null,
  total_interest_paid numeric(12,2) not null default 0,
  patronage_rate      numeric(5,2) not null default 10,
  patronage_refund    numeric(12,2) not null default 0,
  total_earnings      numeric(12,2) not null,
  loan_deduction      numeric(12,2) not null default 0,
  cash_released       numeric(12,2) not null default 0,
  release_date        date,
  recorded_by         uuid references auth.users(id),
  created_at          timestamptz default now(),
  unique (member_id, fiscal_year)
);

-- ── Cash Flow Log ─────────────────────────────────────────────

create table cash_flow (
  id               uuid primary key default gen_random_uuid(),
  transaction_date date not null,
  description      text not null,
  transaction_type cash_tx_type not null default 'other',
  withdrawal       numeric(12,2),
  deposit          numeric(12,2),
  balance_after    numeric(12,2) not null,
  reference_id     uuid,   -- FK to loans or loan_payments (loose ref)
  recorded_by      uuid references auth.users(id),
  created_at       timestamptz default now()
);

-- ── User Profiles (extends auth.users) ───────────────────────

create table profiles (
  id           uuid primary key references auth.users(id) on delete cascade,
  member_id    uuid references members(id) on delete set null,
  role         user_role not null default 'member',
  display_name text,
  first_login  boolean not null default true  -- forces password/email setup on first access
);

-- Auto-create profile on signup
create or replace function handle_new_user()
returns trigger language plpgsql security definer as $$
begin
  insert into profiles (id, display_name)
  values (new.id, new.raw_user_meta_data->>'display_name');
  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure handle_new_user();

-- ── Row Level Security ────────────────────────────────────────

alter table members               enable row level security;
alter table contributions         enable row level security;
alter table loans                 enable row level security;
alter table loan_payments         enable row level security;
alter table loan_interest_charges enable row level security;
alter table dividends             enable row level security;
alter table cash_flow             enable row level security;
alter table profiles              enable row level security;

-- Helper: get current user's role
create or replace function current_role()
returns user_role language sql security definer stable as $$
  select role from profiles where id = auth.uid();
$$;

-- Helper: get current user's member_id
create or replace function current_member_id()
returns uuid language sql security definer stable as $$
  select member_id from profiles where id = auth.uid();
$$;

-- members
create policy "admin full" on members for all using (current_role() = 'admin');
create policy "officer/owner read" on members for select using (current_role() in ('officer', 'owner'));
create policy "member own row" on members for select using (id = current_member_id());

-- contributions
create policy "admin full" on contributions for all using (current_role() = 'admin');
create policy "officer/owner read" on contributions for select using (current_role() in ('officer', 'owner'));
create policy "member own" on contributions for select using (member_id = current_member_id());

-- loans
create policy "admin full" on loans for all using (current_role() = 'admin');
create policy "officer read+approve" on loans for select using (current_role() in ('officer', 'owner'));
create policy "officer update status" on loans for update using (current_role() = 'officer');
create policy "member own" on loans for select using (member_id = current_member_id());
create policy "member insert" on loans for insert with check (member_id = current_member_id());

-- loan_payments
create policy "admin full" on loan_payments for all using (current_role() = 'admin');
create policy "officer/owner read" on loan_payments for select using (current_role() in ('officer', 'owner'));
create policy "member own" on loan_payments for select using (member_id = current_member_id());

-- loan_interest_charges
create policy "admin full" on loan_interest_charges for all using (current_role() = 'admin');
create policy "officer/owner read" on loan_interest_charges for select using (current_role() in ('officer', 'owner'));
create policy "member own" on loan_interest_charges for select using (member_id = current_member_id());

-- dividends
create policy "admin full" on dividends for all using (current_role() = 'admin');
create policy "officer/owner read" on dividends for select using (current_role() in ('officer', 'owner'));
create policy "member own" on dividends for select using (member_id = current_member_id());

-- cash_flow
create policy "admin full" on cash_flow for all using (current_role() = 'admin');
create policy "officer/owner read" on cash_flow for select using (current_role() in ('officer', 'owner'));

-- profiles
create policy "own profile" on profiles for select using (id = auth.uid());
create policy "admin read all" on profiles for select using (current_role() = 'admin');
create policy "admin update roles" on profiles for update using (current_role() = 'admin');

-- ── Indexes ───────────────────────────────────────────────────

create index on contributions (member_id, cutoff_date);
create index on loans (member_id, status);
create index on loan_payments (loan_id);
create index on loan_payments (member_id);
create index on loan_interest_charges (member_id, charge_month);
create index on dividends (member_id, fiscal_year);
create index on cash_flow (transaction_date);
