import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { supabase } from '../../lib/supabase'
import { useAuth } from '../../context/AuthContext'
import { computeCreditScore, gradeStyle } from '../../lib/creditScore'

const peso = n => `₱${Number(n).toLocaleString('en-PH', { minimumFractionDigits: 2 })}`

function StatCard({ label, value, sub, accent }) {
  return (
    <div className="bg-white rounded-xl shadow p-5">
      <p className="text-sm text-gray-500 mb-1">{label}</p>
      <p className={`text-2xl font-bold ${accent ?? 'text-gray-800'}`}>{value}</p>
      {sub && <p className="text-xs text-gray-400 mt-1">{sub}</p>}
    </div>
  )
}

function CreditCard({ cr }) {
  if (!cr) return null
  const s = gradeStyle(cr.grade)
  const factors = [
    { label: 'Loan Repayment',    key: 'repayment',   max: 40 },
    { label: 'Share Capital',     key: 'capital',     max: 30 },
    { label: 'Contributions',     key: 'consistency', max: 20 },
    { label: 'Membership Length', key: 'membership',  max: 10 },
  ]
  return (
    <div className="bg-white rounded-xl shadow p-5">
      <div className="flex items-start justify-between mb-3">
        <div>
          <p className="text-sm text-gray-500 mb-1">Credit Rating</p>
          <div className="flex items-baseline gap-2">
            <span className={`text-4xl font-bold ${s.text}`}>{cr.grade}</span>
            <span className="text-sm text-gray-400">{cr.score} / 100</span>
          </div>
          <p className="text-xs text-gray-500 mt-0.5">{cr.label}</p>
        </div>
        <span className={`px-3 py-1 rounded-full text-xs font-semibold ${s.bg} ${s.text}`}>
          {cr.label}
        </span>
      </div>

      {/* Overall bar */}
      <div className="bg-gray-100 rounded-full h-2 mb-4">
        <div
          className={`h-2 rounded-full ${s.dot}`}
          style={{ width: `${cr.score}%` }}
        />
      </div>

      {/* Factor breakdown */}
      <div className="space-y-2.5">
        {factors.map(f => (
          <div key={f.key}>
            <div className="flex justify-between text-xs text-gray-500 mb-0.5">
              <span>{f.label}</span>
              <span className="font-medium text-gray-700">{cr.breakdown[f.key]} / {f.max}</span>
            </div>
            <div className="bg-gray-100 rounded-full h-1">
              <div
                className="bg-blue-400 h-1 rounded-full"
                style={{ width: `${(cr.breakdown[f.key] / f.max) * 100}%` }}
              />
            </div>
          </div>
        ))}
      </div>

      <p className="text-xs text-gray-400 mt-4">AA · A · B · C · D (85 / 70 / 55 / 40 threshold)</p>
    </div>
  )
}

