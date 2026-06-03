import { useEffect, useState } from 'react'
import { supabase } from '../../lib/supabase'
import { useAuth } from '../../context/AuthContext'
import Badge from '../../components/ui/Badge'
import MemberForm from './MemberForm'

export default function MembersPage() {
  const { profile } = useAuth()
  const canEdit = profile?.role === 'admin'
  const [members, setMembers] = useState([])
  const [loading, setLoading] = useState(true)
  const [search, setSearch] = useState('')
  const [filterStatus, setFilterStatus] = useState('all')
  const [showForm, setShowForm] = useState(false)
  const [editing, setEditing] = useState(null)

  useEffect(() => { fetchMembers() }, [])

  async function fetchMembers() {
    setLoading(true)
    const { data } = await supabase
      .from('members')
      .select('*')
      .order('full_name')
    setMembers(data ?? [])
    setLoading(false)
  }

  function openAdd() { setEditing(null); setShowForm(true) }
  function openEdit(m) { setEditing(m); setShowForm(true) }

  async function deactivate(id) {
    if (!confirm('Set this member to Inactive?')) return
    await supabase.from('members').update({ status: 'inactive' }).eq('id', id)
    fetchMembers()
  }

  const filtered = members.filter(m => {
    const matchSearch = m.full_name.toLowerCase().includes(search.toLowerCase()) ||
      (m.employee_id ?? '').toLowerCase().includes(search.toLowerCase())
    const matchStatus = filterStatus === 'all' || m.status === filterStatus
    return matchSearch && matchStatus
  })

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-xl font-bold text-gray-800">Members</h1>
          <p className="text-sm text-gray-500">{members.length} total enrolled</p>
        </div>
        {canEdit && (
          <button
            onClick={openAdd}
            className="bg-blue-600 hover:bg-blue-700 text-white text-sm font-medium px-4 py-2 rounded-lg"
          >
            + Add Member
          </button>
        )}
      </div>

      {/* Filters */}
      <div className="flex gap-3 mb-4">
        <input
          type="text"
          value={search}
          onChange={e => setSearch(e.target.value)}
          placeholder="Search name or employee ID..."
          className="border border-gray-300 rounded-lg px-3 py-2 text-sm flex-1 max-w-xs focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        <select
          value={filterStatus}
          onChange={e => setFilterStatus(e.target.value)}
          className="border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
        >
          <option value="all">All Status</option>
          <option value="active">Active</option>
          <option value="inactive">Inactive</option>
          <option value="on_leave">On Leave</option>
        </select>
      </div>

      {/* Table */}
      <div className="bg-white rounded-xl shadow overflow-hidden">
        {loading ? (
          <p className="text-center text-sm text-gray-500 py-12">Loading...</p>
        ) : filtered.length === 0 ? (
          <p className="text-center text-sm text-gray-500 py-12">No members found.</p>
        ) : (
          <table className="w-full text-sm">
            <thead className="bg-gray-50 border-b border-gray-200">
              <tr>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Name</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Employee ID</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Tier</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Employment</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Status</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Joined</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Contrib/Cutoff</th>
                <th className="px-4 py-3"></th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              {filtered.map(m => (
                <tr key={m.id} className="hover:bg-gray-50">
                  <td className="px-4 py-3 font-medium text-gray-800">{m.full_name}</td>
                  <td className="px-4 py-3 text-gray-500">{m.employee_id ?? '—'}</td>
                  <td className="px-4 py-3">
                    <Badge value={m.membership_tier} />
                  </td>
                  <td className="px-4 py-3">
                    <Badge value={m.employment_type} />
                  </td>
                  <td className="px-4 py-3">
                    <Badge value={m.status} />
                  </td>
                  <td className="px-4 py-3 text-gray-500">
                    {m.date_joined ? new Date(m.date_joined).toLocaleDateString('en-PH') : '—'}
                  </td>
                  <td className="px-4 py-3 text-gray-700">
                    ₱{Number(m.contribution_per_cutoff ?? 0).toLocaleString('en-PH', { minimumFractionDigits: 2 })}
                  </td>
                  <td className="px-4 py-3">
                    {canEdit && (
                      <div className="flex gap-2 justify-end">
                        <button
                          onClick={() => openEdit(m)}
                          className="text-blue-600 hover:underline text-xs"
                        >
                          Edit
                        </button>
                        {m.status === 'active' && (
                          <button
                            onClick={() => deactivate(m.id)}
                            className="text-red-500 hover:underline text-xs"
                          >
                            Deactivate
                          </button>
                        )}
                      </div>
                    )}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>

      {showForm && canEdit && (
        <MemberForm
          member={editing}
          onClose={() => setShowForm(false)}
          onSaved={() => { setShowForm(false); fetchMembers() }}
        />
      )}
    </div>
  )
}
