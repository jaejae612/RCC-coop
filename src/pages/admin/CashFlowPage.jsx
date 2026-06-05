import { useEffect, useState } from 'react'
import { supabase } from '../../lib/supabase'
import { useAuth } from '../../context/AuthContext'
import CashFlowForm from './CashFlowForm'
import Pagination from '../../components/ui/Pagination'

const PAGE_SIZE = 50

const peso  = n => `₱${Number(n).toLocaleString('en-PH', { minimumFractionDigits: 2 })}`
const fdate = s => s ? new Date(s + 'T00:00:00').toLocaleDateString('en-PH') : '—'

const TX_LABELS = {
  loan_release:   'Loan Release',
  loan_payment:   'Loan Payment',
  petty_cash:     'Petty Cash',
  store_purchase: 'Store Purchase',
  bank_interest:  'Bank Interest',
  bank_tax:       'Bank Tax',
  other:          'Other',
}

const TX_COLORS = {
  loan_release:   'bg-red-100 text-red-700',
  loan_payment:   'bg-green-100 text-green-700',
  petty_cash:     'bg-orange-100 text-orange-700',
  store_purchase: 'bg-purple-100 text-purple-700',
  bank_interest:  'bg-blue-100 text-blue-700',
  bank_tax:       'bg-gray-100 text-gray-600',
  other:          'bg-gray-100 text-gray-600',
}

