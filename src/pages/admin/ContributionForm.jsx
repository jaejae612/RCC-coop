import { useState, useEffect } from 'react'
import { supabase } from '../../lib/supabase'
import { useAuth } from '../../context/AuthContext'

const input = 'w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500'

function Field({ label, children }) {
  return (
    <div>
      <label className="block text-sm font-medium text-gray-700 mb-1">{label}</label>
      {children}
    </div>
  )
}

// Returns ISO week number (1-53) for a given date
function getISOWeek(date) {
  const d = new Date(Date.UTC(date.getFullYear(), date.getMonth(), date.getDate()))
  const day = d.getUTCDay() || 7
  d.setUTCDate(d.getUTCDate() + 4 - day)
  const yearStart = new Date(Date.UTC(d.getUTCFullYear(), 0, 1))
  return Math.ceil((((d - yearStart) / 86400000) + 1) / 7)
}

// Returns the ISO week year (may differ from calendar year near Jan 1)
function getISOWeekYear(date) {
  const d = new Date(Date.UTC(date.getFullYear(), date.getMonth(), date.getDate()))
  const day = d.getUTCDay() || 7
  d.setUTCDate(d.getUTCDate() + 4 - day)
  return d.getUTCFullYear()
}

// Returns Monday date of a given ISO week string e.g. '2026-W23'
function weekMonday(isoWeekStr) {
  const [yearStr, wStr] = isoWeekStr.split('-W')
  const year = Number(yearStr)
  const week = Number(wStr)
  const jan4 = new Date(year, 0, 4)
  const monday = new Date(jan4)
  monday.setDate(jan4.getDate() - ((jan4.getDay() || 7) - 1) + (week - 1) * 7)
  return monday
}

// Returns Saturday (end of week) date string for a given ISO week string
function weekSaturday(isoWeekStr) {
  const mon = weekMonday(isoWeekStr)
  const sat = new Date(mon)
  sat.setDate(mon.getDate() + 5)
  return sat.toISOString().slice(0, 10)
}

// Human-readable label e.g. '2026-W23' → 'W23 · Jun 2–7, 2026'
function weekLabel(isoWeekStr) {
  const mon = weekMonday(isoWeekStr)
  const sat = new Date(mon); sat.setDate(mon.getDate() + 5)
  const fmt = d => d.toLocaleDateString('en-PH', { month: 'short', day: 'numeric' })
  const [yearStr, wStr] = isoWeekStr.split('-W')
  return `W${wStr} · ${fmt(mon)}–${fmt(sat)}, ${yearStr}`
}

function getCutoffOptions() {
  const options = []
  const now = new Date()
  // Generate last 56 weeks (≈13 months) plus 2 upcoming weeks
  for (let i = -2; i < 57; i++) {
    const d = new Date(now)
    d.setDate(now.getDate() - i * 7)
    const year = getISOWeekYear(d)
    const week = getISOWeek(d)
    options.push(`${year}-W${String(week).padStart(2, '0')}`)
  }
  // Deduplicate and sort descending (most recent first)
  return [...new Set(options)].sort().reverse()
}

export default function ContributionForm({ contribution, onClose, onSaved }) {
  const { session } = useAuth()
  const isEdit = !!contribution
  const [members, setMembers] = useState([])
  const [form, setForm] = useState({
    member_id: contribution?.member_id ?? '',
    amount: contribution?.amount ?? '',
    cutoff_period: contribution?.cutoff_period ?? '',
    cutoff_date: contribution?.cutoff_date ?? '',
    payment_date: contribution?.payment_date ?? '',
    notes: contribution?.notes ?? '',
  })
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState('')

  useEffect(() => {
    supabase
      .from('members')
      .select('id, full_name, contribution_per_cutoff')
      .eq('status', 'active')
      .order('full_name')
      .then(({ data }) => setMembers(data ?? []))
  }, [])

  function set(field, value) {
    setForm(f => ({ ...f, [field]: value }))
  }

  function handleMemberChange(memberId) {
    set('member_id', memberId)
    if (!form.amount) {
      const member = members.find(m => m.id === memberId)
      if (member?.contribution_per_cutoff) {
        set('amount', String(member.contribution_per_cutoff))
      }
    }
  }

  function handleCutoffPeriodChange(period) {
    set('cutoff_period', period)
    if (period) {
      set('cutoff_date', weekSaturday(period))
    }
  }

  async function handleSubmit(e) {
    e.preventDefault()
    setError('')
    setSaving(true)

    const payload = {
      member_id: form.member_id,
      amount: Number(form.amount),
      cutoff_period: form.cutoff_period,
      cutoff_date: form.cutoff_date,
      payment_date: form.payment_date || null,
      notes: form.notes || null,
      recorded_by: session?.user?.id ?? null,
    }

    const result = isEdit
      ? await supabase.from('contributions').update(payload).eq('id', contribution.id)
      : await supabase.from('contributions').insert(payload)

    setSaving(false)
    if (result.error) setError(result.error.message)
    else onSaved()
  }

  const cutoffOptions = getCutoffOptions()

  return (
    <div className="fixed inset-0 bg-black/40 flex items-center justify-center z-50 p-4">
      <div className="bg-white rounded-xl shadow-xl w-full max-w-lg max-h-[90vh] overflow-y-auto">
        <div className="flex items-center justify-between px-6 py-4 border-b">
          <h2 className="font-semibold text-gray-800">
            {isEdit ? 'Edit Contribution' : 'Record Contribution'}
          </h2>
          <button onClick={onClose} className="text-gray-400 hover:text-gray-600 text-xl leading-none">&times;</button>
        </div>

        <form onSubmit={handleSubmit} className="px-6 py-4 space-y-4">
          <Field label="Member *">
            <select
              required
              value={form.member_id}
              onChange={e => handleMemberChange(e.target.value)}
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
            <Field label="Cutoff Period *">
              <select
                required
                value={form.cutoff_period}
                onChange={e => handleCutoffPeriodChange(e.target.value)}
                className={input}
              >
                <option value="">Select period...</option>
                {cutoffOptions.map(p => (
                  <option key={p} value={p}>{weekLabel(p)}</option>
                ))}
              </select>
            </Field>
            <Field label="Amount (₱) *">
              <input
                required
                type="number"
                min="0"
                step="0.01"
                value={form.amount}
                onChange={e => set('amount', e.target.value)}
                className={input}
                placeholder="0.00"
              />
            </Field>
          </div>

          <div className="grid grid-cols-2 gap-4">
            <Field label="Cutoff Date *">
              <input
                required
                type="date"
                value={form.cutoff_date}
                onChange={e => set('cutoff_date', e.target.value)}
                className={input}
              />
            </Field>
            <Field label="Payment Date">
              <input
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
              {saving ? 'Saving...' : isEdit ? 'Save Changes' : 'Record'}
            </button>
          </div>
        </form>
      </div>
    </div>
  )
}
