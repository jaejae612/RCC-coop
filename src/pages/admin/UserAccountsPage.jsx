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

function memberDisplayName(m) {
  if (!m) return '—'
  const parts = [m.first_name, m.last_name, m.name_suffix].filter(Boolean)
  return parts.length ? parts.join(' ') : (m.full_name ?? '—')
}

// ── Create Account Modal ──────────────────────────────────────────────────────
function CreateAccountModal({ onClose, onCreated, linkedIds, allMembers, preselect }) {
  const unlinked = allMembers.filter(m => !linkedIds.has(m.id))

  const [memberId, setMemberId] = useState(preselect?.id ?? '')
  const [email,    setEmail]    = useState(() => {
    if (preselect) {
      const slug = preselect.full_name.toLowerCase().replace(/\s+/g, '.')
      return `${slug}@rcccoop.com`
    }
    return ''
  })
  const [role,    setRole]    = useState('member')
  const [password]            = useState(() => genTempPassword())
  const [saving,  setSaving]  = useState(false)
  const [error,   setError]   = useState('')

  function handleMemberChange(id) {
    setMemberId(id)
    const m = unlinked.find(u => u.id === id)
    if (m) {
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

    if (data?.error || fnErr) {
      setError(data?.error ?? fnErr?.message ?? 'Unknown error')
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
                <option key={m.id} value={m.id}>{memberDisplayName(m)}</option>
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
            <p className="text-xs text-gray-400 mt-1">User will set a new password on first login.</p>
          </div>

          {error && (
            <p className="text-sm text-red-600 bg-red-50 border border-red-200 rounded px-3 py-2">{error}</p>
          )}

          <div className="flex gap-3 pt-1">
            <button type="button" onClick={onClose}
              className="flex-1 border border-gray-300 text-gray-600 text-sm font-medium py-2 rounded-lg hover:bg-gray-50">
              Cancel
            </button>
            <button type="submit" disabled={saving || !email}
              className="flex-1 bg-blue-600 hover:bg-blue-700 disabled:opacity-50 text-white text-sm font-medium py-2 rounded-lg">
              {saving ? 'Creating...' : 'Create Account'}
            </button>
          </div>
        </form>
      </div>
    </div>
  )
}

// ── Success banner ────────────────────────────────────────────────────────────
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
        <p className="text-xs text-green-600 mt-1">Share these credentials with the user.</p>
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
  const [profiles,    setProfiles]    = useState([])
  const [allMembers,  setAllMembers]  = useState([])
  const [loading,     setLoading]     = useState(true)
  const [search,      setSearch]      = useState('')
  const [savingId,    setSavingId]    = useState(null)
  const [showModal,   setShowModal]   = useState(false)
  const [preselect,   setPreselect]   = useState(null) // member to pre-fill in modal
  const [lastCreated, setLastCreated] = useState(null)
  const [tab,         setTab]         = useState('accounts') // 'accounts' | 'no-account'

  useEffect(() => { fetchAll() }, [])

  async function fetchAll() {
    setLoading(true)
    try {
      const [{ data: profs }, { data: mems }] = await Promise.all([
        supabase
          .from('profiles')
          .select('*, members(full_name, first_name, last_name, name_suffix, employee_id, status)')
          .order('created_at', { ascending: false }),
        supabase
          .from('members')
          .select('id, full_name, first_name, last_name, name_suffix, employee_id, status')
          .order('last_name, first_name'),
      ])
      setProfiles(profs ?? [])
      setAllMembers(mems ?? [])
    } finally {
      setLoading(false)
    }
  }

  async function updateRole(profileId, newRole) {
    setSavingId(profileId)
    await supabase.from('profiles').update({ role: newRole }).eq('id', profileId)
    setSavingId(null)
    fetchAll()
  }

  async function resetFirstLogin(profileId) {
    if (!confirm('Force this user to reset their password on next login?')) return
    setSavingId(profileId)
    await supabase.from('profiles').update({ first_login: true }).eq('id', profileId)
    setSavingId(null)
    fetchAll()
  }

  function openCreate(member = null) {
    setPreselect(member)
    setShowModal(true)
  }

  function handleCreated(creds) {
    setShowModal(false)
    setPreselect(null)
    setLastCreated(creds)
    fetchAll()
  }

  const linkedIds = new Set(profiles.map(p => p.member_id).filter(Boolean))

  // Members split into with-account and without-account
  const membersWithAccount    = allMembers.filter(m => linkedIds.has(m.id))
  const membersWithoutAccount = allMembers.filter(m => !linkedIds.has(m.id))

  const filteredProfiles = profiles.filter(p => {
    const name = memberDisplayName(p.members) === '—'
      ? (p.display_name ?? '').toLowerCase()
      : memberDisplayName(p.members).toLowerCase()
    return !search || name.includes(search.toLowerCase())
  })

  const filteredNoAccount = membersWithoutAccount.filter(m =>
    !search || memberDisplayName(m).toLowerCase().includes(search.toLowerCase())
  )

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-xl font-bold text-gray-800">User Accounts</h1>
          <p className="text-sm text-gray-500">
            {profiles.length} account{profiles.length !== 1 ? 's' : ''} ·{' '}
            <span className={membersWithoutAccount.length > 0 ? 'text-amber-600 font-medium' : 'text-gray-500'}>
              {membersWithoutAccount.length} member{membersWithoutAccount.length !== 1 ? 's' : ''} without account
            </span>
          </p>
        </div>
        <button
          onClick={() => openCreate()}
          className="bg-blue-600 hover:bg-blue-700 text-white text-sm font-medium px-4 py-2 rounded-lg"
        >
          + Create Account
        </button>
      </div>

      {lastCreated && (
        <CreatedBanner
          email={lastCreated.email}
          password={lastCreated.password}
          onDismiss={() => setLastCreated(null)}
        />
      )}

      {/* Tabs */}
      <div className="flex gap-2 mb-4">
        <button
          onClick={() => setTab('accounts')}
          className={`px-4 py-2 text-sm font-medium rounded-lg transition-colors ${
            tab === 'accounts' ? 'bg-blue-600 text-white' : 'text-gray-600 hover:bg-gray-100'
          }`}
        >
          Accounts ({profiles.length})
        </button>
        <button
          onClick={() => setTab('no-account')}
          className={`px-4 py-2 text-sm font-medium rounded-lg transition-colors ${
            tab === 'no-account'
              ? 'bg-amber-500 text-white'
              : membersWithoutAccount.length > 0
                ? 'text-amber-700 bg-amber-50 hover:bg-amber-100'
                : 'text-gray-600 hover:bg-gray-100'
          }`}
        >
          No Account ({membersWithoutAccount.length})
        </button>
      </div>

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

      {loading ? (
        <p className="text-center text-sm text-gray-500 py-12">Loading...</p>
      ) : tab === 'accounts' ? (

        /* ── Accounts tab ─────────────────────────────────────────── */
        <div className="bg-white rounded-xl shadow overflow-hidden overflow-x-auto">
          {filteredProfiles.length === 0 ? (
            <p className="text-center text-sm text-gray-500 py-12">No accounts found.</p>
          ) : (
            <table className="w-full text-sm">
              <thead className="bg-gray-50 border-b border-gray-200">
                <tr>
                  <th className="text-left px-4 py-3 font-medium text-gray-600">First Name</th>
                  <th className="text-left px-4 py-3 font-medium text-gray-600">Last Name</th>
                  <th className="text-left px-4 py-3 font-medium text-gray-600">Employee ID</th>
                  <th className="text-left px-4 py-3 font-medium text-gray-600">Member Status</th>
                  <th className="text-left px-4 py-3 font-medium text-gray-600">Role</th>
                  <th className="text-left px-4 py-3 font-medium text-gray-600">Setup</th>
                  <th className="px-4 py-3"></th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {filteredProfiles.map(p => {
                  const mem = p.members
                  return (
                    <tr key={p.id} className="hover:bg-gray-50">
                      <td className="px-4 py-3 font-medium text-gray-800">
                        {mem?.first_name ?? p.display_name ?? '—'}
                      </td>
                      <td className="px-4 py-3 font-medium text-gray-800">
                        {mem ? (mem.last_name ?? '—') + (mem.name_suffix ? ` ${mem.name_suffix}` : '') : '—'}
                      </td>
                      <td className="px-4 py-3 text-gray-500">{mem?.employee_id ?? '—'}</td>
                      <td className="px-4 py-3">
                        {mem
                          ? <Badge value={mem.status} />
                          : <span className="text-gray-400 text-xs">no member link</span>
                        }
                      </td>
                      <td className="px-4 py-3">
                        <select
                          value={p.role}
                          onChange={e => updateRole(p.id, e.target.value)}
                          disabled={savingId === p.id}
                          className="border border-gray-300 rounded px-2 py-1 text-xs focus:outline-none focus:ring-2 focus:ring-blue-500 disabled:opacity-50"
                        >
                          {ROLES.map(r => <option key={r} value={r}>{r}</option>)}
                        </select>
                      </td>
                      <td className="px-4 py-3">
                        {p.first_login
                          ? <span className="text-xs text-amber-700 bg-amber-50 px-2 py-0.5 rounded-full font-medium">pending setup</span>
                          : <span className="text-xs text-gray-400">complete</span>
                        }
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
                  )
                })}
              </tbody>
            </table>
          )}
        </div>

      ) : (

        /* ── No-account tab ───────────────────────────────────────── */
        <div className="bg-white rounded-xl shadow overflow-hidden overflow-x-auto">
          {filteredNoAccount.length === 0 ? (
            <p className="text-center text-sm text-gray-500 py-12">
              {membersWithoutAccount.length === 0 ? 'All members have accounts.' : 'No members match your search.'}
            </p>
          ) : (
            <table className="w-full text-sm">
              <thead className="bg-gray-50 border-b border-gray-200">
                <tr>
                  <th className="text-left px-4 py-3 font-medium text-gray-600">First Name</th>
                  <th className="text-left px-4 py-3 font-medium text-gray-600">Last Name</th>
                  <th className="text-left px-4 py-3 font-medium text-gray-600">Employee ID</th>
                  <th className="text-left px-4 py-3 font-medium text-gray-600">Status</th>
                  <th className="px-4 py-3"></th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {filteredNoAccount.map(m => (
                  <tr key={m.id} className="hover:bg-gray-50">
                    <td className="px-4 py-3 font-medium text-gray-800">{m.first_name ?? '—'}</td>
                    <td className="px-4 py-3 font-medium text-gray-800">
                      {(m.last_name ?? '—') + (m.name_suffix ? ` ${m.name_suffix}` : '')}
                    </td>
                    <td className="px-4 py-3 text-gray-500">{m.employee_id ?? '—'}</td>
                    <td className="px-4 py-3"><Badge value={m.status} /></td>
                    <td className="px-4 py-3 text-right">
                      <button
                        onClick={() => openCreate(m)}
                        className="text-xs bg-blue-600 hover:bg-blue-700 text-white px-3 py-1 rounded-lg"
                      >
                        Create Account
                      </button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          )}
        </div>
      )}

      {showModal && (
        <CreateAccountModal
          onClose={() => { setShowModal(false); setPreselect(null) }}
          onCreated={handleCreated}
          linkedIds={linkedIds}
          allMembers={allMembers}
          preselect={preselect}
        />
      )}
    </div>
  )
}
