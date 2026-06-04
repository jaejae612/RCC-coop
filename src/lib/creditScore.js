/**
 * RCC COOP — Credit Rating System
 *
 * Computes a 0–100 score from existing member data.
 * No new database table required — pure calculation.
 *
 * Factors:
 *   40 pts — Loan Repayment History
 *   30 pts — Share Capital Amount
 *   20 pts — Contribution Consistency (cutoff count)
 *   10 pts — Membership Length
 *
 * Grades:
 *   AA  85–100  Excellent
 *   A   70–84   Good
 *   B   55–69   Fair
 *   C   40–54   Marginal
 *   D   < 40    Poor
 */

// ── Factor 1: Loan Repayment (40 pts) ─────────────────────────────
function repaymentScore(loans, payments) {
  const relevant = loans.filter(l => ['released', 'completed'].includes(l.status))
  if (relevant.length === 0) return 20 // neutral — no loan history yet

  const totalPayable = relevant.reduce((s, l) => s + Number(l.total_payable ?? l.principal_amount), 0)
  const totalPaid    = payments.reduce((s, p) => s + Number(p.amount_paid), 0)

  const allCompleted = relevant.every(l => l.status === 'completed')
  if (allCompleted) return 40

  if (totalPayable === 0) return 20
  const ratio = totalPaid / totalPayable

  if (ratio >= 0.75) return 35
  if (ratio >= 0.50) return 28
  if (ratio >= 0.25) return 20
  return 12
}

// ── Factor 2: Share Capital (30 pts) ──────────────────────────────
function capitalScore(contribs) {
  const total = contribs.reduce((s, c) => s + Number(c.amount), 0)
  if (total >= 30000) return 30
  if (total >= 20000) return 24
  if (total >= 10000) return 18
  if (total >=  5000) return 12
  return 6
}

// ── Factor 3: Contribution Consistency (20 pts) ───────────────────
function consistencyScore(contribs) {
  const count = contribs.length
  if (count >= 24) return 20
  if (count >= 18) return 16
  if (count >= 12) return 13
  if (count >=  6) return  9
  if (count >=  1) return  5
  return 0
}

// ── Factor 4: Membership Length (10 pts) ──────────────────────────
function membershipScore(dateJoined) {
  if (!dateJoined) return 2
  const years = (Date.now() - new Date(dateJoined).getTime()) / (1000 * 60 * 60 * 24 * 365.25)
  if (years >= 5) return 10
  if (years >= 3) return  8
  if (years >= 2) return  6
  if (years >= 1) return  4
  return 2
}

// ── Grade from total score ─────────────────────────────────────────
function toGrade(score) {
  if (score >= 85) return 'AA'
  if (score >= 70) return 'A'
  if (score >= 55) return 'B'
  if (score >= 40) return 'C'
  return 'D'
}

// ── Main export ───────────────────────────────────────────────────
/**
 * @param {object} member         — member row (needs date_joined)
 * @param {Array}  contribs       — contributions for this member
 * @param {Array}  loans          — loans for this member
 * @param {Array}  payments       — loan_payments for this member's loans
 * @returns {{ score, grade, label, breakdown }}
 */
export function computeCreditScore(member, contribs, loans, payments) {
  const repayment    = repaymentScore(loans, payments)
  const capital      = capitalScore(contribs)
  const consistency  = consistencyScore(contribs)
  const membership   = membershipScore(member?.date_joined)

  const score = repayment + capital + consistency + membership
  const grade = toGrade(score)

  const labels = { AA: 'Excellent', A: 'Good', B: 'Fair', C: 'Marginal', D: 'Poor' }

  return {
    score,
    grade,
    label: labels[grade],
    breakdown: { repayment, capital, consistency, membership },
  }
}

// ── Badge styling ─────────────────────────────────────────────────
export function gradeStyle(grade) {
  switch (grade) {
    case 'AA': return { bg: 'bg-emerald-100', text: 'text-emerald-800', dot: 'bg-emerald-500' }
    case 'A':  return { bg: 'bg-green-100',   text: 'text-green-800',   dot: 'bg-green-500'   }
    case 'B':  return { bg: 'bg-blue-100',    text: 'text-blue-800',    dot: 'bg-blue-500'    }
    case 'C':  return { bg: 'bg-amber-100',   text: 'text-amber-800',   dot: 'bg-amber-500'   }
    case 'D':  return { bg: 'bg-red-100',     text: 'text-red-800',     dot: 'bg-red-500'     }
    default:   return { bg: 'bg-gray-100',    text: 'text-gray-600',    dot: 'bg-gray-400'    }
  }
}
