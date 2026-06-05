import { useEffect, useState } from 'react'
import { supabase } from '../../lib/supabase'
import { useAuth } from '../../context/AuthContext'
import Badge from '../../components/ui/Badge'
import LoanForm from './LoanForm'
import Pagination from '../../components/ui/Pagination'
import { computeCreditScore, gradeStyle } from '../../lib/creditScore'
import { notifyMember } from '../../lib/notify'

const PAGE_SIZE = 25

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

function CreditPill({ grade, score }) {
  if (!grade) return null
  const s = gradeStyle(grade)
  return (
    <span className={`inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-xs font-semibold ${s.bg} ${s.text}`}>
      <span className={`w-1.5 h-1.5 rounded-full ${s.dot}`} />
      {grade} {score}
    </span>
  )
}

export default function LoansPage() {
  const { profile } = useAuth()

  const [loans,         setLoans]         = useState([])
  const [scores,        setScores]        = useState({}) // member_id → credit result
  const [loading,       setLoading]       = useState(true)
  const [statusFilter,  setStatusFilter]  = useState('all')
  const [search,        setSearch]        = useState('')
  const [showForm,      setShowForm]      = useState(false)
  const [editing,       setEditing]       = useState(null)
  const [actionLoading, setActionLoading] = useState(null)
  const [page,          setPage]          = useState(1)

  const role = profile?.role

  useEffect(() => { fetchAll() }, [])

  async function fetchAll() {
    setLoading(true)

    const [
      { data: l },
      { data: members },
      { data: contribs },
      { data: payments },
    ] = await Promise.all([
      supabase.from('loans').select('*, members(full_name, membership_tier)').order('created_at', { ascending: false }),
      supabase.from('members').select('id, date_joined, membership_tier'),
      supabase.from('contributions').select('member_id, amount'),
      supabase.from('loan_payments').select('loan_id, amount_paid'),
    ])

    const loans = l ?? []

    // Group contributions by member
    const contribsByMember = {}
    for (const c of (contribs ?? [])) {
      if (!contribsByMember[c.member_id]) contribsByMember[c.member_id] = []
      contribsByMember[c.member_id].push(c)
    }

    // Group loans by member and payments by loan
    const loansByMember  = {}
    const paymentsByLoan = {}
    for (const loan of loans) {
      if (!loansByMember[loan.member_id]) loansByMember[loan.member_id] = []
      loansByMember[loan.member_id].push(loan)
    }
    for (const p of (payments ?? [])) {
      if (!paymentsByLoan[p.loan_id]) paymentsByLoan[p.loan_id] = []
      paymentsByLoan[p.loan_id].push(p)
    }

    // Compute credit score per member (only unique member IDs in loan list)
    const memberMap = Object.fromEntries((members ?? []).map(m => [m.id, m]))
    const computed  = {}
    const seen      = new Set()
    for (const loan of loans) {
      if (seen.has(loan.member_id)) continue
      seen.add(loan.member_id)
      const mem      = memberMap[loan.member_id]
      if (!mem) continue
      const mLoans    = loansByMember[loan.member_id]    ?? []
      const mContribs = contribsByMember[loan.member_id] ?? []
      const mPayments = mLoans.flatMap(ln => paymentsByLoan[ln.id] ?? [])
      computed[loan.member_id] = computeCreditScore(mem, mContribs, mLoans, mPayments)
    }

    setLoans(loans)
    setScores(computed)
    setLoading(false)
  }

  const counts = STATUSES.reduce((acc, s) => {
    acc[s] = s === 'all' ? loans.length : loans.filter(l => l.status === s).length
    return acc
  }, {})

  const filtered = loans.filter(l => {
    const matchStatus = statusFilter === 'all' || l.status === statusFilter
    const name        = l.members?.full_name?.toLowerCase() ?? ''
    const matchSearch = !search || name.includes(search.toLowerCase())
    return matchStatus && matchSearch
  })

  const paged = filtered.slice((page - 1) * PAGE_SIZE, page * PAGE_SIZE)

  async function updateStatus(loan, newStatus) {
    setActionLoading(loan.id + newStatus)
    const update = { status: newStatus }
    if (newStatus === 'approved') update.date_approved = new Date().toISOString().slice(0, 10)
    if (newStatus === 'released') update.date_released = new Date().toISOString().slice(0, 10)
    await supabase.from('loans').update(update).eq('id', loan.id)

    // Notify the member
    const memberName = loan.members?.full_name ?? 'Member'
    if (newStatus === 'approved') {
      await notifyMember(
        supabase,
        loan.member_id,
        'loan_approved',
        'Loan Application Approved',
        `Your loan application #${loan.loan_number} (₱${Number(loan.principal_amount).toLocaleString('en-PH', { minimumFractionDigits: 2 })}) has been approved.`
      )
    } else if (newStatus === 'released') {
      await notifyMember(
        supabase,
        loan.member_id,
        'loan_released',
        'Loan Released',
        `Your loan #${loan.loan_number} has been released. Please coordinate with the treasurer for the details.`
      )
    } else if (newStatus === 'rejected') {
      await notifyMember(
        supabase,
        loan.member_id,
        'loan_rejected',
        'Loan Application Not Approved',
        `Your loan application #${loan.loan_number} was not approved at this time. Please contact the office for more information.`
      )
    }

    setActionLoading(null)
    fetchAll()
  }

  async function deleteLoan(id) {
    if (!confirm('Delete this loan application?')) return
    await supabase.from('loans').delete().eq('id', id)
    fetchAll()
  }

  function openAdd()  { setEditing(null); setShowForm(true) }
  function openEdit(l){ setEditing(l);    setShowForm(true) }

  const canApprove = role === 'admin' || role === 'officer'
  const canRelease = role === 'admin'
  const canCreate  = role === 'admin'

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
              onClick={() => { setStatusFilter(s); setPage(1) }}
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
      <div className="bg-white rounded-xl shadow overflow-x-auto">
        {loading ? (
          <p className="text-center text-sm text-gray-500 py-12">Loading...</p>
        ) : filtered.length === 0 ? (
          <p className="text-center text-sm text-gray-500 py-12">No loans found.</p>
        ) : (
          <table className="w-full text-sm">
            <thead className="bg-gray-50 border-b border-gray-200">
              <tr>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Member</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Credit</th>
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
              {paged.map(l => {
                const cr        = scores[l.member_id]
                const isLoading = (id, action) => actionLoading === id + action
                return (
                  <tr key={l.id} className="hover:bg-gray-50">
                    <td className="px-4 py-3">
                      <div className="font-medium text-gray-800">{l.members?.full_name ?? '—'}</div>
                      {l.guarantor_name && (
                        <div className="text-xs text-gray-400">c/o {l.guarantor_name}</div>
                      )}
                    </td>
                    <td className="px-4 py-3">
                      {cr
                        ? <CreditPill grade={cr.grade} score={cr.score} />
                        : <span className="text-gray-300 text-xs">—</span>
                      }
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
                    <td className="px-4 py-3"><Badge value={l.status} /></td>
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

      <Pagination page={page} pageSize={PAGE_SIZE} total={filtered.length} onChange={p => { setPage(p); window.scrollTo(0,0) }} />

      {showForm && (
        <LoanForm
          loan={editing}
          onClose={() => setShowForm(false)}
          onSaved={() => { setShowForm(false); fetchAll() }}
        />
      )}
    </div>
  )
}
