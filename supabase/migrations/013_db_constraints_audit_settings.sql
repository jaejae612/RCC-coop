-- ============================================================
-- Migration 013: DB Constraints, Audit Log, App Settings
-- ============================================================

-- ── 1. Unique constraint: one interest charge per loan per month ──────────
-- Prevents duplicate charges if the batch is run more than once.
ALTER TABLE loan_interest_charges
  ADD CONSTRAINT unique_interest_per_loan_month UNIQUE (loan_id, charge_month);

-- ── 2. Unique constraint: one dividend record per member per fiscal year ──
-- DividendsPage already does upsert with onConflict:'member_id,fiscal_year'
-- which requires this constraint to exist in the database.
ALTER TABLE dividends
  ADD CONSTRAINT unique_dividend_per_member_year UNIQUE (member_id, fiscal_year);

-- ── 3. Audit log table ───────────────────────────────────────────────────
-- Records who did what and when for key financial operations.
CREATE TABLE IF NOT EXISTS audit_log (
  id               UUID        DEFAULT gen_random_uuid() PRIMARY KEY,
  action           TEXT        NOT NULL,  -- e.g. 'loan_approved', 'dividend_posted'
  table_name       TEXT        NOT NULL,  -- e.g. 'loans', 'dividends'
  record_id        UUID,                  -- affected record ID
  performed_by     UUID        REFERENCES auth.users(id) ON DELETE SET NULL,
  performed_by_role TEXT,                 -- snapshot of role at time of action
  old_value        JSONB,                 -- previous state (for updates)
  new_value        JSONB,                 -- new state
  notes            TEXT,
  created_at       TIMESTAMPTZ DEFAULT now()
);

-- Indexes for common queries
CREATE INDEX IF NOT EXISTS audit_log_table_record ON audit_log (table_name, record_id);
CREATE INDEX IF NOT EXISTS audit_log_performed_by ON audit_log (performed_by);
CREATE INDEX IF NOT EXISTS audit_log_created_at   ON audit_log (created_at DESC);

ALTER TABLE audit_log ENABLE ROW LEVEL SECURITY;

-- Admins and owners can view the audit log
CREATE POLICY "audit_log_read" ON audit_log
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM profiles
      WHERE id = auth.uid() AND role IN ('admin', 'owner')
    )
  );

-- Any authenticated user can insert (the app writes audit entries)
CREATE POLICY "audit_log_insert" ON audit_log
  FOR INSERT WITH CHECK (auth.uid() IS NOT NULL);

-- ── 4. App settings table ────────────────────────────────────────────────
-- Stores cooperative-wide configuration so hardcoded values can be
-- changed by the admin without a code deploy.
CREATE TABLE IF NOT EXISTS app_settings (
  key         TEXT PRIMARY KEY,
  value       TEXT        NOT NULL,
  description TEXT,
  updated_at  TIMESTAMPTZ DEFAULT now()
);

ALTER TABLE app_settings ENABLE ROW LEVEL SECURITY;

-- All authenticated users can read settings
CREATE POLICY "settings_read" ON app_settings
  FOR SELECT USING (auth.uid() IS NOT NULL);

-- Only admins can modify settings
CREATE POLICY "settings_admin_write" ON app_settings
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM profiles
      WHERE id = auth.uid() AND role = 'admin'
    )
  );

-- Seed default settings
INSERT INTO app_settings (key, value, description) VALUES
  ('loan_interest_rate_pct',     '2',     'Monthly loan interest rate (percent)'),
  ('max_loan_regular',           '50000', 'Maximum loan amount for regular members (PHP)'),
  ('max_loan_associate',         '30000', 'Maximum loan amount for associate members (PHP)'),
  ('min_cutoffs_regular',        '13',    'Minimum weekly contribution cutoffs for regular member loan eligibility'),
  ('min_cutoffs_associate',      '26',    'Minimum weekly contribution cutoffs for associate member loan eligibility'),
  ('fiscal_year_start_month',    '4',     'Month number when the fiscal year begins (4 = April)'),
  ('default_patronage_rate_pct', '10',    'Default patronage refund rate for dividend computation (percent)'),
  ('temp_password_prefix',       'Rcc@',  'Prefix used when generating temporary member passwords')
ON CONFLICT (key) DO NOTHING;
