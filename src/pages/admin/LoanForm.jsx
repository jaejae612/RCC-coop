import { useState, useEffect } from 'react'
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
  // Diminishing balance (standard amortization)
  const monthly = (p * r * Math.pow(1 + r, n)) / (Math.pow(1 + r, n) - 1)
  const total = monthly * n
  return { monthly: Math.round(monthly * 100) / 100, total: Math.round(total * 100) / 100 }
}

export default function LoanForm({ loan, onClose, onSaved }) {
  const { session } = useAuth()
  const isEdit = !!loan
  const [members, setMembers] = useState([])
  const [form, setForm] = useState({
    member_id: loan?.member_id ?? '',
    loan_type: loan?.loan_type ?? 'regular',
    principal_amount: loan?.principal_amount ?? '',
    interest_rate: loan?.interest_rate ?? '2',
    term_months: loan?.term_months ?? '',
    monthly_payment: loan?.monthly_payment ?? '',
    total_payable: loan?.total_payable ?? '',
    guarantor_name: loan?.guarantor_name ?? '',
    date_applied: loan?.date_applied ?? new Date().toISOString().slice(0, 10),
    notes: loan?.notes ?? '',
  })
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState('')

  useEffect(() => {
    supabase
      .from('members')
      .select('id, full_name, membership_tier')
      .eq('status', 'active')
      .order('full_name')
      .then(({ data }) => setMembers(data ?? []))
  }, [])

  // Auto-compute monthly payment and total payable
  useEffect(() => {
    const { monthly, total } = computeLoan(form.principal_amount, form.interest_rate, form.term_months)
    if (monthly > 0) {
      setForm(f => ({ ...f, monthly_payment: String(monthly), total_payable: String(total) }))
    }
  }, [form.principal_amount, form.interest_rate, form.term_months])

  function set(field, value) {
    setForm(f => ({ ...f, [field]: value }))
  }

  async function handleSubmit(e) {
    e.preventDefault()
    setError('')
    setSaving(true)

    // Get next loan number for this member
    let loanNumber = loan?.loan_number ?? 1
    if (!isEdit) {
      const { data: existing } = await supabase
        .from('loans')
        .select('loan_number')
        .eq('member_id', form.member_id)
        .order('loan_number', { ascending: false })
        .limit(1)
      loanNumber = (existing?.[0]?.loan_number ?? 0) + 1
    }

    const payload = {
      member_id: form.member_id,
      loan_number: loanNumber,
      loan_type: form.loan_type,
      principal_amount: Number(form.principal_amount),
      interest_rate: Number(form.interest_rate),
      term_months: form.term_months ? Number(form.term_months) : null,
      monthly_payment: form.monthly_payment ? Number(form.monthly_payment) : null,
      total_payable: form.total_payable ? Number(form.total_payable) : null,
      guarantor_name: form.guarantor_name || null,
      date_applied: form.date_applied,
      notes: form.notes || null,
    }

    const result = isEdit
      ? await supabase.from('loans').update(payload).eq('id', loan.id)
      : await supabase.from('loans').insert(payload)

    setSaving(false)
    if (result.error) setError(result.error.message)
    else onSaved()
  }

  const { monthly, total } = computeLoan(form.principal_amount, form.interest_rate, form.term_months)
  const peso = n => n > 0 ? `₱${Number(n).toLocaleString('en-PH', { minimumFractionDigits: 2 })}` : '—'

  return (
    <div className="fixed inset-0 bg-black/40 flex items-center justify-center z-50 p-4">
      <div className="bg-white rounded-xl shadow-xl w-full max-w-lg max-h-[90vh] overflow-y-auto">
        <div className="flex items-center justify-between px-6 py-4 border-b">
          <h2 className="font-semibold text-gray-800">{isEdit ? 'Edit Loan' : 'New Loan Application'}</h2>
          <button onClick={onClose} className="text-gray-400 hover:text-gray-600 text-xl leading-none">&times;</button>
        </div>

        <form onSubmit={handleSubmit} className="px-6 py-4 space-y-4">
          <Field label="Member *">
            <select
              required
              value={form.member_id}
              onChange={e => set('member_id', e.target.value)}
              className={input}
              disabled={isEdit}
            >
              <option value="">Select member...</option>
              {members.map(m => (
                <option key={m.id} value={m.id}>{m.full_name}</option>
              ))}
            </select>
          </Field>

          <div className="grid grid-cols-2 gap-4">
            <Field label="Loan Type *">
              <select value={form.loan_type} onChange={e => set('loan_type', e.target.value)} className={input}>
                <option value="regular">Regular</option>
                <option value="emergency">Emergency</option>
                <option value="multipurpose">Multipurpose</option>
              </select>
            </Field>
            <Field label="Date Applied *">
              <input
                required
                type="date"
                value={form.date_applied}
                onChange={e => set('date_applied', e.target.value)}
                className={input}
              />
            </Field>
          </div>

          <div className="grid grid-cols-2 gap-4">
            <Field label="Principal Amount (₱) *">
              <input
                required
                type="number"
                min="0"
                step="0.01"
                value={form.principal_amount}
                onChange={e => set('principal_amount', e.target.value)}
                className={input}
                placeholder="0.00"
              />
            </Field>
            <Field label="Interest Rate" hint="% per month">
              <input
                type="number"
                min="0"
                step="0.01"
                value={form.interest_rate}
                onChange={e => set('interest_rate', e.target.value)}
                className={input}
              />
            </Field>
          </div>

          <Field label="Term" hint="months">
            <input
              type="number"
              min="1"
              value={form.term_months}
              onChange={e => set('term_months', e.target.value)}
              className={input}
              placeholder="e.g. 12"
            />
          </Field>

          {/* Auto-computed preview */}
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

          <div className="grid grid-cols-2 gap-4">
            <Field label="Monthly Payment (₱)" hint="override">
              <input
                type="number"
                min="0"
                step="0.01"
                value={form.monthly_payment}
                onChange={e => set('monthly_payment', e.target.value)}
                className={input}
                placeholder="auto-computed"
              />
            </Field>
            <Field label="Total Payable (₱)" hint="override">
              <input
                type="number"
                min="0"
                step="0.01"
                value={form.total_payable}
                onChange={e => set('total_payable', e.target.value)}
                className={input}
                placeholder="auto-computed"
              />
            </Field>
          </div>

          <Field label="Guarantor / Co-Borrower" hint="for proxy loans">
            <input
              value={form.guarantor_name}
              onChange={e => set('guarantor_name', e.target.value)}
              className={input}
              placeholder="c/o Full Name"
            />
          </Field>

          <Field label="Notes">
            <textarea
              value={form.notes}
              onChange={e => set('notes', e.target.value)}
              className={`${input} resize-none`}
              rows={2}
              placeholder="Optional notes..."
            />
          </Field>

          {error && (
            <p className="text-sm text-red-600 bg-red-50 border border-red-200 rounded px-3 py-2">{error}</p>
          )}

          <div className="flex justify-end gap-3 pt-2">
            <button type="button" onClick={onClose} className="px-4 py-2 text-sm text-gray-600 hover:text-gray-800">
              Cancel
            </button>
            <button
              type="submit"
              disabled={saving}
              className="px-4 py-2 bg-blue-600 hover:bg-blue-700 disabled:opacity-50 text-white text-sm font-medium rounded-lg"
            >
              {saving ? 'Saving...' : isEdit ? 'Save Changes' : 'Submit Loan'}
            </button>
          </div>
        </form>
      </div>
    </div>
  )
}
