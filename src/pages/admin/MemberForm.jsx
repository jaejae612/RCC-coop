import { useEffect, useState } from 'react'
import { supabase } from '../../lib/supabase'

const SUFFIXES = ['', 'Jr.', 'Sr.', 'II', 'III', 'IV', 'V']
const ROLES    = ['member', 'officer', 'admin', 'owner']

function genTempPassword() {
  const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789'
  let s = 'Rcc@'
  for (let i = 0; i < 6; i++) s += chars[Math.floor(Math.random() * chars.length)]
  return s
}

// ── Embedded account management section ──────────────────────────────────────
function AccountSection({ memberId, memberEmail }) {
  const [profile,     setProfile]     = useState(undefined) // undefined = loading
  const [role,        setRole]        = useState('member')
  const [roleSaving,  setRoleSaving]  = useState(false)
  const [showCreate,  setShowCreate]  = useState(false)
  const [createEmail, setCreateEmail] = useState(memberEmail ?? '')
  const [createRole,  setCreateRole]  = useState('member')
  const [password]                    = useState(() => genTempPassword())
  const [creating,    setCreating]    = useState(false)
  const [createError, setCreateError] = useState('')
  const [createdCreds, setCreatedCreds] = useState(null)
  // Link existing account
  const [showLink,  setShowLink]  = useState(false)
  const [linkEmail, setLinkEmail] = useState(memberEmail ?? '')
  const [linking,   setLinking]   = useState(false)
  const [linkError, setLinkError] = useState('')

  useEffect(() => { fetchProfile() }, [memberId])

  async function fetchProfile() {
    const { data } = await supabase
      .from('profiles')
      .select('id, role, first_login, email')
      .eq('member_id', memberId)
      .maybeSingle()
    setProfile(data ?? null)
    if (data) setRole(data.role)
  }

  async function saveRole() {
    setRoleSaving(true)
    await supabase.from('profiles').update({ role }).eq('id', profile.id)
    setRoleSaving(false)
    fetchProfile()
  }

  async function forceReset() {
    if (!confirm('Force this user to reset their password on next login?')) return
    await supabase.from('profiles').update({ first_login: true }).eq('id', profile.id)
    fetchProfile()
  }

  async function handleCreate(e) {
    e.preventDefault()
    setCreateError('')
    setCreating(true)
    const { data, error: fnErr } = await supabase.functions.invoke('create-user', {
      body: { email: createEmail, password, role: createRole, member_id: memberId },
    })
    setCreating(false)
    if (data?.error || fnErr) {
      setCreateError(data?.error ?? fnErr?.message ?? 'Unknown error')
      return
    }
    setCreatedCreds({ email: createEmail, password })
    setShowCreate(false)
    fetchProfile()
  }

  async function handleLink(e) {
    e.preventDefault()
    setLinkError('')
    setLinking(true)
    const { data: existing } = await supabase
      .from('profiles')
      .select('id, member_id')
      .eq('email', linkEmail.toLowerCase().trim())
      .maybeSingle()
    if (!existing) {
      setLinkError('No account found with that email.')
      setLinking(false)
      return
    }
    if (existing.member_id && existing.member_id !== memberId) {
      setLinkError('That account is already linked to a different member.')
      setLinking(false)
      return
    }
    const { error } = await supabase
      .from('profiles')
      .update({ member_id: memberId })
      .eq('id', existing.id)
    setLinking(false)
    if (error) { setLinkError(error.message); return }
    setShowLink(false)
    setLinkEmail('')
    fetchProfile()
  }

  if (profile === undefined) {
    return <p className="text-xs text-gray-400">Loading...</p>
  }

  return (
    <div className="space-y-3">
      {/* Success banner after creating */}
      {createdCreds && (
        <div className="bg-green-50 border border-green-200 rounded-lg px-3 py-2 text-xs text-green-800">
          <p className="font-semibold mb-0.5">Account created</p>
          <p>Email: <span className="font-mono">{createdCreds.email}</span></p>
          <p>Temp password: <span className="font-mono font-bold tracking-wider">{createdCreds.password}</span></p>
          <p className="text-green-600 mt-1">Share these with the member.</p>
        </div>
      )}

      {profile ? (
        /* Has account — show role, setup status */
        <div className="space-y-2">
          <div className="flex items-center gap-2 text-xs">
            <span className="text-gray-500 w-12 shrink-0">Email:</span>
            <span className="text-gray-700 font-mono truncate">{profile.email ?? '—'}</span>
          </div>
          <div className="flex items-center gap-2">
            <span className="text-xs text-gray-500 w-12 shrink-0">Role:</span>
            <select
              value={role}
              onChange={e => setRole(e.target.value)}
              className="border border-gray-300 rounded px-2 py-1 text-xs focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
              {ROLES.map(r => <option key={r} value={r}>{r}</option>)}
            </select>
            {role !== profile.role && (
              <button
                onClick={saveRole}
                disabled={roleSaving}
                className="text-xs bg-blue-600 text-white px-2.5 py-1 rounded disabled:opacity-50 hover:bg-blue-700"
              >
                {roleSaving ? '...' : 'Save'}
              </button>
            )}
          </div>
          <div className="flex items-center gap-2 text-xs">
            <span className="text-gray-500 w-12 shrink-0">Setup:</span>
            {profile.first_login
              ? <span className="text-amber-700 bg-amber-50 px-2 py-0.5 rounded-full font-medium">pending setup</span>
              : <span className="text-gray-400">complete</span>
            }
            {!profile.first_login && (
              <button onClick={forceReset} className="text-amber-600 hover:underline ml-1">
                Force reset
              </button>
            )}
          </div>
        </div>
      ) : showCreate ? (
        /* Create account form */
        <form onSubmit={handleCreate} className="space-y-3">
          <div>
            <label className="block text-xs font-medium text-gray-600 mb-1">Login Email</label>
            <input
              type="email"
              value={createEmail}
              onChange={e => setCreateEmail(e.target.value)}
              required
              placeholder="e.g. juan.delacruz@gmail.com"
              className="w-full border border-gray-300 rounded-lg px-3 py-2 text-xs focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
          </div>
          <div>
            <label className="block text-xs font-medium text-gray-600 mb-1">Role</label>
            <select
              value={createRole}
              onChange={e => setCreateRole(e.target.value)}
              className="w-full border border-gray-300 rounded-lg px-3 py-2 text-xs focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
              {ROLES.map(r => <option key={r} value={r}>{r}</option>)}
            </select>
          </div>
          <div className="bg-gray-50 rounded-lg px-3 py-2 text-xs">
            <p className="text-gray-500 mb-0.5">Temporary password</p>
            <p className="font-mono font-semibold tracking-wider text-gray-800">{password}</p>
          </div>
          {createError && (
            <p className="text-xs text-red-600 bg-red-50 border border-red-200 rounded px-2 py-1.5">{createError}</p>
          )}
          <div className="flex gap-2">
            <button
              type="button"
              onClick={() => { setShowCreate(false); setCreateError('') }}
              className="flex-1 text-xs text-gray-500 hover:text-gray-700 py-1.5 border border-gray-200 rounded-lg"
            >
              Cancel
            </button>
            <button
              type="submit"
              disabled={creating || !createEmail}
              className="flex-1 text-xs bg-blue-600 text-white py-1.5 rounded-lg disabled:opacity-50 hover:bg-blue-700"
            >
              {creating ? 'Creating...' : 'Create Account'}
            </button>
          </div>
        </form>
      ) : showLink ? (
        /* Link existing account form */
        <form onSubmit={handleLink} className="space-y-3">
          <p className="text-xs text-gray-500">Enter the login email of the existing account to link it to this member.</p>
          <div>
            <label className="block text-xs font-medium text-gray-600 mb-1">Existing Account Email</label>
            <input
              type="email"
              value={linkEmail}
              onChange={e => setLinkEmail(e.target.value)}
              required
              placeholder="e.g. jose.uy.globe@gmail.com"
              className="w-full border border-gray-300 rounded-lg px-3 py-2 text-xs focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
          </div>
          {linkError && (
            <p className="text-xs text-red-600 bg-red-50 border border-red-200 rounded px-2 py-1.5">{linkError}</p>
          )}
          <div className="flex gap-2">
            <button
              type="button"
              onClick={() => { setShowLink(false); setLinkError('') }}
              className="flex-1 text-xs text-gray-500 hover:text-gray-700 py-1.5 border border-gray-200 rounded-lg"
            >
              Cancel
            </button>
            <button
              type="submit"
              disabled={linking || !linkEmail}
              className="flex-1 text-xs bg-green-600 text-white py-1.5 rounded-lg disabled:opacity-50 hover:bg-green-700"
            >
              {linking ? 'Linking...' : 'Link Account'}
            </button>
          </div>
        </form>
      ) : (
        /* No account — show both options */
        <div className="space-y-2">
          <p className="text-xs text-gray-400">No login account linked to this member.</p>
          <div className="flex gap-2">
            <button
              onClick={() => { setLinkEmail(memberEmail ?? ''); setShowLink(true) }}
              className="flex-1 text-xs bg-green-600 text-white px-3 py-1.5 rounded-lg hover:bg-green-700"
            >
              Link Existing
            </button>
            <button
              onClick={() => { setCreateEmail(memberEmail ?? ''); setShowCreate(true) }}
              className="flex-1 text-xs bg-blue-600 text-white px-3 py-1.5 rounded-lg hover:bg-blue-700"
            >
              Create New
            </button>
          </div>
        </div>
      )}
    </div>
  )
}

