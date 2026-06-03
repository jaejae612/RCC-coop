import { useEffect, useState } from 'react'
import { supabase } from '../../lib/supabase'
import RepaymentForm from './RepaymentForm'

const peso = n => `₱${Number(n).toLocaleString('en-PH', { minimumFractionDigits: 2 })}`
const date = s => s ? new Date(s).toLocaleDateString('en-PH') : '—'

export default function RepaymentsPage() {
  const [payments, setPayments] = useState([])
  const [loading, setLoading] = useState(true)
  const [search, setSearch] = useState('')
  const [showForm, setShowForm] = useState(false)
  const [editing, setEditing] = useState(null)

  useEffect(() => { fetchAll() }, [])

  async function fetchAll() {
    setLoading(true)
    const { data } = await supabase
      .from('loan_payments')
      .select('*, loans(loan_number, loan_type, principal_amount, total_payable), members(full_name)')
      .order('payment_date', { ascending: false })
      .order('created_at', { ascending: false })
    setPayments(data ?? [])
    setLoading(false)
  }

  const filtered = payments.filter(p => {
    const name = p.members?.full_name?.toLowerCase() ?? ''
    return !search || name.includes(search.toLowerCase())
  })

  const totalPaid = filtered.reduce((s, p) => s + Number(p.amount_paid), 0)

  function openAdd() { setEditing(null); setShowForm(true) }
  function openEdit(p) { setEditing(p); setShowForm(true) }

  async function deletePayment(id) {
    if (!confirm('Delete this payment record? The loan status may need to be updated manually.')) return
    await supabase.from('loan_payments').delete().eq('id', id)
    fetchAll()
  }

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-xl font-bold text-gray-800">Repayments</h1>
          <p className="text-sm text-gray-500">
            {filtered.length} record{filtered.length !== 1 ? 's' : ''} · {peso(totalPaid)} total shown
          </p>
        </div>
        <button
          onClick={openAdd}
          className="bg-blue-600 hover:bg-blue-700 text-white text-sm font-medium px-4 py-2 rounded-lg"
        >
          + Record Payment
        </button>
      </div>

      {/* Search */}
      <div className="mb-4">
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
          <p className="text-center text-sm text-gray-500 py-12">No payments recorded yet.</p>
        ) : (
          <table className="w-full text-sm">
            <thead className="bg-gray-50 border-b border-gray-200">
              <tr>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Member</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Loan</th>
                <th className="text-right px-4 py-3 font-medium text-gray-600">Amount Paid</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Payment Date</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Notes</th>
                <th className="px-4 py-3"></th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              {filtered.map(p => (
                <tr key={p.id} className="hover:bg-gray-50">
                  <td className="px-4 py-3 font-medium text-gray-800">{p.members?.full_name ?? '—'}</td>
                  <td className="px-4 py-3 text-gray-600">
                    #{p.loans?.loan_number} {p.loans?.loan_type}
                    <span className="text-gray-400 ml-1 text-xs">{peso(p.loans?.principal_amount)}</span>
                  </td>
                  <td className="px-4 py-3 text-right font-semibold text-green-700">{peso(p.amount_paid)}</td>
                  <td className="px-4 py-3 text-gray-500">{date(p.payment_date)}</td>
                  <td className="px-4 py-3 text-gray-400 text-xs max-w-[160px] truncate">{p.notes ?? ''}</td>
                  <td className="px-4 py-3">
                    <div className="flex gap-2 justify-end">
                      <button onClick={() => openEdit(p)} className="text-blue-600 hover:underline text-xs">Edit</button>
                      <button onClick={() => deletePayment(p.id)} className="text-red-500 hover:underline text-xs">Delete</button>
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
            <tfoot className="bg-gray-50 border-t border-gray-200">
              <tr>
                <td colSpan={2} className="px-4 py-2 text-sm font-medium text-gray-600">Total</td>
                <td className="px-4 py-2 text-right text-sm font-bold text-green-700">{peso(totalPaid)}</td>
                <td colSpan={3}></td>
              </tr>
            </tfoot>
          </table>
        )}
      </div>

      {showForm && (
        <RepaymentForm
          repayment={editing}
          onClose={() => setShowForm(false)}
          onSaved={() => { setShowForm(false); fetchAll() }}
        />
      )}
    </div>
  )
}
