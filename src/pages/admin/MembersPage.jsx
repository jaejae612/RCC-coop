import { useEffect, useState } from 'react'
import { supabase } from '../../lib/supabase'
import { useAuth } from '../../context/AuthContext'
import Badge from '../../components/ui/Badge'
import MemberForm from './MemberForm'
import { computeCreditScore, gradeStyle } from '../../lib/creditScore'

function CreditBadge({ grade, score }) {
  const s = gradeStyle(grade)
  return (
    <span className={`inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-xs font-semibold ${s.bg} ${s.text}`}>
      <span className={`w-1.5 h-1.5 rounded-full ${s.dot}`} />
      {grade} · {score}
    </span>
  )
}

export default function MembersPage() {
  const { profile } = useAuth()
  const canEdit = profile?.role === 'admin'

  const [members,     setMembers]     = useState([])
  const [scores,      setScores]      = useState({}) // member_id → { score, grade }
  const [loading,     setLoading]     = useState(true)
  const [search,      setSearch]      = useState('')
  const [filterStatus,setFilterStatus]= useState('all')
  const [filterGrade, setFilterGrade] = useState('all')
  const [showForm,    setShowForm]    = useState(false)
  const [editing,     setEditing]     = useState(null)

  useEffect(() => { fetchAll() }, [])

  async function fetchAll() {
    setLoading(true)

    const [
      { data: m },
      { data: c },
      { data: l },
      { data: p },
    ] = await Promise.all([
      supabase.from('members').select('*').order('full_name'),
      supabase.from('contributions').select('member_id, amount'),
      supabase.from('loans').select('member_id, id, total_payable, principal_amount, status'),
      supabase.from('loan_payments').select('loan_id, amount_paid'),
    ])

    const members = m ?? []

    // Group by member / loan
    const contribsByMember = {}
    const loansByMember    = {}
    const paymentsByLoan   = {}

    for (const c of (c ?? [])) {
      if (!contribsByMember[c.member_id]) contribsByMember[c.member_id] = []
      contribsByMember[c.member_id].push(c)
    }
    for (const loan of (l ?? [])) {
      if (!loansByMember[loan.member_id]) loansByMember[loan.member_id] = []
      loansByMember[loan.member_id].push(loan)
    }
    for (const pay of (p ?? [])) {
      if (!paymentsByLoan[pay.loan_id]) paymentsByLoan[pay.loan_id] = []
      paymentsByLoan[pay.loan_id].push(pay)
    }

    // Compute score per member
    const computed = {}
    for (const mem of members) {
      const mContribs  = contribsByMember[mem.id] ?? []
      const mLoans     = loansByMember[mem.id]    ?? []
      const mPayments  = mLoans.flatMap(loan => paymentsByLoan[loan.id] ?? [])
      computed[mem.id] = computeCreditScore(mem, mContribs, mLoans, mPayments)
    }

    setMembers(members)
    setScores(computed)
    setLoading(false)
  }

  function openAdd()  { setEditing(null); setShowForm(true) }
  function openEdit(m){ setEditing(m);    setShowForm(true) }

  async function deactivate(id) {
    if (!confirm('Set this member to Inactive?')) return
    await supabase.from('members').update({ status: 'inactive' }).eq('id', id)
    fetchAll()
  }

  const filtered = members.filter(m => {
    const matchSearch  = m.full_name.toLowerCase().includes(search.toLowerCase()) ||
      (m.employee_id ?? '').toLowerCase().includes(search.toLowerCase())
    const matchStatus  = filterStatus === 'all' || m.status === filterStatus
    const matchGrade   = filterGrade  === 'all' || (scores[m.id]?.grade ?? '') === filterGrade
    return matchSearch && matchStatus && matchGrade
  })

  const GRADES = ['AA', 'A', 'B', 'C', 'D']

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
      <div className="flex gap-3 mb-4 flex-wrap">
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
        <select
          value={filterGrade}
          onChange={e => setFilterGrade(e.target.value)}
          className="border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
        >
          <option value="all">All Grades</option>
          {GRADES.map(g => <option key={g} value={g}>Grade {g}</option>)}
        </select>
      </div>

      {/* Grade summary pills */}
      {!loading && Object.keys(scores).length > 0 && (
        <div className="flex gap-2 mb-4 flex-wrap">
          {GRADES.map(g => {
            const count = members.filter(m => scores[m.id]?.grade === g).length
            if (count === 0) return null
            const s = gradeStyle(g)
            return (
              <button
                key={g}
                onClick={() => setFilterGrade(filterGrade === g ? 'all' : g)}
                className={`px-3 py-1 rounded-full text-xs font-semibold border transition-all ${
                  filterGrade === g
                    ? `${s.bg} ${s.text} border-transparent`
                    : 'bg-white text-gray-500 border-gray-200 hover:border-gray-300'
                }`}
              >
                {g} · {count}
              </button>
            )
          })}
        </div>
      )}

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
                <th className="text-left px-4 py-3 font-medium text-gray-600">Status</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Joined</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Credit Rating</th>
                <th className="px-4 py-3"></th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              {filtered.map(m => {
                const cr = scores[m.id]
                return (
                  <tr key={m.id} className="hover:bg-gray-50">
                    <td className="px-4 py-3 font-medium text-gray-800">{m.full_name}</td>
                    <td className="px-4 py-3 text-gray-500">{m.employee_id ?? '—'}</td>
                    <td className="px-4 py-3"><Badge value={m.membership_tier} /></td>
                    <td className="px-4 py-3"><Badge value={m.status} /></td>
                    <td className="px-4 py-3 text-gray-500">
                      {m.date_joined ? new Date(m.date_joined + 'T00:00:00').toLocaleDateString('en-PH') : '—'}
                    </td>
                    <td className="px-4 py-3">
                      {cr
                        ? <CreditBadge grade={cr.grade} score={cr.score} />
                        : <span className="text-gray-300 text-xs">—</span>
                      }
                    </td>
                    <td className="px-4 py-3">
                      {canEdit && (
                        <div className="flex gap-2 justify-end">
                          <button onClick={() => openEdit(m)} className="text-blue-600 hover:underline text-xs">Edit</button>
                          {m.status === 'active' && (
                            <button onClick={() => deactivate(m.id)} className="text-red-500 hover:underline text-xs">Deactivate</button>
                          )}
                        </div>
                      )}
                    </td>
                  </tr>
                )
              })}
            </tbody>
          </table>
        )}
      </div>

      {showForm && canEdit && (
        <MemberForm
          member={editing}
          onClose={() => setShowForm(false)}
          onSaved={() => { setShowForm(false); fetchAll() }}
        />
      )}
    </div>
  )
}
