import { useEffect, useState } from 'react'
import { supabase } from '../../lib/supabase'
import { useAuth } from '../../context/AuthContext'
import DividendForm from './DividendForm'

const peso  = n => `₱${Number(n).toLocaleString('en-PH', { minimumFractionDigits: 2 })}`
const pct   = n => `${Number(n).toFixed(2)}%`
const fdate = s => s ? new Date(s + 'T00:00:00').toLocaleDateString('en-PH') : '—'

// Fiscal year options (Apr–Mar): current + past 5
function getFiscalYears() {
  const now = new Date()
  const y   = now.getMonth() >= 3 ? now.getFullYear() : now.getFullYear() - 1 // Apr = month 3
  return Array.from({ length: 6 }, (_, i) => `${y - i}-${y - i + 1}`)
}

export default function DividendsPage() {
  const { profile } = useAuth()
  const isAdmin = profile?.role === 'admin'

  const [records,     setRecords]     = useState([])
  const [loading,     setLoading]     = useState(true)
  const [filterYear,  setFilterYear]  = useState('')
  const [showForm,    setShowForm]    = useState(false)
  const [editing,     setEditing]     = useState(null)

  // Compute panel state
  const [computeOpen,    setComputeOpen]    = useState(false)
  const [compYear,       setCompYear]       = useState(getFiscalYears()[0])
  const [compRate,       setCompRate]       = useState('')
  const [compPatronage,  setCompPatronage]  = useState(10)
  const [preview,        setPreview]        = useState([])
  const [computing,      setComputing]      = useState(false)
  const [savingAll,      setSavingAll]      = useState(false)
  const [saveResult,     setSaveResult]     = useState(null)

  useEffect(() => { fetchAll() }, [])

  async function fetchAll() {
    setLoading(true)
    const { data } = await supabase
      .from('dividends')
      .select('*, members(full_name)')
      .order('fiscal_year', { ascending: false })
      .order('created_at',  { ascending: false })
    setRecords(data ?? [])
    setLoading(false)
  }

  const fiscalYears = [...new Set(records.map(r => r.fiscal_year))].sort((a, b) => b.localeCompare(a))
  const filtered    = filterYear ? records.filter(r => r.fiscal_year === filterYear) : records

  function openAdd()   { setEditing(null); setShowForm(true) }
  function openEdit(r) { setEditing(r);    setShowForm(true) }

  async function deleteRow(id) {
    if (!confirm('Delete this dividend record?')) return
    await supabase.from('dividends').delete().eq('id', id)
    fetchAll()
  }

  // ── Compute preview ──────────────────────────────────────
  async function runCompute() {
    if (!compRate) return
    setComputing(true)
    setSaveResult(null)

    // Get all active members
    const { data: members } = await supabase
      .from('members')
      .select('id, full_name, membership_tier')
      .eq('status', 'active')

    if (!members?.length) { setPreview([]); setComputing(false); return }

    // Get total contributions per member
    const { data: contribs } = await supabase
      .from('contributions')
      .select('member_id, amount')

    // Get total interest charges per member for the fiscal year
    // Fiscal year Apr–Mar: e.g. "2025-2026" → 2025-04 to 2026-03
    const [startY, endY] = compYear.split('-').map(Number)
    const monthStart = `${startY}-04`
    const monthEnd   = `${endY}-03`

    const { data: intCharges } = await supabase
      .from('loan_interest_charges')
      .select('member_id, interest_amount, charge_month')
      .gte('charge_month', monthStart)
      .lte('charge_month', monthEnd)

    // Get outstanding loan balances per member (released loans only)
    const [{ data: releasedLoans }, { data: loanPayments }] = await Promise.all([
      supabase.from('loans').select('id, member_id, principal_amount').eq('status', 'released'),
      supabase.from('loan_payments').select('loan_id, amount_paid'),
    ])

    // Aggregate
    const capitalByMember     = {}
    const interestByMember    = {}
    const paidByLoan          = {}
    const outstandingByMember = {}

    for (const c of (contribs ?? []))      capitalByMember[c.member_id]  = (capitalByMember[c.member_id]  ?? 0) + Number(c.amount)
    for (const i of (intCharges ?? []))    interestByMember[i.member_id] = (interestByMember[i.member_id] ?? 0) + Number(i.interest_amount)
    for (const p of (loanPayments ?? []))  paidByLoan[p.loan_id]         = (paidByLoan[p.loan_id]         ?? 0) + Number(p.amount_paid)
    for (const loan of (releasedLoans ?? [])) {
      const balance = Math.max(0, Number(loan.principal_amount) - (paidByLoan[loan.id] ?? 0))
      outstandingByMember[loan.member_id] = (outstandingByMember[loan.member_id] ?? 0) + balance
    }

    const rate     = Number(compRate)
    const patRate  = Number(compPatronage)

    const rows = members.map(m => {
      const capital    = capitalByMember[m.id]     ?? 0
      const intPaid    = interestByMember[m.id]    ?? 0
      const loanBal    = outstandingByMember[m.id] ?? 0
      const interest   = Math.round(capital  * (rate    / 100) * 100) / 100
      const patronage  = Math.round(intPaid   * (patRate / 100) * 100) / 100
      const total      = Math.round((interest + patronage) * 100) / 100
      const deduction  = Math.min(loanBal, total)  // never deduct more than total earnings
      const cash       = Math.max(0, Math.round((total - deduction) * 100) / 100)
      return {
        member_id:           m.id,
        full_name:           m.full_name,
        membership_tier:     m.membership_tier,
        capital_amount:      capital,
        interest_rate:       rate,
        interest_earned:     interest,
        total_interest_paid: intPaid,
        patronage_rate:      patRate,
        patronage_refund:    patronage,
        total_earnings:      total,
        loan_deduction:      deduction,
        cash_released:       cash,
        fiscal_year:         compYear,
      }
    }).sort((a, b) => a.full_name.localeCompare(b.full_name))

    setPreview(rows)
    setComputing(false)
  }

  async function saveAllDividends() {
    if (!preview.length) return
    setSavingAll(true)
    setSaveResult(null)

    const payload = preview.map(r => ({
      member_id:           r.member_id,
      fiscal_year:         r.fiscal_year,
      capital_amount:      r.capital_amount,
      interest_rate:       r.interest_rate,
      interest_earned:     r.interest_earned,
      total_interest_paid: r.total_interest_paid,
      patronage_rate:      r.patronage_rate,
      patronage_refund:    r.patronage_refund,
      total_earnings:      r.total_earnings,
      loan_deduction:      r.loan_deduction,
      cash_released:       r.cash_released,
    }))

    // Upsert so re-running overwrites existing records for same member+year
    const { error, data } = await supabase
      .from('dividends')
      .upsert(payload, { onConflict: 'member_id,fiscal_year' })

    setSavingAll(false)
    if (error) {
      setSaveResult({ ok: false, msg: error.message })
    } else {
      setSaveResult({ ok: true, msg: `${payload.length} dividend records saved for ${compYear}.` })
      // Audit log
      await supabase.from('audit_log').insert({
        action:            'dividend_batch_posted',
        table_name:        'dividends',
        performed_by:      profile?.id,
        performed_by_role: profile?.role,
        new_value:         { fiscal_year: compYear, member_count: payload.length },
        notes:             `Batch dividend computation posted for ${compYear} — ${payload.length} members`,
      }).catch(() => {})
      fetchAll()
    }
  }

  const totalCashReleased = filtered.reduce((s, r) => s + Number(r.cash_released), 0)
  const totalEarnings     = filtered.reduce((s, r) => s + Number(r.total_earnings), 0)

  return (
    <div>
      {/* Header */}
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-xl font-bold text-gray-800">Dividends</h1>
          <p className="text-sm text-gray-500">Annual dividend computation and records</p>
        </div>
        {isAdmin && (
          <div className="flex gap-2">
            <button
              onClick={() => { setComputeOpen(v => !v); setSaveResult(null) }}
              className="border border-blue-600 text-blue-600 hover:bg-blue-50 text-sm font-medium px-4 py-2 rounded-lg"
            >
              {computeOpen ? 'Hide Compute' : 'Compute Dividends'}
            </button>
            <button
              onClick={openAdd}
              className="bg-blue-600 hover:bg-blue-700 text-white text-sm font-medium px-4 py-2 rounded-lg"
            >
              + Add Record
            </button>
          </div>
        )}
      </div>

      {/* ── Compute Panel ────────────────────────────────────── */}
      {isAdmin && computeOpen && (
        <div className="bg-white rounded-xl shadow p-5 mb-6">
          <h2 className="font-semibold text-gray-700 mb-4">Compute Annual Dividends</h2>
          <div className="flex flex-wrap gap-4 items-end mb-4">
            <div>
              <label className="block text-xs text-gray-500 mb-1">Fiscal Year</label>
              <select
                value={compYear}
                onChange={e => setCompYear(e.target.value)}
                className="border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
              >
                {getFiscalYears().map(y => <option key={y} value={y}>{y}</option>)}
              </select>
            </div>
            <div>
              <label className="block text-xs text-gray-500 mb-1">Interest Rate (%)</label>
              <input
                type="number"
                min="0"
                step="0.01"
                placeholder="e.g. 16.56"
                value={compRate}
                onChange={e => setCompRate(e.target.value)}
                className="border border-gray-300 rounded-lg px-3 py-2 text-sm w-32 focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>
            <div>
              <label className="block text-xs text-gray-500 mb-1">Patronage Rate (%)</label>
              <input
                type="number"
                min="0"
                step="0.01"
                value={compPatronage}
                onChange={e => setCompPatronage(e.target.value)}
                className="border border-gray-300 rounded-lg px-3 py-2 text-sm w-28 focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>
            <button
              onClick={runCompute}
              disabled={computing || !compRate}
              className="px-4 py-2 bg-indigo-600 hover:bg-indigo-700 disabled:opacity-50 text-white text-sm font-medium rounded-lg"
            >
              {computing ? 'Computing...' : 'Preview'}
            </button>
          </div>
          <p className="text-xs text-gray-400 mb-4">
            Interest = Capital × {compRate || '?'}% · Patronage = Interest Paid × {compPatronage}%
            · Fiscal year covers Apr {compYear.split('-')[0]} – Mar {compYear.split('-')[1]}
            · Loan deduction is auto-calculated from each member's current outstanding released loan balance.
          </p>

          {preview.length > 0 && (
            <>
              <div className="overflow-x-auto rounded-lg border border-gray-200 mb-4">
                <table className="w-full text-xs">
                  <thead className="bg-gray-50 border-b border-gray-200">
                    <tr>
                      <th className="text-left px-3 py-2 font-medium text-gray-600">Member</th>
                      <th className="text-right px-3 py-2 font-medium text-gray-600">Capital</th>
                      <th className="text-right px-3 py-2 font-medium text-gray-600">Interest Earned</th>
                      <th className="text-right px-3 py-2 font-medium text-gray-600">Int. Paid</th>
                      <th className="text-right px-3 py-2 font-medium text-gray-600">Patronage</th>
                      <th className="text-right px-3 py-2 font-medium text-gray-600">Total</th>
                      <th className="text-right px-3 py-2 font-medium text-gray-600">Loan Deduct.</th>
                      <th className="text-right px-3 py-2 font-medium text-gray-600">Cash Out</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-gray-100">
                    {preview.map(r => (
                      <tr key={r.member_id} className="hover:bg-gray-50">
                        <td className="px-3 py-2 font-medium text-gray-800">{r.full_name}</td>
                        <td className="px-3 py-2 text-right text-gray-700">{peso(r.capital_amount)}</td>
                        <td className="px-3 py-2 text-right text-blue-700">{peso(r.interest_earned)}</td>
                        <td className="px-3 py-2 text-right text-gray-500">{peso(r.total_interest_paid)}</td>
                        <td className="px-3 py-2 text-right text-purple-700">{peso(r.patronage_refund)}</td>
                        <td className="px-3 py-2 text-right font-semibold text-gray-800">{peso(r.total_earnings)}</td>
                        <td className="px-3 py-2 text-right text-red-600">
                          {r.loan_deduction > 0 ? peso(r.loan_deduction) : <span className="text-gray-300">—</span>}
                        </td>
                        <td className="px-3 py-2 text-right font-bold text-green-700">{peso(r.cash_released)}</td>
                      </tr>
                    ))}
                  </tbody>
                  <tfoot className="bg-gray-50 border-t border-gray-200">
                    <tr>
                      <td colSpan={5} className="px-3 py-2 text-xs font-semibold text-gray-600">
                        Total · {preview.length} members
                      </td>
                      <td className="px-3 py-2 text-right text-xs font-bold text-gray-800">
                        {peso(preview.reduce((s, r) => s + r.total_earnings, 0))}
                      </td>
                      <td className="px-3 py-2 text-right text-xs font-bold text-red-600">
                        {peso(preview.reduce((s, r) => s + r.loan_deduction, 0))}
                      </td>
                      <td className="px-3 py-2 text-right text-xs font-bold text-green-700">
                        {peso(preview.reduce((s, r) => s + r.cash_released, 0))}
                      </td>
                    </tr>
                  </tfoot>
                </table>
              </div>

              <div className="flex items-center gap-4">
                <button
                  onClick={saveAllDividends}
                  disabled={savingAll}
                  className="px-5 py-2 bg-green-600 hover:bg-green-700 disabled:opacity-50 text-white text-sm font-medium rounded-lg"
                >
                  {savingAll ? 'Saving...' : `Save All ${preview.length} Records`}
                </button>
                {saveResult && (
                  <p className={`text-sm ${saveResult.ok ? 'text-green-700' : 'text-red-600'}`}>
                    {saveResult.msg}
                  </p>
                )}
              </div>
            </>
          )}
        </div>
      )}

      {/* ── Recorded Dividends ───────────────────────────────── */}
      <div className="flex items-center justify-between mb-4 flex-wrap gap-2">
        <div className="flex gap-2 items-center">
          <select
            value={filterYear}
            onChange={e => setFilterYear(e.target.value)}
            className="border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
          >
            <option value="">All Fiscal Years</option>
            {fiscalYears.map(y => <option key={y} value={y}>{y}</option>)}
          </select>
          <span className="text-xs text-gray-400">{filtered.length} records</span>
        </div>
        {filtered.length > 0 && (
          <div className="flex gap-4 text-sm">
            <span className="text-gray-500">
              Total Earnings: <strong className="text-gray-800">{peso(totalEarnings)}</strong>
            </span>
            <span className="text-gray-500">
              Cash Released: <strong className="text-green-700">{peso(totalCashReleased)}</strong>
            </span>
          </div>
        )}
      </div>

      <div className="bg-white rounded-xl shadow overflow-hidden">
        {loading ? (
          <p className="text-center text-sm text-gray-500 py-12">Loading...</p>
        ) : filtered.length === 0 ? (
          <p className="text-center text-sm text-gray-500 py-12">No dividend records found.</p>
        ) : (
          <table className="w-full text-sm">
            <thead className="bg-gray-50 border-b border-gray-200">
              <tr>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Member</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Fiscal Year</th>
                <th className="text-right px-4 py-3 font-medium text-gray-600">Capital</th>
                <th className="text-right px-4 py-3 font-medium text-gray-600">Rate</th>
                <th className="text-right px-4 py-3 font-medium text-gray-600">Interest</th>
                <th className="text-right px-4 py-3 font-medium text-gray-600">Patronage</th>
                <th className="text-right px-4 py-3 font-medium text-gray-600">Total</th>
                <th className="text-right px-4 py-3 font-medium text-gray-600">Deduction</th>
                <th className="text-right px-4 py-3 font-medium text-gray-600">Cash Out</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Released</th>
                {isAdmin && <th className="px-4 py-3"></th>}
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              {filtered.map(r => (
                <tr key={r.id} className="hover:bg-gray-50">
                  <td className="px-4 py-3 font-medium text-gray-800">
                    {r.members?.full_name ?? '—'}
                  </td>
                  <td className="px-4 py-3 font-mono text-gray-700">{r.fiscal_year}</td>
                  <td className="px-4 py-3 text-right text-gray-700">{peso(r.capital_amount)}</td>
                  <td className="px-4 py-3 text-right text-gray-500">{pct(r.interest_rate)}</td>
                  <td className="px-4 py-3 text-right text-blue-700">{peso(r.interest_earned)}</td>
                  <td className="px-4 py-3 text-right text-purple-700">{peso(r.patronage_refund)}</td>
                  <td className="px-4 py-3 text-right font-semibold text-gray-800">{peso(r.total_earnings)}</td>
                  <td className="px-4 py-3 text-right text-red-500">
                    {Number(r.loan_deduction) > 0 ? peso(r.loan_deduction) : <span className="text-gray-300">—</span>}
                  </td>
                  <td className="px-4 py-3 text-right font-bold text-green-700">{peso(r.cash_released)}</td>
                  <td className="px-4 py-3 text-gray-500 whitespace-nowrap">{fdate(r.release_date)}</td>
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
            <tfoot className="bg-gray-50 border-t border-gray-200">
              <tr>
                <td colSpan={8} className="px-4 py-2 text-sm font-medium text-gray-600">Total</td>
                <td className="px-4 py-2 text-right text-sm font-bold text-green-700">{peso(totalCashReleased)}</td>
                <td colSpan={isAdmin ? 2 : 1} />
              </tr>
            </tfoot>
          </table>
        )}
      </div>

      {showForm && (
        <DividendForm
          record={editing}
          onClose={() => setShowForm(false)}
          onSaved={() => { setShowForm(false); fetchAll() }}
        />
      )}
    </div>
  )
}
