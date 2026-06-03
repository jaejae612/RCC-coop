import { useEffect, useState } from 'react'
import { supabase } from '../../lib/supabase'
import { useAuth } from '../../context/AuthContext'
import Badge from '../../components/ui/Badge'
import LoanForm from './LoanForm'

const STATUSES = ['all', 'pending', 'approved', 'released', 'completed', 'rejected']

const peso = n => `₱${Number(n).toLocaleString('en-PH', { minimumFractionDigits: 2 })}`
const date = s => s ? new Date(s).toLocaleDateString('en-PH') : '—'

function StatusTab({ value, label, active, count, onClick }) {
  return (
    <button
      onClick={onClick}
      className={`px-4 py-2 text-sm font-medium rounded-lg whitespace-nowrap transition-colors ${
        active
          ? 'bg-blue-600 text-white'
          : 'text-gray-600 hover:bg-gray-100'
      }`}
    >
      {label} {count > 0 && <span className={`ml-1 text-xs ${active ? 'text-blue-200' : 'text-gray-400'}`}>({count})</span>}
    </button>
  )
}

export default function LoansPage() {
  const { profile } = useAuth()
  const [loans, setLoans] = useState([])
  const [loading, setLoading] = useState(true)
  const [statusFilter, setStatusFilter] = useState('all')
  const [search, setSearch] = useState('')
  const [showForm, setShowForm] = useState(false)
  const [editing, setEditing] = useState(null)
  const [actionLoading, setActionLoading] = useState(null)

  const role = profile?.role

  useEffect(() => { fetchLoans() }, [])

  async function fetchLoans() {
    setLoading(true)
    const { data } = await supabase
      .from('loans')
      .select('*, members(full_name, membership_tier)')
      .order('created_at', { ascending: false })
    setLoans(data ?? [])
    setLoading(false)
  }

  const counts = STATUSES.reduce((acc, s) => {
    acc[s] = s === 'all' ? loans.length : loans.filter(l => l.status === s).length
    return acc
  }, {})

  const filtered = loans.filter(l => {
    const matchStatus = statusFilter === 'all' || l.status === statusFilter
    const name = l.members?.full_name?.toLowerCase() ?? ''
    const matchSearch = !search || name.includes(search.toLowerCase())
    return matchStatus && matchSearch
  })

  async function updateStatus(loan, newStatus, extra = {}) {
    setActionLoading(loan.id + newStatus)
    const update = { status: newStatus, ...extra }
    if (newStatus === 'approved') update.date_approved = new Date().toISOString().slice(0, 10)
    if (newStatus === 'released') update.date_released = new Date().toISOString().slice(0, 10)
    await supabase.from('loans').update(update).eq('id', loan.id)
    setActionLoading(null)
    fetchLoans()
  }

  async function deleteLoan(id) {
    if (!confirm('Delete this loan application?')) return
    await supabase.from('loans').delete().eq('id', id)
    fetchLoans()
  }

  function openAdd() { setEditing(null); setShowForm(true) }
  function openEdit(l) { setEditing(l); setShowForm(true) }

  const canApprove = role === 'admin' || role === 'officer'
  const canRelease = role === 'admin'
  const canCreate = role === 'admin'

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-xl font-bold text-gray-800">Loans</h1>
          <p className="text-sm text-gray-500">{loans.length} total loan{loans.length !== 1 ? 's' : ''}</p>
        </div>
        {canCreate && (
          <button
            onClick={openAdd}
            className="bg-blue-600 hover:bg-blue-700 text-white text-sm font-medium px-4 py-2 rounded-lg"
          >
            + New Loan
          </button>
        )}
      </div>

      {/* Status tabs + search */}
      <div className="flex flex-col gap-3 mb-4">
        <div className="flex gap-2 flex-wrap">
          {STATUSES.map(s => (
            <StatusTab
              key={s}
              value={s}
              label={s === 'all' ? 'All' : s.charAt(0).toUpperCase() + s.slice(1)}
              active={statusFilter === s}
              count={s !== 'all' ? counts[s] : 0}
              onClick={() => setStatusFilter(s)}
            />
          ))}
        </div>
        <input
          type="text"
          value={search}
          onChange={e => setSearch(e.target.value)}
          placeholder="Search member name..."
          className="border border-gray-300 rounded-lg px-3 py-2 text-sm max-w-xs focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>

      {/* Table */}
      <div className="bg-white rounded-xl shadow overflow-hidden">
        {loading ? (
          <p className="text-center text-sm text-gray-500 py-12">Loading...</p>
        ) : filtered.length === 0 ? (
          <p className="text-center text-sm text-gray-500 py-12">No loans found.</p>
        ) : (
          <table className="w-full text-sm">
            <thead className="bg-gray-50 border-b border-gray-200">
              <tr>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Member</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">#</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Type</th>
                <th className="text-right px-4 py-3 font-medium text-gray-600">Principal</th>
                <th className="text-right px-4 py-3 font-medium text-gray-600">Monthly</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Term</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Status</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Applied</th>
                <th className="px-4 py-3"></th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              {filtered.map(l => {
                const isLoading = (id, action) => actionLoading === id + action
                return (
                  <tr key={l.id} className="hover:bg-gray-50">
                    <td className="px-4 py-3">
                      <div className="font-medium text-gray-800">{l.members?.full_name ?? '—'}</div>
                      {l.guarantor_name && (
                        <div className="text-xs text-gray-400">c/o {l.guarantor_name}</div>
                      )}
                    </td>
                    <td className="px-4 py-3 text-gray-500">#{l.loan_number}</td>
                    <td className="px-4 py-3 text-gray-700 capitalize">{l.loan_type}</td>
                    <td className="px-4 py-3 text-right font-medium text-gray-800">{peso(l.principal_amount)}</td>
                    <td className="px-4 py-3 text-right text-gray-600">
                      {l.monthly_payment ? peso(l.monthly_payment) : '—'}
                    </td>
                    <td className="px-4 py-3 text-gray-500">
                      {l.term_months ? `${l.term_months}mo` : '—'}
                    </td>
                    <td className="px-4 py-3">
                      <Badge value={l.status} />
                    </td>
                    <td className="px-4 py-3 text-gray-500">{date(l.date_applied)}</td>
                    <td className="px-4 py-3">
                      <div className="flex gap-1.5 justify-end flex-wrap">
                        {l.status === 'pending' && canApprove && (
                          <>
                            <button
                              disabled={!!actionLoading}
                              onClick={() => updateStatus(l, 'approved')}
                              className="text-xs bg-green-100 text-green-700 hover:bg-green-200 px-2 py-1 rounded disabled:opacity-50"
                            >
                              {isLoading(l.id, 'approved') ? '...' : 'Approve'}
                            </button>
                            <button
                              disabled={!!actionLoading}
                              onClick={() => updateStatus(l, 'rejected')}
                              className="text-xs bg-red-100 text-red-700 hover:bg-red-200 px-2 py-1 rounded disabled:opacity-50"
                            >
                              {isLoading(l.id, 'rejected') ? '...' : 'Reject'}
                            </button>
                          </>
                        )}
                        {l.status === 'approved' && canRelease && (
                          <button
                            disabled={!!actionLoading}
                            onClick={() => updateStatus(l, 'released')}
                            className="text-xs bg-blue-100 text-blue-700 hover:bg-blue-200 px-2 py-1 rounded disabled:opacity-50"
                          >
                            {isLoading(l.id, 'released') ? '...' : 'Release'}
                          </button>
                        )}
                        {canCreate && (
                          <button
                            onClick={() => openEdit(l)}
                            className="text-xs text-blue-600 hover:underline"
                          >
                            Edit
                          </button>
                        )}
                        {l.status === 'pending' && canCreate && (
                          <button
                            onClick={() => deleteLoan(l.id)}
                            className="text-xs text-red-500 hover:underline"
                          >
                            Delete
                          </button>
                        )}
                      </div>
                    </td>
                  </tr>
                )
              })}
            </tbody>
          </table>
        )}
      </div>

      {showForm && (
        <LoanForm
          loan={editing}
          onClose={() => setShowForm(false)}
          onSaved={() => { setShowForm(false); fetchLoans() }}
        />
      )}
    </div>
  )
}
