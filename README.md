# RCC COOP — Management System

Internal employee savings and loan benefit program management app.

---

## Tech Stack

| Layer | Tech |
|-------|------|
| Frontend | React 19 + Vite + Tailwind CSS v4 |
| Backend / DB | Supabase (Postgres + Auth + RLS) |
| Routing | React Router v7 |
| Deployment | Cloudflare Pages or local nginx |

---

## Project Structure

```
rcc-coop-app/
├── src/
│   ├── components/
│   │   ├── layout/
│   │   │   ├── AppLayout.jsx           # Sidebar + main area wrapper
│   │   │   └── Sidebar.jsx             # Role-aware navigation
│   │   └── ui/
│   │       └── Badge.jsx               # Status / tier badges
│   ├── context/
│   │   └── AuthContext.jsx             # Auth state, profile, role
│   ├── lib/
│   │   └── supabase.js                 # Supabase client
│   ├── pages/
│   │   ├── auth/
│   │   │   ├── LoginPage.jsx
│   │   │   └── SetupAccountPage.jsx    # First-login password setup
│   │   ├── admin/
│   │   │   ├── DashboardPage.jsx       # Live stat cards
│   │   │   ├── MembersPage.jsx         # Member list + search + filter
│   │   │   ├── MemberForm.jsx          # Add / Edit member modal
│   │   │   ├── ContributionsPage.jsx   # Share capital contributions
│   │   │   ├── ContributionForm.jsx
│   │   │   ├── LoansPage.jsx           # Loan management + workflow
│   │   │   ├── LoanForm.jsx
│   │   │   ├── RepaymentsPage.jsx      # Loan payment recording
│   │   │   ├── RepaymentForm.jsx
│   │   │   ├── InterestPage.jsx        # Monthly interest batch (2%)
│   │   │   ├── DividendsPage.jsx       # Annual dividend compute + records
│   │   │   ├── DividendForm.jsx
│   │   │   ├── CashFlowPage.jsx        # Running cash transaction ledger
│   │   │   ├── CashFlowForm.jsx
│   │   │   ├── ReportsPage.jsx         # 4-tab reports (shared with officer/owner)
│   │   │   └── UserAccountsPage.jsx    # User role management
│   │   └── member/
│   │       ├── MemberDashboardPage.jsx
│   │       ├── MemberContributionsPage.jsx
│   │       ├── MemberLoansPage.jsx
│   │       ├── MemberApplyPage.jsx
│   │       ├── MemberDividendPage.jsx  # Own annual dividends
│   │       └── MemberStatementPage.jsx # Full statement of account
│   ├── App.jsx                         # Router + role-based redirects
│   └── index.css                       # Tailwind import
├── supabase/
│   └── migrations/
│       ├── 001_initial_schema.sql      # All tables, enums, RLS, indexes
│       ├── 002_seed_data.sql           # Real member + loan data (April 2026)
│       └── 003_update_member_emails.sql# Update fake emails → real personal emails
├── local/                              # Gitignored — local-only reference files
│   ├── member-accounts.csv            # All member login credentials
│   └── pending-email-updates.csv      # Members still using temp @rcccoop.com email
├── .env.example
└── README.md
```

---

## Setup Instructions

### 1. Supabase Project

1. Go to [supabase.com](https://supabase.com) and create a new project
2. Wait for it to finish provisioning
3. Go to **SQL Editor** and run the migrations in order:
   - `supabase/migrations/001_initial_schema.sql`
   - `supabase/migrations/002_seed_data.sql`
   - `supabase/migrations/003_update_member_emails.sql` *(run after collecting real emails)*

### 2. Environment Variables

```bash
cp .env.example .env
```

Fill in your values from Supabase **Project Settings > API**:

```
VITE_SUPABASE_URL=https://your-project.supabase.co
VITE_SUPABASE_ANON_KEY=your-anon-key-here
```

### 3. Install & Run

```bash
npm install
npm run dev
```

App runs at `http://localhost:5173`

---

## Default Login Credentials (from seed data)

All member accounts are pre-created from the April 2026 Excel records.

| Format | Example |
|--------|---------|
| Email (temp) | `firstname.lastname@rcccoop.com` |
| Password | `lastname1234` |

Members who have submitted their personal email are updated via `003_update_member_emails.sql`.
See `local/member-accounts.csv` for current credentials and `local/pending-email-updates.csv` for members still using temp emails.

> First-time login forces a password change before accessing the portal.

### Admin Account

```
Email:    jjnoname@gmail.com
Password: jose1234
Role:     admin
```

---

## User Roles

| Role | Access |
|------|--------|
| `admin` | Full access — all data entry, reports, user management |
| `officer` | Approve/reject loans, read-only on all data, reports |
| `member` | Own data only — contributions, loans, dividend, statement |
| `owner` | Read-only dashboard and reports |

---

## Build Phases

### Phase 1 — Foundation ✅ DONE
- [x] React + Vite + Tailwind setup
- [x] Supabase schema (all 8 tables + RLS)
- [x] Auth system with role-based routing
- [x] First-login password setup flow
- [x] Member list CRUD (admin)
- [x] Admin dashboard with live stats
- [x] Seed data from April 2026 Excel records (~120 members)

### Phase 2 — Core Features ✅ DONE
- [x] Share capital contributions (full CRUD + cutoff period filtering)
- [x] Loan creation, approval, and release workflow
- [x] Monthly interest batch runner (2% on outstanding balance)
- [x] Repayment recording with auto-completion detection
- [x] Member portal — dashboard, contributions, loans, apply for loan
- [x] Officer views — loan approvals, member read-only, reports
- [x] User accounts management (roles, setup status)

### Phase 3 — Dividends, Reports & Statement ✅ DONE
- [x] Annual dividend computation with batch preview + save
- [x] Member dividend view (per-year earnings breakdown)
- [x] Member statement of account (contributions + loans + payments + interest)
- [x] Reports page — Summary, Outstanding Loans, Contributions by Cutoff, Member Roster
- [x] Cash flow ledger (running transaction log with type/date filters)
- [x] Member email migration (003 SQL — real emails replacing temp accounts)

### Phase 4 — Polish & Notifications
- [ ] Print / PDF export (statement of account, reports)
- [ ] Mobile-responsive UI refinement
- [ ] Pagination for large tables (contributions, members)
- [ ] SMS notifications via Semaphore PH
- [ ] Email notifications via Supabase + Resend

### Phase 5 — Optional / Future
- [ ] Offline PWA support
- [ ] Store inventory module (Red Carpet)
- [ ] Bulk contribution import (CSV upload per cutoff)
- [ ] Audit log (who recorded what and when)

---

## Business Rules

| Rule | Value |
|------|-------|
| Interest rate | 2% per month on outstanding balance |
| Fiscal year | April 1 – March 31 |
| Loan eligibility — Regular | 6 cutoffs minimum (3 months) |
| Loan eligibility — Associate | 12 cutoffs minimum (6 months) |
| Max loan — Regular | 3× total capital, hard cap ₱50,000 |
| Max loan — Associate | 2× total capital, hard cap ₱30,000 |
| Multiple loans | Allowed |
| Proxy loans | Allowed ("c/o" guarantor field) |
| Annual dividend rate | ~16.56% of share capital |
| Patronage refund | 10% of loan interest paid during fiscal year |

---

## Legal Note

This app is for **internal use only**. RCC COOP operates as an informal employee savings and loan benefit program and is not SEC-registered. Do not use the term "cooperative" in any official documentation.
