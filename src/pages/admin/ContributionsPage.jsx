import { useEffect, useState } from 'react'
import { supabase } from '../../lib/supabase'
import ContributionForm from './ContributionForm'

const peso = n => `₱${Number(n).toLocaleString('en-PH', { minimumFractionDigits: 2 })}`
const date = s => s ? new Date(s).toLocaleDateString('en-PH') : '—'

export default function ContributionsPage() {
  const [rows, setRows] = useState([])
  const [loading, setLoading] = useState(true)
  const [search, setSearch] = useState('')
  const [filterCutoff, setFilterCutoff] = useState('')
  const [showForm, setShowForm] = useState(false)
  const [editing, setEditing] = useState(null)

  useEffect(() => { fetchAll() }, [])

  async function fetchAll() {
    setLoading(true)
    const { data } = await supabase
      .from('contributions')
      .select('*, members(full_name, contribution_per_cutoff)')
      .order('cutoff_date', { ascending: false })
      .order('created_at', { ascending: false })
    setRows(data ?? [])
    setLoading(false)
  }

  const cutoffPeriods = [...new Set(rows.map(r => r.cutoff_period))].sort((a, b) => b.localeCompare(a))

  const filtered = rows.filter(r => {
    const name = r.members?.full_name?.toLowerCase() ?? ''
    const matchSearch = !search || name.includes(search.toLowerCase())
    const matchCutoff = !filterCutoff || r.cutoff_period === filterCutoff
    return matchSearch && matchCutoff
  })

  const totalAmount = filtered.reduce((s, r) => s + Number(r.amount), 0)

  function openAdd() { setEditing(null); setShowForm(true) }
  function openEdit(r) { setEditing(r); setShowForm(true) }

  async function deleteRow(id) {
    if (!confirm('Delete this contribution record?')) return
    await supabase.from('contributions').delete().eq('id', id)
    fetchAll()
  }

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-xl font-bold text-gray-800">Contributions</h1>
          <p className="text-sm text-gray-500">
            {filtered.length} record{filtered.length !== 1 ? 's' : ''} · {peso(totalAmount)} total shown
          </p>
        </div>
        <button
          onClick={openAdd}
          className="bg-blue-600 hover:bg-blue-700 text-white text-sm font-medium px-4 py-2 rounded-lg"
        >
          + Record Contribution
        </button>
      </div>

      {/* Filters */}
      <div className="flex gap-3 mb-4 flex-wrap">
        <input
          type="text"
          value={search}
          onChange={e => setSearch(e.target.value)}
          placeholder="Search member name..."
          className="border border-gray-300 rounded-lg px-3 py-2 text-sm flex-1 min-w-[180px] max-w-xs focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        <select
          value={filterCutoff}
          onChange={e => setFilterCutoff(e.target.value)}
          className="border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
        >
          <option value="">All Cutoffs</option>
          {cutoffPeriods.map(p => (
            <option key={p} value={p}>{p}</option>
          ))}
        </select>
      </div>

      {/* Table */}
      <div className="bg-white rounded-xl shadow overflow-hidden">
        {loading ? (
          <p className="text-center text-sm text-gray-500 py-12">Loading...</p>
        ) : filtered.length === 0 ? (
          <p className="text-center text-sm text-gray-500 py-12">No contributions found.</p>
        ) : (
          <table className="w-full text-sm">
            <thead className="bg-gray-50 border-b border-gray-200">
              <tr>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Member</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Cutoff Period</th>
                <th className="text-right px-4 py-3 font-medium text-gray-600">Amount</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Cutoff Date</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Payment Date</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Notes</th>
                <th className="px-4 py-3"></th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              {filtered.map(r => (
                <tr key={r.id} className="hover:bg-gray-50">
                  <td className="px-4 py-3 font-medium text-gray-800">{r.members?.full_name ?? '—'}</td>
                  <td className="px-4 py-3 font-mono text-gray-700">{r.cutoff_period}</td>
                  <td className="px-4 py-3 text-right font-medium text-gray-800">{peso(r.amount)}</td>
                  <td className="px-4 py-3 text-gray-500">{date(r.cutoff_date)}</td>
                  <td className="px-4 py-3 text-gray-500">{date(r.payment_date)}</td>
                  <td className="px-4 py-3 text-gray-400 text-xs max-w-[160px] truncate">{r.notes ?? ''}</td>
                  <td className="px-4 py-3">
                    <div className="flex gap-2 justify-end">
                      <button onClick={() => openEdit(r)} className="text-blue-600 hover:underline text-xs">Edit</button>
                      <button onClick={() => deleteRow(r.id)} className="text-red-500 hover:underline text-xs">Delete</button>
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
            <tfoot className="bg-gray-50 border-t border-gray-200">
              <tr>
                <td colSpan={2} className="px-4 py-2 text-sm font-medium text-gray-600">Total</td>
                <td className="px-4 py-2 text-right text-sm font-bold text-gray-800">{peso(totalAmount)}</td>
                <td colSpan={4}></td>
              </tr>
            </tfoot>
          </table>
        )}
      </div>

      {showForm && (
        <ContributionForm
          contribution={editing}
          onClose={() => setShowForm(false)}
          onSaved={() => { setShowForm(false); fetchAll() }}
        />
      )}
    </div>
  )
}