// ── Main form ─────────────────────────────────────────────────────────────────
export default function MemberForm({ member, onClose, onSaved }) {
  const isEdit = !!member
  const [form, setForm] = useState({
    first_name:              member?.first_name              ?? '',
    last_name:               member?.last_name               ?? '',
    name_suffix:             member?.name_suffix             ?? '',
    email:                   member?.email                   ?? '',
    employee_id:             member?.employee_id             ?? '',
    position:                member?.position                ?? '',
    department:              member?.department               ?? '',
    contact_number:          member?.contact_number          ?? '',
    address:                 member?.address                 ?? '',
    employment_type:         member?.employment_type         ?? 'regular',
    membership_tier:         member?.membership_tier         ?? 'regular_member',
    date_joined:             member?.date_joined             ?? '',
    status:                  member?.status                  ?? 'active',
    contribution_per_cutoff: member?.contribution_per_cutoff ?? '',
  })
  const [saving, setSaving] = useState(false)
  const [error,  setError]  = useState('')

  function set(field, value) {
    setForm(f => ({ ...f, [field]: value }))
  }

  const fullName = [form.first_name.trim(), form.last_name.trim(), form.name_suffix.trim()]
    .filter(Boolean).join(' ')

  async function handleSubmit(e) {
    e.preventDefault()
    setError('')
    setSaving(true)

    const payload = {
      ...form,
      full_name:               fullName,
      name_suffix:             form.name_suffix.trim()   || null,
      address:                 form.address.trim()       || null,
      email:                   form.email.trim()         || null,
      employee_id:             form.employee_id.trim()   || null,
      contact_number:          form.contact_number.trim()|| null,
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

          {/* ── Name ──────────────────────────────────────────────── */}
          <div className="grid grid-cols-2 gap-4">
            <Field label="First Name *">
              <input
                required
                value={form.first_name}
                onChange={e => set('first_name', e.target.value)}
                placeholder="e.g. Juan"
                className={input}
              />
            </Field>
            <Field label="Last Name *">
              <input
                required
                value={form.last_name}
                onChange={e => set('last_name', e.target.value)}
                placeholder="e.g. Dela Cruz"
                className={input}
              />
            </Field>
          </div>

          <Field label="Suffix (optional)">
            <select value={form.name_suffix} onChange={e => set('name_suffix', e.target.value)} className={input}>
              {SUFFIXES.map(s => <option key={s} value={s}>{s || '— None —'}</option>)}
            </select>
          </Field>

          {fullName && (
            <p className="text-xs text-gray-400">
              Full name: <span className="font-medium text-gray-600">{fullName}</span>
            </p>
          )}

          {/* ── Contact / IDs ──────────────────────────────────────── */}
          <Field label="Personal Email">
            <input
              type="email"
              value={form.email}
              onChange={e => set('email', e.target.value)}
              placeholder="e.g. juan.delacruz@gmail.com"
              className={input}
            />
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

          <Field label="Address (optional)">
            <textarea
              value={form.address}
              onChange={e => set('address', e.target.value)}
              rows={2}
              placeholder="e.g. 123 Rizal St., Cebu City"
              className={`${input} resize-none`}
            />
          </Field>

          {/* ── Membership ─────────────────────────────────────────── */}
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
              <input
                required
                type="date"
                value={form.date_joined}
                onChange={e => set('date_joined', e.target.value)}
                className={input}
              />
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

        {/* ── App Account (edit mode only) ──────────────────────── */}
        {isEdit && (
          <div className="px-6 pb-6 border-t border-gray-100 pt-4">
            <h3 className="text-sm font-semibold text-gray-700 mb-3">App Account</h3>
            <AccountSection memberId={member.id} memberEmail={form.email} />
          </div>
        )}
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
