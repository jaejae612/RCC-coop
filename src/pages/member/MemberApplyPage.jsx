import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../../lib/supabase'
import { useAuth } from '../../context/AuthContext'

const input = 'w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500'

function Field({ label, hint, children }) {
  return (
    <div>
      <label className="block text-sm font-medium text-gray-700 mb-1">
        {label}
        {hint && <span className="text-gray-400 font-normal ml-1">({hint})</span>}
      </label>
      {children}
    </div>
  )
}

function computeLoan(principal, rate, term) {
  const p = Number(principal) || 0
  const r = Number(rate) / 100
  const n = Number(term) || 0
  if (p <= 0 || r <= 0 || n <= 0) return { monthly: 0, total: 0 }
  const monthly = (p * r * Math.pow(1 + r, n)) / (Math.pow(1 + r, n) - 1)
  const total = monthly * n
  return { monthly: Math.round(monthly * 100) / 100, total: Math.round(total * 100) / 100 }
}

const peso = n => n > 0 ? `₱${Number(n).toLocaleString('en-PH', { minimumFractionDigits: 2 })}` : '—'

export default function MemberApplyPage() {
  const { profile } = useAuth()
  const navigate = useNavigate()
  const [memberInfo, setMemberInfo] = useState(null)
  const [submitted, setSubmitted] = useState(false)
  const [form, setForm] = useState({
    loan_type: 'regular',
    principal_amount: '',
    term_months: '',
    notes: '',
  })
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState('')

  // Load member info to show eligibility
  useEffect(() => {
    if (!profile?.member_id) return
    Promise.all([
      supabase.from('members').select('full_name, membership_tier, date_joined, contribution_per_cutoff, status').eq('id', profile.member_id).single(),
      supabase.from('contributions').select('id', { count: 'exact', head: true }).eq('member_id', profile.member_id),
    ]).then(([{ data: member }, { count: cutoffs }]) => {
      setMemberInfo({ ...member, cutoffCount: cutoffs ?? 0 })
    }).catch(() => {})
  }, [profile?.member_id])

  function set(field, value) {
    setForm(f => ({ ...f, [field]: value }))
  }

  async function handleSubmit(e) {
    e.preventDefault()
    setError('')
    setSaving(true)

    if (!profile?.member_id) {
      setError('Your account is not linked to a member record. Please contact the admin.')
      setSaving(false)
      return
    }

    // Get next loan number
    const { data: existing } = await supabase
      .from('loans')
      .select('loan_number')
      .eq('member_id', profile.member_id)
      .order('loan_number', { ascending: false })
      .limit(1)
    const loanNumber = (existing?.[0]?.loan_number ?? 0) + 1

    const { monthly, total } = computeLoan(form.principal_amount, 2, form.term_months)

    const { error: err } = await supabase.from('loans').insert({
      member_id: profile.member_id,
      loan_number: loanNumber,
      loan_type: form.loan_type,
      principal_amount: Number(form.principal_amount),
      interest_rate: 2,
      term_months: form.term_months ? Number(form.term_months) : null,
      monthly_payment: monthly || null,
      total_payable: total || null,
      date_applied: new Date().toISOString().slice(0, 10),
      status: 'pending',
      notes: form.notes || null,
    })

    setSaving(false)
    if (err) setError(err.message)
    else setSubmitted(true)
  }

  const { monthly, total } = computeLoan(form.principal_amount, 2, form.term_months)

  // Eligibility check — weekly cutoffs (≈4.3/month)
  // Regular member:   13 weeks ≈ 3 months minimum
  // Associate member: 26 weeks ≈ 6 months minimum
  const minCutoffs = memberInfo?.membership_tier === 'associate_member' ? 26 : 13
  const meetsMinCutoffs = (memberInfo?.cutoffCount ?? 0) >= minCutoffs
  const maxLoan = memberInfo?.membership_tier === 'associate_member' ? 30000 : 50000

  const memberStatus = memberInfo?.status
  const isInactive = memberStatus && memberStatus !== 'active'

  if (isInactive) {
    const statusLabel = memberStatus === 'on_leave' ? 'on leave' : 'inactive'
    return (
      <div className="max-w-lg mx-auto mt-12 bg-white rounded-xl shadow p-8 text-center">
        <div className="text-4xl mb-3">⚠</div>
        <h2 className="text-lg font-semibold text-gray-800 mb-2">Membership Not Active</h2>
        <p className="text-sm text-gray-500">
          Your membership is currently <strong>{statusLabel}</strong>. Loan applications require an active membership status.
          Please contact the admin to reactivate your account.
        </p>
      </div>
    )
  }

  if (submitted) {
    return (
      <div className="max-w-lg mx-auto mt-12 bg-white rounded-xl shadow p-8 text-center">
        <div className="text-4xl mb-3">✓</div>
        <h2 className="text-lg font-semibold text-gray-800 mb-2">Loan Application Submitted</h2>
        <p className="text-sm text-gray-500 mb-6">
          Your application is now pending review. An admin or officer will process it shortly.
        </p>
        <button
          onClick={() => navigate('/member/loans')}
          className="px-5 py-2 bg-blue-600 text-white rounded-lg text-sm font-medium hover:bg-blue-700"
        >
          View My Loans
        </button>
      </div>
    )
  }

  return (
    <div className="max-w-lg">
      <div className="mb-6">
        <h1 className="text-xl font-bold text-gray-800">Apply for a Loan</h1>
        <p className="text-sm text-gray-500">Submit a loan application for admin review.</p>
      </div>

      {/* Eligibility info */}
      {memberInfo && (
        <div className="rounded-xl p-4 mb-6 text-sm bg-gray-50 border border-gray-200">
          <div className="font-medium mb-1 text-gray-700">Membership Info</div>
          <div className="text-gray-600 space-y-0.5">
            <div>Tier: <span className="capitalize font-medium">{memberInfo.membership_tier?.replace(/_/g, ' ')}</span></div>
            <div>Contributions: <span className="font-medium">{memberInfo.cutoffCount} cutoffs</span> (recommended: {minCutoffs})</div>
            <div>Max loan amount: <span className="font-medium">₱{maxLoan.toLocaleString('en-PH')}</span></div>
          </div>
          {!meetsMinCutoffs && (
            <p className="text-amber-700 text-xs mt-2 font-medium">
              Note: You have fewer than the recommended {minCutoffs} contribution cutoffs. Your application will be subject to admin evaluation.
            </p>
          )}
        </div>
      )}

      <form onSubmit={handleSubmit} className="bg-white rounded-xl shadow p-6 space-y-4">
        <Field label="Loan Type *">
          <select value={form.loan_type} onChange={e => set('loan_type', e.target.value)} className={input}>
            <option value="regular">Regular</option>
            <option value="emergency">Emergency</option>
            <option value="multipurpose">Multipurpose</option>
          </select>
        </Field>

        <div className="grid grid-cols-2 gap-4">
          <Field label="Amount Requested (₱) *">
            <input
              required
              type="number"
              min="0"
              max={maxLoan}
              step="0.01"
              value={form.principal_amount}
              onChange={e => set('principal_amount', e.target.value)}
              className={input}
              placeholder="0.00"
            />
          </Field>
          <Field label="Preferred Term" hint="months">
            <input
              type="number"
              min="1"
              value={form.term_months}
              onChange={e => set('term_months', e.target.value)}
              className={input}
              placeholder="e.g. 12"
            />
          </Field>
        </div>

        {/* Payment preview */}
        {monthly > 0 && (
          <div className="bg-blue-50 rounded-lg px-4 py-3 text-sm text-blue-800 grid grid-cols-2 gap-2">
            <div>
              <span className="text-blue-500 text-xs block">Est. Monthly Payment</span>
              <span className="font-semibold">{peso(monthly)}</span>
            </div>
            <div>
              <span className="text-blue-500 text-xs block">Est. Total Payable</span>
              <span className="font-semibold">{peso(total)}</span>
            </div>
          </div>
        )}

        <Field label="Purpose / Notes">
          <textarea
            value={form.notes}
            onChange={e => set('notes', e.target.value)}
            className={`${input} resize-none`}
            rows={3}
            placeholder="Reason for loan application..."
          />
        </Field>

        {error && (
          <p className="text-sm text-red-600 bg-red-50 border border-red-200 rounded px-3 py-2">{error}</p>
        )}

        <button
          type="submit"
          disabled={saving}
          className="w-full py-2.5 bg-blue-600 hover:bg-blue-700 disabled:opacity-50 text-white text-sm font-medium rounded-lg"
        >
          {saving ? 'Submitting...' : 'Submit Application'}
        </button>
        <p className="text-xs text-center text-gray-400">
          All applications are reviewed and approved by the admin.
        </p>
      </form>
    </div>
  )
}
