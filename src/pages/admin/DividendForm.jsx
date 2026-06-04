import { useState, useEffect } from 'react'
import { supabase } from '../../lib/supabase'

const peso = n => `₱${Number(n).toLocaleString('en-PH', { minimumFractionDigits: 2 })}`

export default function DividendForm({ record, onClose, onSaved }) {
  const isEdit = !!record
  const [form, setForm] = useState({
    fiscal_year:        record?.fiscal_year        ?? '',
    capital_amount:     record?.capital_amount     ?? '',
    interest_rate:      record?.interest_rate      ?? '',
    interest_earned:    record?.interest_earned    ?? '',
    total_interest_paid:record?.total_interest_paid?? 0,
    patronage_rate:     record?.patronage_rate     ?? 10,
    patronage_refund:   record?.patronage_refund   ?? '',
    total_earnings:     record?.total_earnings     ?? '',
    loan_deduction:     record?.loan_deduction     ?? 0,
    cash_released:      record?.cash_released      ?? '',
    release_date:       record?.release_date       ?? '',
  })
  const [saving, setSaving] = useState(false)
  const [error, setError]   = useState('')

  function set(k, v) { setForm(f => ({ ...f, [k]: v })) }

  // Auto-compute derived fields
  useEffect(() => {
    const capital  = Number(form.capital_amount)  || 0
    const rate     = Number(form.interest_rate)   || 0
    const patRate  = Number(form.patronage_rate)  || 0
    const intPaid  = Number(form.total_interest_paid) || 0
    const deduct   = Number(form.loan_deduction)  || 0

    const interest  = Math.round(capital * (rate / 100) * 100) / 100
    const patronage = Math.round(intPaid * (patRate / 100) * 100) / 100
    const total     = Math.round((interest + patronage) * 100) / 100
    const cash      = Math.max(0, Math.round((total - deduct) * 100) / 100)

    setForm(f => ({
      ...f,
      interest_earned:  interest.toFixed(2),
      patronage_refund: patronage.toFixed(2),
      total_earnings:   total.toFixed(2),
      cash_released:    cash.toFixed(2),
    }))
  }, [form.capital_amount, form.interest_rate, form.patronage_rate, form.total_interest_paid, form.loan_deduction])

  async function handleSubmit(e) {
    e.preventDefault()
    setError('')

    const payload = {
      fiscal_year:         form.fiscal_year,
      capital_amount:      Number(form.capital_amount),
      interest_rate:       Number(form.interest_rate),
      interest_earned:     Number(form.interest_earned),
      total_interest_paid: Number(form.total_interest_paid) || 0,
      patronage_rate:      Number(form.patronage_rate),
      patronage_refund:    Number(form.patronage_refund),
      total_earnings:      Number(form.total_earnings),
      loan_deduction:      Number(form.loan_deduction) || 0,
      cash_released:       Number(form.cash_released),
      release_date:        form.release_date || null,
    }

    setSaving(true)
    const { error: err } = isEdit
      ? await supabase.from('dividends').update(payload).eq('id', record.id)
      : await supabase.from('dividends').insert(payload)
    setSaving(false)

    if (err) { setError(err.message); return }
    onSaved()
  }

  return (
    <div className="fixed inset-0 bg-black/40 flex items-center justify-center z-50 p-4 overflow-y-auto">
      <div className="bg-white rounded-2xl shadow-xl w-full max-w-lg my-4">
        <div className="px-6 py-4 border-b border-gray-100 flex items-center justify-between">
          <h2 className="font-semibold text-gray-800">
            {isEdit ? 'Edit Dividend Record' : 'Record Dividend'}
          </h2>
          <button onClick={onClose} className="text-gray-400 hover:text-gray-600 text-xl leading-none">&times;</button>
        </div>

        <form onSubmit={handleSubmit} className="px-6 py-5 space-y-4">
          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-xs text-gray-500 mb-1">Fiscal Year *</label>
              <input
                type="text"
                required
                placeholder="e.g. 2025-2026"
                value={form.fiscal_year}
                onChange={e => set('fiscal_year', e.target.value)}
                className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>
            <div>
              <label className="block text-xs text-gray-500 mb-1">Release Date</label>
              <input
                type="date"
                value={form.release_date}
                onChange={e => set('release_date', e.target.value)}
                className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>
          </div>

          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-xs text-gray-500 mb-1">Capital Amount (₱) *</label>
              <input
                type="number"
                required
                min="0"
                step="0.01"
                value={form.capital_amount}
                onChange={e => set('capital_amount', e.target.value)}
                className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>
            <div>
              <label className="block text-xs text-gray-500 mb-1">Interest Rate (%) *</label>
              <input
                type="number"
                required
                min="0"
                step="0.01"
                placeholder="e.g. 16.56"
                value={form.interest_rate}
                onChange={e => set('interest_rate', e.target.value)}
                className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>
          </div>

          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-xs text-gray-500 mb-1">Total Interest Paid by Member (₱)</label>
              <input
                type="number"
                min="0"
                step="0.01"
                value={form.total_interest_paid}
                onChange={e => set('total_interest_paid', e.target.value)}
                className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>
            <div>
              <label className="block text-xs text-gray-500 mb-1">Patronage Rate (%)</label>
              <input
                type="number"
                min="0"
                step="0.01"
                value={form.patronage_rate}
                onChange={e => set('patronage_rate', e.target.value)}
                className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>
          </div>

          {/* Computed fields — read-only preview */}
          <div className="bg-blue-50 rounded-lg p-4 space-y-2 text-sm">
            <p className="text-xs font-semibold text-blue-700 mb-2 uppercase tracking-wide">Computed Summary</p>
            <div className="flex justify-between">
              <span className="text-gray-600">Interest Earned</span>
              <span className="font-medium text-gray-800">{peso(form.interest_earned || 0)}</span>
            </div>
            <div className="flex justify-between">
              <span className="text-gray-600">Patronage Refund</span>
              <span className="font-medium text-gray-800">{peso(form.patronage_refund || 0)}</span>
            </div>
            <div className="flex justify-between border-t border-blue-200 pt-2">
              <span className="font-semibold text-gray-700">Total Earnings</span>
              <span className="font-bold text-blue-700">{peso(form.total_earnings || 0)}</span>
            </div>
          </div>

          <div>
            <label className="block text-xs text-gray-500 mb-1">Loan Deduction (₱)</label>
            <input
              type="number"
              min="0"
              step="0.01"
              value={form.loan_deduction}
              onChange={e => set('loan_deduction', e.target.value)}
              className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
            <p className="text-xs text-gray-400 mt-1">Amount deducted from dividend to offset outstanding loan.</p>
          </div>

          <div className="bg-green-50 rounded-lg p-3 flex justify-between items-center">
            <span className="text-sm font-semibold text-gray-700">Cash to Release</span>
            <span className="text-xl font-bold text-green-700">{peso(form.cash_released || 0)}</span>
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
              {saving ? 'Saving...' : isEdit ? 'Save Changes' : 'Record Dividend'}
            </button>
          </div>
        </form>
      </div>
    </div>
  )
}
