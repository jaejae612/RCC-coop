import { useState, useEffect } from 'react'
import { supabase } from '../../lib/supabase'

const TX_LABELS = {
  loan_release:   'Loan Release',
  loan_payment:   'Loan Payment',
  petty_cash:     'Petty Cash',
  store_purchase: 'Store Purchase',
  bank_interest:  'Bank Interest',
  bank_tax:       'Bank Tax',
  other:          'Other',
}

const peso = n => `₱${Number(n).toLocaleString('en-PH', { minimumFractionDigits: 2 })}`
const today = () => new Date().toISOString().split('T')[0]

export default function CashFlowForm({ entry, lastBalance, onClose, onSaved }) {
  const isEdit = !!entry
  const [form, setForm] = useState({
    transaction_date: entry?.transaction_date ?? today(),
    description:      entry?.description ?? '',
    transaction_type: entry?.transaction_type ?? 'other',
    withdrawal:       entry?.withdrawal ?? '',
    deposit:          entry?.deposit ?? '',
    balance_after:    entry?.balance_after ?? '',
  })
  const [saving, setSaving] = useState(false)
  const [error, setError]   = useState('')

  // Auto-compute balance when amounts change (only for new entries)
  useEffect(() => {
    if (isEdit) return
    const w = Number(form.withdrawal) || 0
    const d = Number(form.deposit)    || 0
    setForm(f => ({ ...f, balance_after: (lastBalance + d - w).toFixed(2) }))
  }, [form.withdrawal, form.deposit])

  function set(k, v) { setForm(f => ({ ...f, [k]: v })) }

  async function handleSubmit(e) {
    e.preventDefault()
    setError('')

    const w = Number(form.withdrawal) || null
    const d = Number(form.deposit)    || null
    const b = Number(form.balance_after)

    if (!w && !d)   { setError('Enter at least one of: withdrawal or deposit.'); return }
    if (isNaN(b))   { setError('Balance after is required.'); return }

    setSaving(true)
    const payload = {
      transaction_date: form.transaction_date,
      description:      form.description,
      transaction_type: form.transaction_type,
      withdrawal:       w,
      deposit:          d,
      balance_after:    b,
    }

    const { error: err } = isEdit
      ? await supabase.from('cash_flow').update(payload).eq('id', entry.id)
      : await supabase.from('cash_flow').insert(payload)

    setSaving(false)
    if (err) { setError(err.message); return }
    onSaved()
  }

  return (
    <div className="fixed inset-0 bg-black/40 flex items-center justify-center z-50 p-4">
      <div className="bg-white rounded-2xl shadow-xl w-full max-w-md">
        <div className="px-6 py-4 border-b border-gray-100 flex items-center justify-between">
          <h2 className="font-semibold text-gray-800">
            {isEdit ? 'Edit Transaction' : 'Record Transaction'}
          </h2>
          <button onClick={onClose} className="text-gray-400 hover:text-gray-600 text-xl leading-none">&times;</button>
        </div>

        <form onSubmit={handleSubmit} className="px-6 py-5 space-y-4">
          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-xs text-gray-500 mb-1">Date *</label>
              <input
                type="date"
                required
                value={form.transaction_date}
                onChange={e => set('transaction_date', e.target.value)}
                className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>
            <div>
              <label className="block text-xs text-gray-500 mb-1">Type *</label>
              <select
                value={form.transaction_type}
                onChange={e => set('transaction_type', e.target.value)}
                className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
              >
                {Object.entries(TX_LABELS).map(([k, v]) => (
                  <option key={k} value={k}>{v}</option>
                ))}
              </select>
            </div>
          </div>

          <div>
            <label className="block text-xs text-gray-500 mb-1">Description *</label>
            <input
              type="text"
              required
              value={form.description}
              onChange={e => set('description', e.target.value)}
              placeholder="e.g. Loan released to Juan Dela Cruz"
              className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
          </div>

          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-xs text-gray-500 mb-1">Withdrawal (₱)</label>
              <input
                type="number"
                min="0"
                step="0.01"
                value={form.withdrawal}
                onChange={e => set('withdrawal', e.target.value)}
                placeholder="0.00"
                className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>
            <div>
              <label className="block text-xs text-gray-500 mb-1">Deposit (₱)</label>
              <input
                type="number"
                min="0"
                step="0.01"
                value={form.deposit}
                onChange={e => set('deposit', e.target.value)}
                placeholder="0.00"
                className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>
          </div>

          <div>
            <label className="block text-xs text-gray-500 mb-1">Balance After (₱) *</label>
            <input
              type="number"
              step="0.01"
              required
              value={form.balance_after}
              onChange={e => set('balance_after', e.target.value)}
              className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
            {!isEdit && (
              <p className="text-xs text-gray-400 mt-1">
                Auto-computed from last balance ({peso(lastBalance)}). Adjust if needed.
              </p>
            )}
          </div>

          {error && <p className="text-sm text-red-600">{error}</p>}

          <div className="flex gap-3 pt-2">
            <button
              type="button"
              onClick={onClose}
              className="flex-1 border border-gray-300 text-gray-700 text-sm font-medium py-2 rounded-lg hover:bg-gray-50"
            >
              Cancel
            </button>
            <button
              type="submit"
              disabled={saving}
              className="flex-1 bg-blue-600 hover:bg-blue-700 disabled:opacity-50 text-white text-sm font-medium py-2 rounded-lg"
            >
              {saving ? 'Saving...' : isEdit ? 'Save Changes' : 'Record'}
            </button>
          </div>
        </form>
      </div>
    </div>
  )
}
