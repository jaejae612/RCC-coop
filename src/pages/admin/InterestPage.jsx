import { useEffect, useState } from 'react'
import { supabase } from '../../lib/supabase'
import { useAuth } from '../../context/AuthContext'

const peso = n => `₱${Number(n).toLocaleString('en-PH', { minimumFractionDigits: 2 })}`

// YYYY-MM options for the past 12 months + next month
function getMonthOptions() {
  const options = []
  const now = new Date()
  for (let i = -1; i < 12; i++) {
    const d = new Date(now.getFullYear(), now.getMonth() - i, 1)
    const y = d.getFullYear()
    const m = String(d.getMonth() + 1).padStart(2, '0')
    options.push(`${y}-${m}`)
  }
  return options
}

function currentMonth() {
  const now = new Date()
  return `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}`
}

export default function InterestPage() {
  const { session, profile } = useAuth()
  const [charges, setCharges] = useState([])
  const [loading, setLoading] = useState(true)
  const [selectedMonth, setSelectedMonth] = useState(currentMonth())
  const [running, setRunning] = useState(false)
  const [runResult, setRunResult] = useState(null)
  const [filterMonth, setFilterMonth] = useState('')

  useEffect(() => { fetchAll() }, [])

  async function fetchAll() {
    setLoading(true)
    const { data } = await supabase
      .from('loan_interest_charges')
      .select('*, loans(loan_number, loan_type, principal_amount, interest_rate), members(full_name)')
      .order('charge_month', { ascending: false })
      .order('created_at', { ascending: false })
    setCharges(data ?? [])
    setLoading(false)
  }

  const months = [...new Set(charges.map(c => c.charge_month))].sort((a, b) => b.localeCompare(a))

  const filtered = filterMonth
    ? charges.filter(c => c.charge_month === filterMonth)
    : charges

  const totalInterest = filtered.reduce((s, c) => s + Number(c.interest_amount), 0)

  async function runBatch() {
    setRunning(true)
    setRunResult(null)

    // 1. Get all released loans
    const { data: releasedLoans } = await supabase
      .from('loans')
      .select('id, member_id, principal_amount, interest_rate')
      .eq('status', 'released')

    if (!releasedLoans || releasedLoans.length === 0) {
      setRunResult({ inserted: 0, skipped: 0, message: 'No released loans found.' })
      setRunning(false)
      return
    }

    // 2. Get existing charges for this month
    const { data: existing } = await supabase
      .from('loan_interest_charges')
      .select('loan_id')
      .eq('charge_month', selectedMonth)
    const alreadyCharged = new Set((existing ?? []).map(c => c.loan_id))

    // 3. For each loan not yet charged this month, calculate beginning balance
    const toInsert = []
    for (const loan of releasedLoans) {
      if (alreadyCharged.has(loan.id)) continue

      // Beginning balance = principal - sum of payments before this month
      const monthStart = `${selectedMonth}-01`
      const { data: payments } = await supabase
        .from('loan_payments')
        .select('amount_paid')
        .eq('loan_id', loan.id)
        .lt('payment_date', monthStart)

      const totalPaid = (payments ?? []).reduce((s, p) => s + Number(p.amount_paid), 0)
      const beginningBalance = Math.max(0, Number(loan.principal_amount) - totalPaid)
      if (beginningBalance === 0) continue

      const interestAmount = Math.round(beginningBalance * (Number(loan.interest_rate) / 100) * 100) / 100

      toInsert.push({
        loan_id: loan.id,
        member_id: loan.member_id,
        charge_month: selectedMonth,
        beginning_balance: beginningBalance,
        interest_amount: interestAmount,
      })
    }

    let inserted = 0
    if (toInsert.length > 0) {
      const { error } = await supabase.from('loan_interest_charges').insert(toInsert)
      if (!error) {
        inserted = toInsert.length
        // Audit log
        await supabase.from('audit_log').insert({
          action:            'interest_batch_run',
          table_name:        'loan_interest_charges',
          performed_by:      profile?.id,
          performed_by_role: profile?.role,
          new_value:         { charge_month: selectedMonth, charges_created: inserted },
          notes:             `Interest batch for ${selectedMonth} — ${inserted} charge${inserted !== 1 ? 's' : ''} created`,
        }).catch(() => {})
      }
    }

    const skipped = releasedLoans.length - alreadyCharged.size - toInsert.length
    setRunResult({
      inserted,
      skipped: alreadyCharged.size,
      zeroed: skipped,
      message: `Done. ${inserted} charge${inserted !== 1 ? 's' : ''} created, ${alreadyCharged.size} already existed, ${skipped} fully paid.`,
    })
    setRunning(false)
    fetchAll()
  }

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-xl font-bold text-gray-800">Monthly Interest</h1>
          <p className="text-sm text-gray-500">Interest = Beginning Balance × Loan Rate% — charged monthly per released loan</p>
        </div>
      </div>

      {/* Batch run panel */}
      <div className="bg-white rounded-xl shadow p-5 mb-6">
        <h2 className="text-sm font-semibold text-gray-700 mb-3">Run Interest Batch</h2>
        <div className="flex items-end gap-4 flex-wrap">
          <div>
            <label className="block text-xs text-gray-500 mb-1">Charge Month</label>
            <select
              value={selectedMonth}
              onChange={e => setSelectedMonth(e.target.value)}
              className="border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
              {getMonthOptions().map(m => (
                <option key={m} value={m}>{m}</option>
              ))}
            </select>
          </div>
          <button
            onClick={runBatch}
            disabled={running}
            className="px-4 py-2 bg-amber-600 hover:bg-amber-700 disabled:opacity-50 text-white text-sm font-medium rounded-lg"
          >
            {running ? 'Running...' : `Run for ${selectedMonth}`}
          </button>
        </div>
        {runResult && (
          <p className={`mt-3 text-sm ${runResult.inserted > 0 ? 'text-green-700' : 'text-gray-600'}`}>
            {runResult.message}
          </p>
        )}
        <p className="mt-2 text-xs text-gray-400">
          Charges already created for the selected month will not be duplicated.
        </p>
      </div>

      {/* Filter */}
      <div className="mb-4">
        <select
          value={filterMonth}
          onChange={e => setFilterMonth(e.target.value)}
          className="border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
        >
          <option value="">All Months</option>
          {months.map(m => (
            <option key={m} value={m}>{m}</option>
          ))}
        </select>
      </div>

      {/* Table */}
      <div className="bg-white rounded-xl shadow overflow-hidden">
        {loading ? (
          <p className="text-center text-sm text-gray-500 py-12">Loading...</p>
        ) : filtered.length === 0 ? (
          <p className="text-center text-sm text-gray-500 py-12">No interest charges recorded yet.</p>
        ) : (
          <table className="w-full text-sm">
            <thead className="bg-gray-50 border-b border-gray-200">
              <tr>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Member</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Loan</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Month</th>
                <th className="text-right px-4 py-3 font-medium text-gray-600">Beg. Balance</th>
                <th className="text-right px-4 py-3 font-medium text-gray-600">Rate</th>
                <th className="text-right px-4 py-3 font-medium text-gray-600">Interest Charged</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              {filtered.map(c => (
                <tr key={c.id} className="hover:bg-gray-50">
                  <td className="px-4 py-3 font-medium text-gray-800">{c.members?.full_name ?? '—'}</td>
                  <td className="px-4 py-3 text-gray-600">
                    #{c.loans?.loan_number} {c.loans?.loan_type}
                  </td>
                  <td className="px-4 py-3 font-mono text-gray-700">{c.charge_month}</td>
                  <td className="px-4 py-3 text-right text-gray-700">{peso(c.beginning_balance)}</td>
                  <td className="px-4 py-3 text-right text-gray-500">
                    {c.loans?.interest_rate != null ? `${c.loans.interest_rate}%` : '—'}
                  </td>
                  <td className="px-4 py-3 text-right font-semibold text-amber-700">{peso(c.interest_amount)}</td>
                </tr>
              ))}
            </tbody>
            <tfoot className="bg-gray-50 border-t border-gray-200">
              <tr>
                <td colSpan={5} className="px-4 py-2 text-sm font-medium text-gray-600">Total Interest</td>
                <td className="px-4 py-2 text-right text-sm font-bold text-amber-700">{peso(totalInterest)}</td>
              </tr>
            </tfoot>
          </table>
        )}
      </div>
    </div>
  )
}