export default function CashFlowPage() {
  const { profile } = useAuth()
  const isAdmin = profile?.role === 'admin'

  const [rows,       setRows]       = useState([])
  const [loading,    setLoading]    = useState(true)
  const [filterType, setFilterType] = useState('')
  const [filterFrom, setFilterFrom] = useState('')
  const [filterTo,   setFilterTo]   = useState('')
  const [showForm,   setShowForm]   = useState(false)
  const [editing,    setEditing]    = useState(null)
  const [page,       setPage]       = useState(1)

  useEffect(() => { fetchAll() }, [])

  async function fetchAll() {
    setLoading(true)
    const { data } = await supabase
      .from('cash_flow')
      .select('*')
      .order('transaction_date', { ascending: false })
      .order('created_at',       { ascending: false })
    setRows(data ?? [])
    setLoading(false)
  }

  const filtered = rows.filter(r => {
    if (filterType && r.transaction_type !== filterType) return false
    if (filterFrom && r.transaction_date < filterFrom)   return false
    if (filterTo   && r.transaction_date > filterTo)     return false
    return true
  })

  const totalDeposits     = filtered.reduce((s, r) => s + Number(r.deposit    ?? 0), 0)
  const totalWithdrawals  = filtered.reduce((s, r) => s + Number(r.withdrawal ?? 0), 0)
  const currentBalance    = rows.length > 0 ? Number(rows[0].balance_after) : 0

  const paged = filtered.slice((page - 1) * PAGE_SIZE, page * PAGE_SIZE)

  function openAdd()  { setEditing(null); setShowForm(true) }
  function openEdit(r){ setEditing(r);    setShowForm(true) }

  async function deleteRow(id) {
    if (!confirm('Delete this cash flow entry?')) return
    await supabase.from('cash_flow').delete().eq('id', id)
    fetchAll()
  }

  function clearFilters() { setFilterType(''); setFilterFrom(''); setFilterTo('') }
  const hasFilter = filterType || filterFrom || filterTo

  return (
    <div>
      {/* Header */}
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-xl font-bold text-gray-800">Cash Flow</h1>
          <p className="text-sm text-gray-500">Running ledger of all cash transactions</p>
        </div>
        {isAdmin && (
          <button
            onClick={openAdd}
            className="bg-blue-600 hover:bg-blue-700 text-white text-sm font-medium px-4 py-2 rounded-lg"
          >
            + Record Transaction
          </button>
        )}
      </div>

      {/* Summary cards */}
      <div className="grid grid-cols-3 gap-4 mb-6">
        <div className="bg-white rounded-xl shadow p-4">
          <p className="text-xs text-gray-500 mb-1">Current Balance</p>
          <p className="text-2xl font-bold text-blue-700">{peso(currentBalance)}</p>
          <p className="text-xs text-gray-400 mt-1">last recorded entry</p>
        </div>
        <div className="bg-white rounded-xl shadow p-4">
          <p className="text-xs text-gray-500 mb-1">
            Deposits {hasFilter ? '(filtered)' : '(all-time)'}
          </p>
          <p className="text-2xl font-bold text-green-700">{peso(totalDeposits)}</p>
        </div>
        <div className="bg-white rounded-xl shadow p-4">
          <p className="text-xs text-gray-500 mb-1">
            Withdrawals {hasFilter ? '(filtered)' : '(all-time)'}
          </p>
          <p className="text-2xl font-bold text-red-600">{peso(totalWithdrawals)}</p>
        </div>
      </div>

      {/* Filters */}
      <div className="flex gap-3 mb-4 flex-wrap items-center">
        <select
          value={filterType}
          onChange={e => setFilterType(e.target.value)}
          className="border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
        >
          <option value="">All Types</option>
          {Object.entries(TX_LABELS).map(([k, v]) => (
            <option key={k} value={k}>{v}</option>
          ))}
        </select>
        <input
          type="date"
          value={filterFrom}
          onChange={e => setFilterFrom(e.target.value)}
          className="border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        <span className="text-sm text-gray-400">to</span>
        <input
          type="date"
          value={filterTo}
          onChange={e => setFilterTo(e.target.value)}
          className="border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        {hasFilter && (
          <button onClick={clearFilters} className="text-sm text-gray-500 hover:text-gray-700 underline">
            Clear
          </button>
        )}
        <span className="text-xs text-gray-400 ml-auto">{filtered.length} entries</span>
      </div>

      {/* Table */}
      <div className="bg-white rounded-xl shadow overflow-x-auto">
        {loading ? (
          <p className="text-center text-sm text-gray-500 py-12">Loading...</p>
        ) : filtered.length === 0 ? (
          <p className="text-center text-sm text-gray-500 py-12">No transactions found.</p>
        ) : (
          <table className="w-full text-sm">
            <thead className="bg-gray-50 border-b border-gray-200">
              <tr>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Date</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Description</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Type</th>
                <th className="text-right px-4 py-3 font-medium text-gray-600">Withdrawal</th>
                <th className="text-right px-4 py-3 font-medium text-gray-600">Deposit</th>
                <th className="text-right px-4 py-3 font-medium text-gray-600">Balance</th>
                {isAdmin && <th className="px-4 py-3"></th>}
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              {paged.map(r => (
                <tr key={r.id} className="hover:bg-gray-50">
                  <td className="px-4 py-3 text-gray-600 whitespace-nowrap">
                    {fdate(r.transaction_date)}
                  </td>
                  <td className="px-4 py-3 text-gray-800 max-w-[200px]">
                    {r.description}
                  </td>
                  <td className="px-4 py-3">
                    <span className={`text-xs font-medium px-2 py-0.5 rounded-full ${TX_COLORS[r.transaction_type] ?? 'bg-gray-100 text-gray-600'}`}>
                      {TX_LABELS[r.transaction_type] ?? r.transaction_type}
                    </span>
                  </td>
                  <td className="px-4 py-3 text-right font-medium text-red-600">
                    {r.withdrawal ? peso(r.withdrawal) : <span className="text-gray-300">—</span>}
                  </td>
                  <td className="px-4 py-3 text-right font-medium text-green-700">
                    {r.deposit ? peso(r.deposit) : <span className="text-gray-300">—</span>}
                  </td>
                  <td className="px-4 py-3 text-right font-bold text-gray-800">
                    {peso(r.balance_after)}
                  </td>
                  {isAdmin && (
                    <td className="px-4 py-3">
                      <div className="flex gap-2 justify-end">
                        <button onClick={() => openEdit(r)} className="text-blue-600 hover:underline text-xs">Edit</button>
                        <button onClick={() => deleteRow(r.id)} className="text-red-500 hover:underline text-xs">Delete</button>
                      </div>
                    </td>
                  )}
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>

      <Pagination page={page} pageSize={PAGE_SIZE} total={filtered.length} onChange={p => { setPage(p); window.scrollTo(0,0) }} />

      {showForm && (
        <CashFlowForm
          entry={editing}
          lastBalance={rows.length > 0 ? Number(rows[0].balance_after) : 0}
          onClose={() => setShowForm(false)}
          onSaved={() => { setShowForm(false); fetchAll() }}
        />
      )}
    </div>
  )
}