export default function MemberDashboardPage() {
  const { profile } = useAuth()
  const memberName     = profile?.members?.full_name ?? profile?.display_name ?? 'Member'
  const hasPlaceholder = profile?.email?.endsWith('@rcccoop.com')

  const [stats,          setStats]          = useState(null)
  const [creditRating,   setCreditRating]   = useState(null)
  const [recentContribs, setRecentContribs] = useState([])
  const [activeLoans,    setActiveLoans]    = useState([])

  useEffect(() => {
    async function load() {
      const [
        { data: member },
        { data: contribs },
        { data: loans },
        { data: payments },
      ] = await Promise.all([
        supabase.from('members').select('date_joined, membership_tier').single(),
        supabase.from('contributions').select('amount, cutoff_date, cutoff_period').order('cutoff_date', { ascending: false }),
        supabase.from('loans').select('id, loan_number, loan_type, principal_amount, total_payable, status, date_released'),
        supabase.from('loan_payments').select('loan_id, amount_paid'),
      ]).catch(() => [
        { data: null }, { data: null }, { data: null }, { data: null },
      ])

      const totalCapital = (contribs ?? []).reduce((s, c) => s + Number(c.amount), 0)
      const cutoffCount  = (contribs ?? []).length

      const paidByLoan = {}
      for (const p of (payments ?? [])) {
        paidByLoan[p.loan_id] = (paidByLoan[p.loan_id] ?? 0) + Number(p.amount_paid)
      }

      const released = (loans ?? []).filter(l => l.status === 'released')
      const outstandingBalance = released.reduce((s, l) => {
        const paid = paidByLoan[l.id] ?? 0
        return s + Math.max(0, Number(l.total_payable ?? l.principal_amount) - paid)
      }, 0)

      setStats({ totalCapital, cutoffCount, outstandingBalance, activeLoansCount: released.length })
      setRecentContribs((contribs ?? []).slice(0, 5))
      setActiveLoans(released.map(l => ({
        ...l,
        paid:      paidByLoan[l.id] ?? 0,
        remaining: Math.max(0, Number(l.total_payable ?? l.principal_amount) - (paidByLoan[l.id] ?? 0)),
      })))

      if (member) {
        setCreditRating(computeCreditScore(member, contribs ?? [], loans ?? [], payments ?? []))
      }
    }
    load()
  }, [])

  return (
    <div>
      {hasPlaceholder && (
        <div className="mb-5 flex items-start gap-3 bg-amber-50 border border-amber-200 rounded-xl px-4 py-3 text-sm text-amber-800">
          <span className="mt-0.5 shrink-0">⚠</span>
          <div>
            Your login email (<strong>{profile.email}</strong>) is a system placeholder.
            Please update it to your personal email in your{' '}
            <Link to="/member/profile" className="underline font-medium hover:text-amber-900">Profile settings</Link>.
          </div>
        </div>
      )}

      <div className="mb-6">
        <h1 className="text-xl font-bold text-gray-800">Welcome, {memberName}</h1>
        <p className="text-sm text-gray-500">Your RCC COOP account overview</p>
      </div>

      {stats ? (
        <div className="grid grid-cols-2 lg:grid-cols-4 gap-4 mb-6">
          <StatCard
            label="Total Share Capital"
            value={peso(stats.totalCapital)}
            sub={`${stats.cutoffCount} contributions`}
            accent="text-blue-700"
          />
          <StatCard
            label="Cutoff Contributions"
            value={stats.cutoffCount}
            sub="all-time count"
          />
          <StatCard
            label="Active Loans"
            value={stats.activeLoansCount}
          />
          <StatCard
            label="Outstanding Balance"
            value={peso(stats.outstandingBalance)}
            accent={stats.outstandingBalance > 0 ? 'text-red-600' : 'text-green-600'}
            sub={stats.outstandingBalance === 0 ? 'All loans paid' : 'total remaining'}
          />
        </div>
      ) : (
        <p className="text-sm text-gray-500 mb-6">Loading...</p>
      )}

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* Credit Rating */}
        <CreditCard cr={creditRating} />

        {/* Recent Contributions */}
        <div className="bg-white rounded-xl shadow p-5">
          <h2 className="font-semibold text-gray-700 mb-3">Recent Contributions</h2>
          {recentContribs.length === 0 ? (
            <p className="text-sm text-gray-400">No contributions recorded yet.</p>
          ) : (
            <ul className="space-y-2">
              {recentContribs.map((c, i) => (
                <li key={i} className="flex justify-between text-sm">
                  <span className="font-mono text-gray-600">{c.cutoff_period}</span>
                  <span className="font-medium text-gray-800">{peso(c.amount)}</span>
                </li>
              ))}
            </ul>
          )}
        </div>

        {/* Active Loans */}
        <div className="bg-white rounded-xl shadow p-5">
          <h2 className="font-semibold text-gray-700 mb-3">Active Loans</h2>
          {activeLoans.length === 0 ? (
            <p className="text-sm text-gray-400">No active loans.</p>
          ) : (
            <ul className="space-y-3">
              {activeLoans.map(l => (
                <li key={l.id} className="text-sm">
                  <div className="flex justify-between mb-1">
                    <span className="font-medium text-gray-700 capitalize">
                      #{l.loan_number} {l.loan_type}
                    </span>
                    <span className="text-gray-500">{peso(l.principal_amount)}</span>
                  </div>
                  <div className="flex justify-between text-xs text-gray-500">
                    <span>Paid: {peso(l.paid)}</span>
                    <span className="text-red-600 font-medium">Remaining: {peso(l.remaining)}</span>
                  </div>
                  <div className="mt-1.5 bg-gray-100 rounded-full h-1.5">
                    <div
                      className="bg-blue-500 h-1.5 rounded-full"
                      style={{ width: `${Math.min(100, (l.paid / Number(l.total_payable ?? l.principal_amount)) * 100)}%` }}
                    />
                  </div>
                </li>
              ))}
            </ul>
          )}
        </div>
      </div>
    </div>
  )
}
