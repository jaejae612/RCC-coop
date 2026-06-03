import { useEffect, useState } from 'react'
import { supabase } from '../../lib/supabase'
import Badge from '../../components/ui/Badge'

const ROLES = ['member', 'officer', 'admin', 'owner']

const roleColors = {
  admin: 'bg-red-100 text-red-800',
  officer: 'bg-blue-100 text-blue-800',
  member: 'bg-gray-100 text-gray-700',
  owner: 'bg-purple-100 text-purple-800',
}

export default function UserAccountsPage() {
  const [profiles, setProfiles] = useState([])
  const [loading, setLoading] = useState(true)
  const [search, setSearch] = useState('')
  const [savingId, setSavingId] = useState(null)

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
    if (!confirm('Mark this account as first_login=true? The user will be forced to change their email and password on next login.')) return
    setSavingId(profileId)
    await supabase.from('profiles').update({ first_login: true }).eq('id', profileId)
    setSavingId(null)
    fetchAll()
  }

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
      </div>

      {/* Create account note */}
      <div className="bg-blue-50 border border-blue-200 rounded-xl px-4 py-3 mb-5 text-sm text-blue-700">
        <span className="font-medium">To create new accounts:</span> Go to the{' '}
        <span className="font-mono bg-blue-100 px-1 rounded">Supabase Dashboard → Authentication → Users → Add User</span>,
        then link the profile to a member here by updating the role.
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

      {/* Table */}
      <div className="bg-white rounded-xl shadow overflow-hidden">
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
                <th className="text-left px-4 py-3 font-medium text-gray-600">First Login</th>
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
    </div>
  )
}
