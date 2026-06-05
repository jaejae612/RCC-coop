import { useEffect, useState } from 'react'
import { supabase } from '../../lib/supabase'
import Badge from '../../components/ui/Badge'

const ROLES = ['member', 'officer', 'admin', 'owner']

// Generates a random temp password like Rcc@A3K9MZ
function genTempPassword() {
  const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789'
  let s = 'Rcc@'
  for (let i = 0; i < 6; i++) s += chars[Math.floor(Math.random() * chars.length)]
  return s
}

// ── Create Account Modal ──────────────────────────────────────────────────────
// linkedIds: Set of member_ids that already have a profile account
function CreateAccountModal({ onClose, onCreated, linkedIds }) {
  const [allMembers, setAllMembers] = useState([])
  const [memberId,   setMemberId]   = useState('')
  const [email,      setEmail]      = useState('')
  const [role,       setRole]       = useState('member')
  const [password]                  = useState(() => genTempPassword())
  const [saving,     setSaving]     = useState(false)
  const [error,      setError]      = useState('')

  // Members available to link = active members not yet linked to any account
  const unlinked = allMembers.filter(m => !linkedIds.has(m.id))

  useEffect(() => {
    supabase
      .from('members')
      .select('id, full_name')
      .eq('status', 'active')
      .order('full_name')
      .then(({ data }) => setAllMembers(data ?? []))
  }, [])

  function handleMemberChange(id) {
    setMemberId(id)
    const m = unlinked.find(u => u.id === id)
    if (m) {
      // Auto-build email from name: "Juan Dela Cruz" → "juan.delacruz@rcccoop.com"
      const slug = m.full_name.toLowerCase().replace(/\s+/g, '.')
      setEmail(`${slug}@rcccoop.com`)
    } else {
      setEmail('')
    }
  }

  async function handleSubmit(e) {
    e.preventDefault()
    setError('')
    setSaving(true)

    const { data, error: fnErr } = await supabase.functions.invoke('create-user', {
      body: { email, password, role, member_id: memberId || null },
    })

    setSaving(false)

    if (fnErr || data?.error) {
      setError(fnErr?.message ?? data?.error ?? 'Unknown error')
      return
    }

    onCreated({ email, password })
  }

  return (
    <div className="fixed inset-0 bg-black/50 z-50 flex items-center justify-center p-4">
      <div className="bg-white rounded-xl shadow-xl w-full max-w-md">
        <div className="px-6 py-4 border-b border-gray-100 flex items-center justify-between">
          <h2 className="font-semibold text-gray-800">Create New Account</h2>
          <button onClick={onClose} className="text-gray-400 hover:text-gray-600 text-xl leading-none">✕</button>
        </div>

        <form onSubmit={handleSubmit} className="px-6 py-5 space-y-4">
          {/* Member */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Link to Member <span className="text-gray-400 font-normal">(optional)</span>
            </label>
            <select
              value={memberId}
              onChange={e => handleMemberChange(e.target.value)}
              className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
              <option value="">No member link (staff account)</option>
              {unlinked.map(m => (
                <option key={m.id} value={m.id}>{m.full_name}</option>
              ))}
            </select>
          </div>

          {/* Email */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Login Email</label>
            <input
              type="email"
              value={email}
              onChange={e => setEmail(e.target.value)}
              required
              placeholder="e.g. juan.delacruz@rcccoop.com"
              className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
          </div>

          {/* Role */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Role</label>
            <select
              value={role}
              onChange={e => setRole(e.target.value)}
              className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
              {ROLES.map(r => <option key={r} value={r}>{r}</option>)}
            </select>
          </div>

          {/* Temp password preview */}
          <div className="bg-gray-50 rounded-lg px-4 py-3">
            <p className="text-xs text-gray-500 mb-1">Temporary password (share with user)</p>
            <p className="font-mono text-sm font-semibold text-gray-800 tracking-wider">{password}</p>
            <p className="text-xs text-gray-400 mt-1">The user will be required to set a new password on first login.</p>
          </div>

          {error && (
            <p className="text-sm text-red-600 bg-red-50 border border-red-200 rounded px-3 py-2">{error}</p>
          )}

          <div className="flex gap-3 pt-1">
            <button
              type="button"
              onClick={onClose}
              className="flex-1 border border-gray-300 text-gray-600 text-sm font-medium py-2 rounded-lg hover:bg-gray-50"
            >
              Cancel
            </button>
            <button
              type="submit"
              disabled={saving || !email}
              className="flex-1 bg-blue-600 hover:bg-blue-700 disabled:opacity-50 text-white text-sm font-medium py-2 rounded-lg"
            >
              {saving ? 'Creating...' : 'Create Account'}
            </button>
          </div>
        </form>
      </div>
    </div>
  )
}

// ── Success banner shown after account creation ───────────────────────────────
function CreatedBanner({ email, password, onDismiss }) {
  const [copied, setCopied] = useState(false)
  const text = `Email: ${email}\nTemp Password: ${password}`

  function copy() {
    navigator.clipboard.writeText(text)
    setCopied(true)
    setTimeout(() => setCopied(false), 2000)
  }

  return (
    <div className="bg-green-50 border border-green-200 rounded-xl px-4 py-3 mb-5 flex items-start gap-3">
      <div className="flex-1 text-sm text-green-800">
        <p className="font-semibold mb-1">Account created successfully</p>
        <p className="font-mono text-xs">Email: {email}</p>
        <p className="font-mono text-xs">Temp Password: <span className="font-bold tracking-wider">{password}</span></p>
        <p className="text-xs text-green-600 mt-1">Share these credentials with the user. They will be prompted to set a new password on first login.</p>
      </div>
      <div className="flex flex-col gap-1.5 shrink-0">
        <button onClick={copy} className="text-xs bg-green-700 text-white px-2.5 py-1 rounded hover:bg-green-800">
          {copied ? 'Copied!' : 'Copy'}
        </button>
        <button onClick={onDismiss} className="text-xs text-green-600 hover:underline">Dismiss</button>
      </div>
    </div>
  )
}

// ── Main page ─────────────────────────────────────────────────────────────────
export default function UserAccountsPage() {
  const [profiles,   setProfiles]   = useState([])
  const [loading,    setLoading]    = useState(true)
  const [search,     setSearch]     = useState('')
  const [savingId,   setSavingId]   = useState(null)
  const [showModal,  setShowModal]  = useState(false)
  const [lastCreated, setLastCreated] = useState(null) // { email, password }

  useEffect(() => { fetchAll() }, [])

  async function fetchAll() {
    setLoading(true)
    const { data } = await supabase
      .from('profiles')
      .select('*, members(full_name, employee_id, status)')
      .order('created_at', { ascending: false })
    setProfiles(data ?? [])
    setLoading(false)
  }

  async function updateRole(profileId, newRole) {
    setSavingId(profileId)
    await supabase.from('profiles').update({ role: newRole }).eq('id', profileId)
    setSavingId(null)
    fetchAll()
  }

  async function resetFirstLogin(profileId) {
    if (!confirm('Mark this account as first_login=true? The user will be forced to set a new password on next login.')) return
    setSavingId(profileId)
    await supabase.from('profiles').update({ first_login: true }).eq('id', profileId)
    setSavingId(null)
    fetchAll()
  }

  function handleCreated(creds) {
    setShowModal(false)
    setLastCreated(creds)
    fetchAll()
  }

  const linkedIds = new Set(profiles.map(p => p.member_id).filter(Boolean))

  const filtered = profiles.filter(p => {
    const name = (p.members?.full_name ?? p.display_name ?? '').toLowerCase()
    return !search || name.includes(search.toLowerCase())
  })

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-xl font-bold text-gray-800">User Accounts</h1>
          <p className="text-sm text-gray-500">{profiles.length} account{profiles.length !== 1 ? 's' : ''} · manage roles and access</p>
        </div>
        <button
          onClick={() => setShowModal(true)}
          className="bg-blue-600 hover:bg-blue-700 text-white text-sm font-medium px-4 py-2 rounded-lg"
        >
          + Create Account
        </button>
      </div>

      {/* Success banner after account creation */}
      {lastCreated && (
        <CreatedBanner
          email={lastCreated.email}
          password={lastCreated.password}
          onDismiss={() => setLastCreated(null)}
        />
      )}

      {/* Search */}
      <div className="mb-4">
        <input
          type="text"
          value={search}
          onChange={e => setSearch(e.target.value)}
          placeholder="Search by name..."
          className="border border-gray-300 rounded-lg px-3 py-2 text-sm max-w-xs focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>

      {/* Table */}
      <div className="bg-white rounded-xl shadow overflow-hidden overflow-x-auto">
        {loading ? (
          <p className="text-center text-sm text-gray-500 py-12">Loading...</p>
        ) : filtered.length === 0 ? (
          <p className="text-center text-sm text-gray-500 py-12">No accounts found.</p>
        ) : (
          <table className="w-full text-sm">
            <thead className="bg-gray-50 border-b border-gray-200">
              <tr>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Member / Display Name</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Employee ID</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Member Status</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Role</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Setup</th>
                <th className="px-4 py-3"></th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              {filtered.map(p => (
                <tr key={p.id} className="hover:bg-gray-50">
                  <td className="px-4 py-3">
                    <div className="font-medium text-gray-800">
                      {p.members?.full_name ?? p.display_name ?? '—'}
                    </div>
                    <div className="text-xs text-gray-400 font-mono">{p.id.slice(0, 8)}…</div>
                  </td>
                  <td className="px-4 py-3 text-gray-500">{p.members?.employee_id ?? '—'}</td>
                  <td className="px-4 py-3">
                    {p.members ? <Badge value={p.members.status} /> : <span className="text-gray-400 text-xs">no member link</span>}
                  </td>
                  <td className="px-4 py-3">
                    <select
                      value={p.role}
                      onChange={e => updateRole(p.id, e.target.value)}
                      disabled={savingId === p.id}
                      className="border border-gray-300 rounded px-2 py-1 text-xs focus:outline-none focus:ring-2 focus:ring-blue-500 disabled:opacity-50"
                    >
                      {ROLES.map(r => (
                        <option key={r} value={r}>{r}</option>
                      ))}
                    </select>
                  </td>
                  <td className="px-4 py-3">
                    {p.first_login ? (
                      <span className="text-xs text-amber-700 bg-amber-50 px-2 py-0.5 rounded-full font-medium">pending setup</span>
                    ) : (
                      <span className="text-xs text-gray-400">complete</span>
                    )}
                  </td>
                  <td className="px-4 py-3">
                    {!p.first_login && (
                      <button
                        onClick={() => resetFirstLogin(p.id)}
                        disabled={savingId === p.id}
                        className="text-xs text-amber-600 hover:underline disabled:opacity-50"
                      >
                        Force reset
                      </button>
                    )}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>

      {/* Create account modal */}
      {showModal && (
        <CreateAccountModal
          onClose={() => setShowModal(false)}
          onCreated={handleCreated}
          linkedIds={linkedIds}
        />
      )}
    </div>
  )
}
