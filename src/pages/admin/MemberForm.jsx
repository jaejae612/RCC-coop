import { useState } from 'react'
import { supabase } from '../../lib/supabase'

export default function MemberForm({ member, onClose, onSaved }) {
  const isEdit = !!member
  const [form, setForm] = useState({
    full_name: member?.full_name ?? '',
    employee_id: member?.employee_id ?? '',
    position: member?.position ?? '',
    department: member?.department ?? '',
    contact_number: member?.contact_number ?? '',
    employment_type: member?.employment_type ?? 'regular',
    membership_tier: member?.membership_tier ?? 'regular_member',
    date_joined: member?.date_joined ?? '',
    status: member?.status ?? 'active',
    contribution_per_cutoff: member?.contribution_per_cutoff ?? '',
  })
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState('')

  function set(field, value) {
    setForm(f => ({ ...f, [field]: value }))
  }

  async function handleSubmit(e) {
    e.preventDefault()
    setError('')
    setSaving(true)

    const payload = {
      ...form,
      contribution_per_cutoff: Number(form.contribution_per_cutoff) || 0,
    }

    let result
    if (isEdit) {
      result = await supabase.from('members').update(payload).eq('id', member.id)
    } else {
      result = await supabase.from('members').insert(payload)
    }

    setSaving(false)
    if (result.error) {
      setError(result.error.message)
    } else {
      onSaved()
    }
  }

  return (
    <div className="fixed inset-0 bg-black/40 flex items-center justify-center z-50 p-4">
      <div className="bg-white rounded-xl shadow-xl w-full max-w-lg max-h-[90vh] overflow-y-auto">
        <div className="flex items-center justify-between px-6 py-4 border-b">
          <h2 className="font-semibold text-gray-800">{isEdit ? 'Edit Member' : 'Add Member'}</h2>
          <button onClick={onClose} className="text-gray-400 hover:text-gray-600 text-xl leading-none">&times;</button>
        </div>

        <form onSubmit={handleSubmit} className="px-6 py-4 space-y-4">
          <Field label="Full Name *">
            <input required value={form.full_name} onChange={e => set('full_name', e.target.value)} className={input} />
          </Field>
          <div className="grid grid-cols-2 gap-4">
            <Field label="Employee ID">
              <input value={form.employee_id} onChange={e => set('employee_id', e.target.value)} className={input} />
            </Field>
            <Field label="Contact Number">
              <input value={form.contact_number} onChange={e => set('contact_number', e.target.value)} className={input} />
            </Field>
          </div>
          <div className="grid grid-cols-2 gap-4">
            <Field label="Position">
              <input value={form.position} onChange={e => set('position', e.target.value)} className={input} />
            </Field>
            <Field label="Department">
              <input value={form.department} onChange={e => set('department', e.target.value)} className={input} />
            </Field>
          </div>
          <div className="grid grid-cols-2 gap-4">
            <Field label="Employment Type">
              <select value={form.employment_type} onChange={e => set('employment_type', e.target.value)} className={input}>
                <option value="regular">Regular</option>
                <option value="non_regular">Non-Regular</option>
              </select>
            </Field>
            <Field label="Membership Tier">
              <select value={form.membership_tier} onChange={e => set('membership_tier', e.target.value)} className={input}>
                <option value="regular_member">Regular Member</option>
                <option value="associate_member">Associate Member</option>
              </select>
            </Field>
          </div>
          <div className="grid grid-cols-2 gap-4">
            <Field label="Date Joined *">
              <input required type="date" value={form.date_joined} onChange={e => set('date_joined', e.target.value)} className={input} />
            </Field>
            <Field label="Status">
              <select value={form.status} onChange={e => set('status', e.target.value)} className={input}>
                <option value="active">Active</option>
                <option value="inactive">Inactive</option>
                <option value="on_leave">On Leave</option>
              </select>
            </Field>
          </div>
          <Field label="Default Contribution per Cutoff (₱)">
            <input
              type="number"
              min="0"
              step="0.01"
              value={form.contribution_per_cutoff}
              onChange={e => set('contribution_per_cutoff', e.target.value)}
              className={input}
              placeholder="0.00"
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
              {saving ? 'Saving...' : isEdit ? 'Save Changes' : 'Add Member'}
            </button>
          </div>
        </form>
      </div>
    </div>
  )
}

function Field({ label, children }) {
  return (
    <div>
      <label className="block text-sm font-medium text-gray-700 mb-1">{label}</label>
      {children}
    </div>
  )
}

const input = 'w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500'
