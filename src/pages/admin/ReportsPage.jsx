import { useEffect, useState } from 'react'
import { supabase } from '../../lib/supabase'
import Badge from '../../components/ui/Badge'
import Pagination from '../../components/ui/Pagination'

const peso  = n => `₱${Number(n).toLocaleString('en-PH', { minimumFractionDigits: 2 })}`
const fdate = s => s ? new Date(s + 'T00:00:00').toLocaleDateString('en-PH') : '—'

const TABS = ['Summary', 'Outstanding Loans', 'Contributions by Cutoff', 'Member Roster']
const PAGE_SIZE = 25

export default function ReportsPage() {
  const [tab,  setTab]  = useState(0)
  const [page, setPage] = useState(1)

  // ── Data ──────────────────────────────────────────────────
  const [members,       setMembers]       = useState([])
  const [contributions, setContributions] = useState([])
  const [loans,         setLoans]         = useState([])
  const [payments,      setPayments]      = useState([])
  const [loading,       setLoading]       = useState(true)

  useEffect(() => {
    async function load() {
      const [
        { data: m },
        { data: c },
        { data: l },
        { data: p },
      ] = await Promise.all([
        supabase.from('members').select('*').order('full_name'),
        supabase.from('contributions').select('member_id, amount, cutoff_period, cutoff_date'),
        supabase.from('loans').select('*').order('date_applied', { ascending: false }),
        supabase.from('loan_payments').select('loan_id, amount_paid'),
      ]).catch(() => [
        { data: null }, { data: null }, { data: null }, { data: null },
      ])
      setMembers(m ?? [])
      setContributions(c ?? [])
      setLoans(l ?? [])
      setPayments(p ?? [])
      setLoading(false)
    }
    load()
  }, [])

  // ── Derived data ──────────────────────────────────────────
  const capitalByMember = {}
  for (const c of contributions) {
    capitalByMember[c.member_id] = (capitalByMember[c.member_id] ?? 0) + Number(c.amount)
  }

  const paidByLoan = {}
  for (const p of payments) {
    paidByLoan[p.loan_id] = (paidByLoan[p.loan_id] ?? 0) + Number(p.amount_paid)
  }

  const activeMembers    = members.filter(m => m.status === 'active')
  const totalCapital     = contributions.reduce((s, c) => s + Number(c.amount), 0)
  const releasedLoans    = loans.filter(l => l.status === 'released')
  const totalReleased    = loans
    .filter(l => ['released', 'completed'].includes(l.status))
    .reduce((s, l) => s + Number(l.principal_amount), 0)
  const totalCollected   = payments.reduce((s, p) => s + Number(p.amount_paid), 0)
  const totalOutstanding = releasedLoans.reduce((l, loan) => {
    const paid = paidByLoan[loan.id] ?? 0
    return l + Math.max(0, Number(loan.total_payable ?? loan.principal_amount) - paid)
  }, 0)

  // Contributions grouped by cutoff_period
  const byPeriod = {}
  for (const c of contributions) {
    if (!byPeriod[c.cutoff_period]) byPeriod[c.cutoff_period] = { count: 0, total: 0, date: c.cutoff_date }
    byPeriod[c.cutoff_period].count++
    byPeriod[c.cutoff_period].total += Number(c.amount)
  }
  const periods = Object.entries(byPeriod)
    .sort((a, b) => b[0].localeCompare(a[0]))

  // Outstanding loans enriched with member names
  const memberById = Object.fromEntries(members.map(m => [m.id, m]))

  // Paginated slices
  const pagedOutstanding = releasedLoans.slice((page - 1) * PAGE_SIZE, page * PAGE_SIZE)
  const pagedPeriods     = periods.slice((page - 1) * PAGE_SIZE, page * PAGE_SIZE)
  const pagedMembers     = members.slice((page - 1) * PAGE_SIZE, page * PAGE_SIZE)

  if (loading) return <p className="text-sm text-gray-500 py-8">Loading reports...</p>

  return (
    <div>
      {/* Print header (hidden on screen, visible when printing) */}
      <div className="print-only mb-4 border-b border-gray-300 pb-3">
        <p className="text-lg font-bold">RCC Cooperative — Reports</p>
        <p className="text-sm text-gray-600">
          {TABS[tab]} · as of {new Date().toLocaleDateString('en-PH')}
        </p>
      </div>

      <div className="mb-6 flex items-start justify-between flex-wrap gap-3 no-print">
        <div>
          <h1 className="text-xl font-bold text-gray-800">Reports</h1>
          <p className="text-sm text-gray-500">Data as of {new Date().toLocaleDateString('en-PH')}</p>
        </div>
        <button
          onClick={() => window.print()}
          className="text-sm border border-gray-300 text-gray-600 hover:bg-gray-50 px-4 py-2 rounded-lg"
        >
          Print / Save PDF
        </button>
      </div>

      {/* Tabs */}
      <div className="flex gap-1 mb-6 bg-gray-100 rounded-xl p-1 w-fit flex-wrap no-print">
        {TABS.map((t, i) => (
          <button
            key={t}
            onClick={() => { setTab(i); setPage(1) }}
            className={`px-4 py-1.5 rounded-lg text-sm font-medium transition-colors ${
              tab === i
                ? 'bg-white shadow text-gray-800'
                : 'text-gray-500 hover:text-gray-700'
            }`}
          >
            {t}
          </button>
        ))}
      </div>

      {/* ── Tab 0: Summary ──────────────────────────────────── */}
      {tab === 0 && (
        <div className="space-y-4">
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            {[
              { label: 'Active Members',       value: activeMembers.length,    sub: `of ${members.length} total`,             accent: 'text-gray-800' },
              { label: 'Total Share Capital',  value: peso(totalCapital),      sub: `${contributions.length} contributions`,  accent: 'text-blue-700' },
              { label: 'Total Loans Released', value: peso(totalReleased),     sub: `${loans.filter(l => ['released','completed'].includes(l.status)).length} loans`, accent: 'text-purple-700' },
              { label: 'Outstanding Balance',  value: peso(totalOutstanding),  sub: `${releasedLoans.length} active loans`,   accent: 'text-red-600'  },
            ].map(s => (
              <div key={s.label} className="bg-white rounded-xl shadow p-5">
                <p className="text-xs text-gray-500 mb-1">{s.label}</p>
                <p className={`text-2xl font-bold ${s.accent}`}>{s.value}</p>
                <p className="text-xs text-gray-400 mt-1">{s.sub}</p>
              </div>
            ))}
          </div>

          {/* Loan status breakdown */}
          <div className="bg-white rounded-xl shadow p-5">
            <h2 className="font-semibold text-gray-700 mb-4">Loan Status Breakdown</h2>
            <div className="grid grid-cols-2 md:grid-cols-5 gap-3">
              {['pending', 'approved', 'released', 'completed', 'rejected'].map(status => {
                const count = loans.filter(l => l.status === status).length
                const total = loans.filter(l => l.status === status).reduce((s, l) => s + Number(l.principal_amount), 0)
                return (
                  <div key={status} className="text-center p-3 bg-gray-50 rounded-lg">
                    <Badge type="loan_status" value={status} />
                    <p className="text-xl font-bold text-gray-800 mt-2">{count}</p>
                    <p className="text-xs text-gray-500 mt-0.5">{peso(total)}</p>
                  </div>
                )
              })}
            </div>
          </div>

          {/* Member tier breakdown */}
          <div className="bg-white rounded-xl shadow p-5">
            <h2 className="font-semibold text-gray-700 mb-4">Members by Tier</h2>
            <div className="grid grid-cols-2 gap-3">
              {['regular_member', 'associate_member'].map(tier => {
                const group = members.filter(m => m.membership_tier === tier)
                const capital = group.reduce((s, m) => s + (capitalByMember[m.id] ?? 0), 0)
                return (
                  <div key={tier} className="p-4 bg-gray-50 rounded-lg">
                    <Badge type="membership_tier" value={tier} />
                    <p className="text-2xl font-bold text-gray-800 mt-2">{group.length}</p>
                    <p className="text-xs text-gray-500 mt-0.5">{peso(capital)} total capital</p>
                  </div>
                )
              })}
            </div>
          </div>

          {/* Collected vs outstanding */}
          <div className="bg-white rounded-xl shadow p-5">
            <h2 className="font-semibold text-gray-700 mb-4">Loan Collections</h2>
            <div className="grid grid-cols-2 gap-4 text-sm">
              <div>
                <p className="text-xs text-gray-400 mb-1">Total Collected</p>
                <p className="text-xl font-bold text-green-700">{peso(totalCollected)}</p>
              </div>
              <div>
                <p className="text-xs text-gray-400 mb-1">Still Outstanding</p>
                <p className="text-xl font-bold text-red-600">{peso(totalOutstanding)}</p>
              </div>
            </div>
            {totalReleased > 0 && (
              <div className="mt-4">
                <div className="flex justify-between text-xs text-gray-400 mb-1">
                  <span>Collection rate</span>
                  <span>{Math.round((totalCollected / totalReleased) * 100)}%</span>
                </div>
                <div className="bg-gray-100 rounded-full h-2">
                  <div
                    className="bg-green-500 h-2 rounded-full"
                    style={{ width: `${Math.min(100, (totalCollected / totalReleased) * 100)}%` }}
                  />
                </div>
              </div>
            )}
          </div>
        </div>
      )}

      {/* ── Tab 1: Outstanding Loans ─────────────────────────── */}
      {tab === 1 && (
        <div>
          <div className="flex items-baseline justify-between mb-4">
            <h2 className="font-semibold text-gray-800">
              Outstanding Loans
              <span className="text-sm font-normal text-gray-400 ml-2">{releasedLoans.length} active</span>
            </h2>
            <p className="text-sm font-bold text-red-600">{peso(totalOutstanding)} total remaining</p>
          </div>
          <div className="bg-white rounded-xl shadow overflow-x-auto">
            {releasedLoans.length === 0 ? (
              <p className="text-sm text-gray-400 text-center py-10">No outstanding loans.</p>
            ) : (
              <table className="w-full text-sm">
                <thead className="bg-gray-50 border-b border-gray-200">
                  <tr>
                    <th className="text-left px-4 py-3 font-medium text-gray-600">Member</th>
                    <th className="text-left px-4 py-3 font-medium text-gray-600">Loan</th>
                    <th className="text-left px-4 py-3 font-medium text-gray-600">Released</th>
                    <th className="text-right px-4 py-3 font-medium text-gray-600">Principal</th>
                    <th className="text-right px-4 py-3 font-medium text-gray-600">Total Payable</th>
                    <th className="text-right px-4 py-3 font-medium text-gray-600">Paid</th>
                    <th className="text-right px-4 py-3 font-medium text-gray-600">Remaining</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100">
                  {pagedOutstanding.map(loan => {
                    const paid      = paidByLoan[loan.id] ?? 0
                    const remaining = Math.max(0, Number(loan.total_payable ?? loan.principal_amount) - paid)
                    const mem       = memberById[loan.member_id]
                    return (
                      <tr key={loan.id} className="hover:bg-gray-50">
                        <td className="px-4 py-3 font-medium text-gray-800">
                          {mem?.full_name ?? '—'}
                          {loan.guarantor_name && (
                            <span className="block text-xs text-gray-400">via {loan.guarantor_name}</span>
                          )}
                        </td>
                        <td className="px-4 py-3 text-gray-600 capitalize">
                          #{loan.loan_number} {loan.loan_type}
                        </td>
                        <td className="px-4 py-3 text-gray-500">{fdate(loan.date_released)}</td>
                        <td className="px-4 py-3 text-right text-gray-700">{peso(loan.principal_amount)}</td>
                        <td className="px-4 py-3 text-right text-gray-700">{peso(loan.total_payable ?? loan.principal_amount)}</td>
                        <td className="px-4 py-3 text-right text-green-700 font-medium">{peso(paid)}</td>
                        <td className="px-4 py-3 text-right font-bold text-red-600">{peso(remaining)}</td>
                      </tr>
                    )
                  })}
                </tbody>
                <tfoot className="bg-gray-50 border-t border-gray-200">
                  <tr>
                    <td colSpan={6} className="px-4 py-2 text-sm font-medium text-gray-600">Total Outstanding</td>
                    <td className="px-4 py-2 text-right text-sm font-bold text-red-600">{peso(totalOutstanding)}</td>
                  </tr>
                </tfoot>
              </table>
            )}
          </div>
          <Pagination page={page} pageSize={PAGE_SIZE} total={releasedLoans.length} onChange={setPage} />
        </div>
      )}

      {/* ── Tab 2: Contributions by Cutoff ──────────────────── */}
      {tab === 2 && (
        <div>
          <div className="flex items-baseline justify-between mb-4">
            <h2 className="font-semibold text-gray-800">
              Contributions by Cutoff Period
              <span className="text-sm font-normal text-gray-400 ml-2">{periods.length} periods</span>
            </h2>
            <p className="text-sm font-bold text-blue-700">{peso(totalCapital)} all-time</p>
          </div>
          <div className="bg-white rounded-xl shadow overflow-hidden">
            {periods.length === 0 ? (
              <p className="text-sm text-gray-400 text-center py-10">No contributions recorded.</p>
            ) : (
              <table className="w-full text-sm">
                <thead className="bg-gray-50 border-b border-gray-200">
                  <tr>
                    <th className="text-left px-4 py-3 font-medium text-gray-600">Cutoff Period</th>
                    <th className="text-left px-4 py-3 font-medium text-gray-600">Cutoff Date</th>
                    <th className="text-right px-4 py-3 font-medium text-gray-600">Members</th>
                    <th className="text-right px-4 py-3 font-medium text-gray-600">Total Amount</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100">
                  {pagedPeriods.map(([period, data]) => (
                    <tr key={period} className="hover:bg-gray-50">
                      <td className="px-4 py-3 font-mono font-medium text-gray-800">{period}</td>
                      <td className="px-4 py-3 text-gray-500">{fdate(data.date)}</td>
                      <td className="px-4 py-3 text-right text-gray-700">{data.count}</td>
                      <td className="px-4 py-3 text-right font-semibold text-blue-700">{peso(data.total)}</td>
                    </tr>
                  ))}
                </tbody>
                <tfoot className="bg-gray-50 border-t border-gray-200">
                  <tr>
                    <td colSpan={2} className="px-4 py-2 text-sm font-medium text-gray-600">All-time Total</td>
                    <td className="px-4 py-2 text-right text-sm text-gray-600">
                      {contributions.length}
                    </td>
                    <td className="px-4 py-2 text-right text-sm font-bold text-blue-700">{peso(totalCapital)}</td>
                  </tr>
                </tfoot>
              </table>
            )}
          </div>
          <Pagination page={page} pageSize={PAGE_SIZE} total={periods.length} onChange={setPage} />
        </div>
      )}

      {/* ── Tab 3: Member Roster ─────────────────────────────── */}
      {tab === 3 && (
        <div>
          <div className="flex items-baseline justify-between mb-4">
            <h2 className="font-semibold text-gray-800">
              Member Roster
              <span className="text-sm font-normal text-gray-400 ml-2">{members.length} total</span>
            </h2>
          </div>
          <div className="bg-white rounded-xl shadow overflow-hidden">
            <table className="w-full text-sm">
              <thead className="bg-gray-50 border-b border-gray-200">
                <tr>
                  <th className="text-left px-4 py-3 font-medium text-gray-600">Name</th>
                  <th className="text-left px-4 py-3 font-medium text-gray-600">Tier</th>
                  <th className="text-left px-4 py-3 font-medium text-gray-600">Status</th>
                  <th className="text-left px-4 py-3 font-medium text-gray-600">Joined</th>
                  <th className="text-right px-4 py-3 font-medium text-gray-600">Capital</th>
                  <th className="text-right px-4 py-3 font-medium text-gray-600">Active Loans</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {pagedMembers.map(m => {
                  const capital     = capitalByMember[m.id] ?? 0
                  const activeLoans = loans.filter(l => l.member_id === m.id && l.status === 'released').length
                  return (
                    <tr key={m.id} className="hover:bg-gray-50">
                      <td className="px-4 py-3 font-medium text-gray-800">{m.full_name}</td>
                      <td className="px-4 py-3"><Badge type="membership_tier" value={m.membership_tier} /></td>
                      <td className="px-4 py-3"><Badge type="member_status" value={m.status} /></td>
                      <td className="px-4 py-3 text-gray-500">{fdate(m.date_joined)}</td>
                      <td className="px-4 py-3 text-right font-medium text-blue-700">{peso(capital)}</td>
                      <td className="px-4 py-3 text-right">
                        {activeLoans > 0
                          ? <span className="text-red-600 font-semibold">{activeLoans}</span>
                          : <span className="text-gray-300">—</span>
                        }
                      </td>
                    </tr>
                  )
                })}
              </tbody>
            </table>
          </div>
          <Pagination page={page} pageSize={PAGE_SIZE} total={members.length} onChange={setPage} />
        </div>
      )}
    </div>
  )
}
