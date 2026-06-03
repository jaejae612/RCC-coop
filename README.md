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
│   │   │   ├── AppLayout.jsx       # Sidebar + main area wrapper
│   │   │   └── Sidebar.jsx         # Role-aware navigation
│   │   └── ui/
│   │       └── Badge.jsx           # Status / tier badges
│   ├── context/
│   │   └── AuthContext.jsx         # Auth state, profile, role
│   ├── lib/
│   │   └── supabase.js             # Supabase client
│   ├── pages/
│   │   ├── auth/
│   │   │   └── LoginPage.jsx
│   │   ├── admin/
│   │   │   ├── DashboardPage.jsx   # Live stat cards
│   │   │   ├── MembersPage.jsx     # Member list + search + filter
│   │   │   └── MemberForm.jsx      # Add / Edit member modal
│   │   ├── officer/                # Phase 2
│   │   ├── member/                 # Phase 2
│   │   └── Placeholder.jsx         # Coming soon stub
│   ├── App.jsx                     # Router + role-based redirects
│   └── index.css                   # Tailwind import
├── supabase/
│   └── migrations/
│       ├── 001_initial_schema.sql  # All tables, enums, RLS, indexes
│       └── 002_seed_data.sql       # Real member + loan data (April 2026)
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
| Email | `firstname.lastname@rcccoop.com` |
| Password | `lastname1234` |

**Examples:**

| Name | Email | Password |
|------|-------|----------|
| Roselyn Amit | roselyn.amit@rcccoop.com | amit1234 |
| Myrna Almocera | myrna.almocera@rcccoop.com | almocera1234 |
| Sheila Fuentes | sheila.fuentes@rcccoop.com | fuentes1234 |

> First-time login: members should change their password immediately.

### Admin Account

After running the seed, set up the treasurer/admin account manually:

1. Go to Supabase Dashboard > **Authentication > Users**
2. Click **Add User** — enter the treasurer's email and a strong password
3. Go to **Table Editor > profiles** — find that user's row
4. Set `role` = `admin`

---

## User Roles

| Role | Access |
|------|--------|
| `admin` | Full access — all data entry, reports, user management |
| `officer` | Approve/reject loans, read-only on all data |
| `member` | Own data only — contributions, loans, dividend |
| `owner` | Read-only dashboard and reports |

---

## Build Phases

### Phase 1 — Foundation (DONE)
- [x] React + Vite + Tailwind setup
- [x] Supabase schema (all 8 tables + RLS)
- [x] Auth system with role-based routing
- [x] Member list CRUD (admin)
- [x] Admin dashboard with live stats
- [x] Seed data from April 2026 Excel records

### Phase 2 — Core Features
- [ ] Share capital module
- [ ] Loan release + approval workflow
- [ ] Monthly interest charging (2% batch)
- [ ] Repayment recording
- [ ] Monthly loan ledger (SUM LOAN equivalent)

### Phase 3 — Dividend & Reporting
- [ ] Annual dividend computation
- [ ] Member statement of account
- [ ] Monthly summary and outstanding loans report
- [ ] Print / export to PDF

### Phase 4 — Cash Flow & Balance Sheet
- [ ] Daily cash flow log
- [ ] Receivables / balance sheet view

### Phase 5 — Polish & Notifications
- [ ] Offline PWA support
- [ ] Mobile-responsive UI
- [ ] SMS via Semaphore PH
- [ ] Email via Supabase + Resend
- [ ] Store inventory (Red Carpet) — optional

---

## Business Rules

| Rule | Value |
|------|-------|
| Interest rate | 2% per month on outstanding balance |
| Fiscal year | April 1 – March 31 |
| Loan eligibility | Regular: 6 cutoffs (3 months) / Associate: 12 cutoffs (6 months) |
| Max loan — Regular | 3x total capital, hard cap 50,000 |
| Max loan — Associate | 2x total capital, hard cap 30,000 |
| Multiple loans | Allowed |
| Proxy loans | Allowed ("c/o" guarantor field) |
| Interest on capital | ~16.56% per year |
| Patronage refund | 10% of loan interest paid during fiscal year |

---

## Legal Note

This app is for **internal use only**. RCC COOP operates as an informal employee savings and loan benefit program and is not SEC-registered. Do not use the term "cooperative" in any official documentation.
