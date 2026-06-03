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

const peso = n => `₱${Number(n).toLocaleString('en-PH', { minimumFractionDigits: 2 })}`

export default function RepaymentForm({ repayment, preselectedLoan, onClose, onSaved }) {
  const { session } = useAuth()
  const isEdit = !!repayment
  const [releasedLoans, setReleasedLoans] = useState([])
  const [selectedLoan, setSelectedLoan] = useState(null)
  const [totalPaid, setTotalPaid] = useState(0)
  const [form, setForm] = useState({
    loan_id: repayment?.loan_id ?? preselectedLoan?.id ?? '',
    amount_paid: repayment?.amount_paid ?? '',
    payment_date: repayment?.payment_date ?? new Date().toISOString().slice(0, 10),
    notes: repayment?.notes ?? '',
  })
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState('')

  useEffect(() => {
    supabase
      .from('loans')
      .select('id, loan_number, loan_type, principal_amount, total_payable, member_id, members(full_name)')
      .eq('status', 'released')
      .order('created_at', { ascending: false })
      .then(({ data }) => {
        setReleasedLoans(data ?? [])
        // If preselected, set it
        if (preselectedLoan) {
          const found = (data ?? []).find(l => l.id === preselectedLoan.id)
          if (found) selectLoan(found)
        }
      })
  }, [])

  async function selectLoan(loan) {
    setSelectedLoan(loan)
    // Load total paid so far
    const { data } = await supabase
      .from('loan_payments')
      .select('amount_paid')
      .eq('loan_id', loan.id)
    const paid = (data ?? []).reduce((s, r) => s + Number(r.amount_paid), 0)
    setTotalPaid(paid)
  }

  async function handleLoanChange(loanId) {
    set('loan_id', loanId)
    const loan = releasedLoans.find(l => l.id === loanId)
    if (loan) await selectLoan(loan)
    else { setSelectedLoan(null); setTotalPaid(0) }
  }

  function set(field, value) {
    setForm(f => ({ ...f, [field]: value }))
  }

  async function handleSubmit(e) {
    e.preventDefault()
    setError('')
    setSaving(true)

    const loan = releasedLoans.find(l => l.id === form.loan_id)
    const payload = {
      loan_id: form.loan_id,
      member_id: loan?.member_id ?? null,
      amount_paid: Number(form.amount_paid),
      payment_date: form.payment_date,
      notes: form.notes || null,
      recorded_by: session?.user?.id ?? null,
    }

    const result = isEdit
      ? await supabase.from('loan_payments').update(payload).eq('id', repayment.id)
      : await supabase.from('loan_payments').insert(payload)

    if (result.error) {
      setSaving(false)
      setError(result.error.message)
      return
    }

    // Check if loan is now fully paid
    if (!isEdit && loan) {
      const newTotalPaid = totalPaid + Number(form.amount_paid)
      const totalPayable = Number(loan.total_payable ?? loan.principal_amount)
      if (newTotalPaid >= totalPayable) {
        await supabase.from('loans').update({ status: 'completed' }).eq('id', form.loan_id)
      }
    }

    setSaving(false)
    onSaved()
  }

  const remaining = selectedLoan
    ? Math.max(0, Number(selectedLoan.total_payable ?? selectedLoan.principal_amount) - totalPaid)
    : null

  return (
    <div className="fixed inset-0 bg-black/40 flex items-center justify-center z-50 p-4">
      <div className="bg-white rounded-xl shadow-xl w-full max-w-md max-h-[90vh] overflow-y-auto">
        <div className="flex items-center justify-between px-6 py-4 border-b">
          <h2 className="font-semibold text-gray-800">{isEdit ? 'Edit Payment' : 'Record Payment'}</h2>
          <button onClick={onClose} className="text-gray-400 hover:text-gray-600 text-xl leading-none">&times;</button>
        </div>

        <form onSubmit={handleSubmit} className="px-6 py-4 space-y-4">
          <Field label="Loan *">
            <select
              required
              value={form.loan_id}
              onChange={e => handleLoanChange(e.target.value)}
              className={input}
              disabled={isEdit || !!preselectedLoan}
            >
              <option value="">Select loan...</option>
              {releasedLoans.map(l => (
                <option key={l.id} value={l.id}>
                  {l.members?.full_name} — #{l.loan_number} {l.loan_type} {peso(l.principal_amount)}
                </option>
              ))}
            </select>
          </Field>

          {/* Loan balance preview */}
          {selectedLoan && (
            <div className="bg-gray-50 rounded-lg px-4 py-3 text-sm grid grid-cols-3 gap-2">
              <div>
                <span className="text-gray-400 text-xs block">Principal</span>
                <span className="font-medium">{peso(selectedLoan.principal_amount)}</span>
              </div>
              <div>
                <span className="text-gray-400 text-xs block">Paid</span>
                <span className="font-medium text-green-700">{peso(totalPaid)}</span>
              </div>
              <div>
                <span className="text-gray-400 text-xs block">Remaining</span>
                <span className={`font-semibold ${remaining === 0 ? 'text-green-600' : 'text-red-600'}`}>
                  {peso(remaining)}
                </span>
              </div>
            </div>
          )}

          <div className="grid grid-cols-2 gap-4">
            <Field label="Amount Paid (₱) *">
              <input
                required
                type="number"
                min="0"
                step="0.01"
                value={form.amount_paid}
                onChange={e => set('amount_paid', e.target.value)}
                className={input}
                placeholder="0.00"
              />
            </Field>
            <Field label="Payment Date *">
              <input
                required
                type="date"
                value={form.payment_date}
                onChange={e => set('payment_date', e.target.value)}
                className={input}
              />
            </Field>
          </div>

          <Field label="Notes">
            <input
              value={form.notes}
              onChange={e => set('notes', e.target.value)}
              className={input}
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
              {saving ? 'Saving...' : isEdit ? 'Save Changes' : 'Record Payment'}
            </button>
          </div>
        </form>
      </div>
    </div>
  )
}
