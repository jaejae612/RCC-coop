import { useEffect, useState } from 'react'
import { supabase } from '../../lib/supabase'
import { useAuth } from '../../context/AuthContext'
import Badge from '../../components/ui/Badge'

const peso  = n => `₱${Number(n).toLocaleString('en-PH', { minimumFractionDigits: 2 })}`
const fdate = s => s ? new Date(s + 'T00:00:00').toLocaleDateString('en-PH') : '—'

export default function MemberStatementPage() {
  const { profile } = useAuth()

  const [member,        setMember]        = useState(null)
  const [contributions, setContributions] = useState([])
  const [loans,         setLoans]         = useState([])
  const [payments,      setPayments]      = useState([])
  const [interest,      setInterest]      = useState([])
  const [loading,       setLoading]       = useState(true)

  useEffect(() => {
    async function load() {
      const [
        { data: m },
        { data: c },
        { data: l },
        { data: p },
        { data: i },
      ] = await Promise.all([
        supabase.from('members').select('*').single(),
        supabase.from('contributions').select('*').order('cutoff_date', { ascending: false }),
        supabase.from('loans').select('*').order('date_applied', { ascending: false }),
        supabase.from('loan_payments').select('*').order('payment_date', { ascending: true }),
        supabase.from('loan_interest_charges').select('*').order('charge_month', { ascending: false }),
      ])
      setMember(m)
      setContributions(c ?? [])
      setLoans(l ?? [])
      setPayments(p ?? [])
      setInterest(i ?? [])
      setLoading(false)
    }
    load()
  }, [])

  if (loading) return <p className="text-sm text-gray-500 py-8">Loading...</p>
  if (!member) return <p className="text-sm text-gray-400 py-8">No member record linked to your account.</p>

  // Aggregate totals
  const totalCapital = contributions.reduce((s, c) => s + Number(c.amount), 0)

  const paymentsByLoan  = {}
  const interestByLoan  = {}
  for (const p of payments)  { if (!paymentsByLoan[p.loan_id]) paymentsByLoan[p.loan_id] = []; paymentsByLoan[p.loan_id].push(p) }
  for (const i of interest)  { if (!interestByLoan[i.loan_id]) interestByLoan[i.loan_id] = []; interestByLoan[i.loan_id].push(i) }

  const totalLoansReleased = loans
    .filter(l => ['released', 'completed'].includes(l.status))
    .reduce((s, l) => s + Number(l.principal_amount), 0)

  const outstandingBalance = loans
    .filter(l => l.status === 'released')
    .reduce((s, l) => {
      const paid = (paymentsByLoan[l.id] ?? []).reduce((a, p) => a + Number(p.amount_paid), 0)
      return s + Math.max(0, Number(l.total_payable ?? l.principal_amount) - paid)
    }, 0)

  return (
    <div>
      {/* Page header */}
      <div className="flex items-start justify-between mb-6">
        <div>
          <h1 className="text-xl font-bold text-gray-800">Statement of Account</h1>
          <p className="text-sm text-gray-500 mt-0.5">
            {member.full_name} · as of {new Date().toLocaleDateString('en-PH')}
          </p>
        </div>
        <button
          onClick={() => window.print()}
          className="text-sm border border-gray-300 text-gray-600 hover:bg-gray-50 px-4 py-2 rounded-lg"
        >
          Print
        </button>
      </div>

      {/* Member info card */}
      <div className="bg-white rounded-xl shadow p-5 mb-6 grid grid-cols-2 md:grid-cols-4 gap-4 text-sm">
        <div>
          <p className="text-xs text-gray-400 mb-1">Membership Tier</p>
          <Badge type="membership_tier" value={member.membership_tier} />
        </div>
        <div>
          <p className="text-xs text-gray-400 mb-1">Status</p>
          <Badge type="member_status" value={member.status} />
        </div>
        <div>
          <p className="text-xs text-gray-400 mb-1">Date Joined</p>
          <p className="font-medium text-gray-700">{fdate(member.date_joined)}</p>
        </div>
        <div>
          <p className="text-xs text-gray-400 mb-1">Contribution / Cutoff</p>
          <p className="font-medium text-gray-700">{peso(member.contribution_per_cutoff)}</p>
        </div>
      </div>

      {/* Summary stats */}
      <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-6">
        {[
          { label: 'Total Share Capital',    value: peso(totalCapital),          accent: 'text-blue-700'   },
          { label: 'Contributions',          value: `${contributions.length} cutoffs`, accent: 'text-gray-700' },
          { label: 'Total Loans Released',   value: peso(totalLoansReleased),    accent: 'text-purple-700' },
          {
            label: 'Outstanding Balance',
            value: peso(outstandingBalance),
            accent: outstandingBalance > 0 ? 'text-red-600' : 'text-green-600',
          },
        ].map(s => (
          <div key={s.label} className="bg-white rounded-xl shadow p-4">
            <p className="text-xs text-gray-500 mb-1">{s.label}</p>
            <p className={`text-lg font-bold ${s.accent}`}>{s.value}</p>
          </div>
        ))}
      </div>

      {/* ── Contributions ─────────────────────────────────────── */}
      <div className="bg-white rounded-xl shadow mb-6">
        <div className="px-5 py-4 border-b border-gray-100 flex items-baseline justify-between">
          <h2 className="font-semibold text-gray-800">Share Capital Contributions</h2>
          <span className="text-xs text-gray-400">
            {contributions.length} records · {peso(totalCapital)} total
          </span>
        </div>
        {contributions.length === 0 ? (
          <p className="text-sm text-gray-400 px-5 py-6">No contributions recorded yet.</p>
        ) : (
          <table className="w-full text-sm">
            <thead className="bg-gray-50 border-b border-gray-100">
              <tr>
                <th className="text-left px-5 py-2 text-xs font-medium text-gray-500">Cutoff Period</th>
                <th className="text-left px-5 py-2 text-xs font-medium text-gray-500">Cutoff Date</th>
                <th className="text-left px-5 py-2 text-xs font-medium text-gray-500">Payment Date</th>
                <th className="text-right px-5 py-2 text-xs font-medium text-gray-500">Amount</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-50">
              {contributions.map(c => (
                <tr key={c.id} className="hover:bg-gray-50">
                  <td className="px-5 py-2.5 font-mono text-gray-700">{c.cutoff_period}</td>
                  <td className="px-5 py-2.5 text-gray-500">{fdate(c.cutoff_date)}</td>
                  <td className="px-5 py-2.5 text-gray-500">{fdate(c.payment_date)}</td>
                  <td className="px-5 py-2.5 text-right font-medium text-gray-800">{peso(c.amount)}</td>
                </tr>
              ))}
            </tbody>
            <tfoot className="bg-gray-50 border-t border-gray-100">
              <tr>
                <td colSpan={3} className="px-5 py-2 text-xs font-semibold text-gray-600">Total</td>
                <td className="px-5 py-2 text-right text-sm font-bold text-blue-700">{peso(totalCapital)}</td>
              </tr>
            </tfoot>
          </table>
        )}
      </div>

      {/* ── Loans ─────────────────────────────────────────────── */}
      <h2 className="font-semibold text-gray-800 mb-3">Loan Records</h2>
      {loans.length === 0 ? (
        <div className="bg-white rounded-xl shadow p-5 text-sm text-gray-400">
          No loan records found.
        </div>
      ) : (
        <div className="space-y-5">
          {loans.map(loan => {
            const loanPayments = (paymentsByLoan[loan.id] ?? [])
              .slice().sort((a, b) => a.payment_date.localeCompare(b.payment_date))
            const loanInterest = (interestByLoan[loan.id] ?? [])
              .slice().sort((a, b) => a.charge_month.localeCompare(b.charge_month))
            const totalPaidForLoan     = loanPayments.reduce((s, p) => s + Number(p.amount_paid), 0)
            const totalInterestForLoan = loanInterest.reduce((s, i) => s + Number(i.interest_amount), 0)
            const remaining = Math.max(0, Number(loan.total_payable ?? loan.principal_amount) - totalPaidForLoan)

            return (
              <div key={loan.id} className="bg-white rounded-xl shadow overflow-hidden">
                {/* Loan header */}
                <div className="px-5 py-4 border-b border-gray-100 flex items-start justify-between flex-wrap gap-2">
                  <div>
                    <p className="font-semibold text-gray-800 capitalize">
                      Loan #{loan.loan_number} — {loan.loan_type}
                    </p>
                    <p className="text-xs text-gray-400 mt-0.5">
                      Applied: {fdate(loan.date_applied)}
                      {loan.date_released ? ` · Released: ${fdate(loan.date_released)}` : ''}
                      {loan.guarantor_name ? ` · Via: ${loan.guarantor_name}` : ''}
                    </p>
                  </div>
                  <Badge type="loan_status" value={loan.status} />
                </div>

                {/* Loan summary row */}
                <div className="px-5 py-3 grid grid-cols-2 md:grid-cols-4 gap-3 text-sm border-b border-gray-50 bg-gray-50">
                  <div>
                    <p className="text-xs text-gray-400">Principal</p>
                    <p className="font-medium text-gray-700">{peso(loan.principal_amount)}</p>
                  </div>
                  <div>
                    <p className="text-xs text-gray-400">Total Payable</p>
                    <p className="font-medium text-gray-700">{peso(loan.total_payable ?? loan.principal_amount)}</p>
                  </div>
                  <div>
                    <p className="text-xs text-gray-400">Total Paid</p>
                    <p className="font-medium text-green-700">{peso(totalPaidForLoan)}</p>
                  </div>
                  <div>
                    <p className="text-xs text-gray-400">Remaining</p>
                    <p className={`font-medium ${remaining > 0 ? 'text-red-600' : 'text-green-600'}`}>
                      {peso(remaining)}
                    </p>
                  </div>
                </div>

                {/* Progress bar */}
                {['released', 'completed'].includes(loan.status) && (
                  <div className="px-5 py-2 bg-gray-50 border-b border-gray-50">
                    <div className="flex justify-between text-xs text-gray-400 mb-1">
                      <span>Payment progress</span>
                      <span>
                        {Math.min(100, Math.round((totalPaidForLoan / Number(loan.total_payable ?? loan.principal_amount)) * 100))}%
                      </span>
                    </div>
                    <div className="bg-gray-200 rounded-full h-1.5">
                      <div
                        className="bg-blue-500 h-1.5 rounded-full transition-all"
                        style={{ width: `${Math.min(100, (totalPaidForLoan / Number(loan.total_payable ?? loan.principal_amount)) * 100)}%` }}
                      />
                    </div>
                  </div>
                )}

                {/* Payments table */}
                {loanPayments.length > 0 && (
                  <div className="px-5 py-4 border-b border-gray-50">
                    <p className="text-xs font-semibold text-gray-500 uppercase tracking-wide mb-2">
                      Payments ({loanPayments.length})
                    </p>
                    <table className="w-full text-xs">
                      <thead>
                        <tr className="text-gray-400 border-b border-gray-100">
                          <th className="text-left pb-1.5 font-medium">#</th>
                          <th className="text-left pb-1.5 font-medium">Date</th>
                          <th className="text-right pb-1.5 font-medium">Amount</th>
                          <th className="text-left pb-1.5 font-medium pl-4">Notes</th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-gray-50">
                        {loanPayments.map((p, idx) => (
                          <tr key={p.id}>
                            <td className="py-1.5 text-gray-400">{idx + 1}</td>
                            <td className="py-1.5 text-gray-600">{fdate(p.payment_date)}</td>
                            <td className="py-1.5 text-right font-semibold text-green-700">{peso(p.amount_paid)}</td>
                            <td className="py-1.5 pl-4 text-gray-400">{p.notes ?? ''}</td>
                          </tr>
                        ))}
                      </tbody>
                      <tfoot className="border-t border-gray-100">
                        <tr>
                          <td colSpan={2} className="pt-1.5 text-gray-500 font-medium">Total Paid</td>
                          <td className="pt-1.5 text-right font-bold text-green-700">{peso(totalPaidForLoan)}</td>
                          <td />
                        </tr>
                      </tfoot>
                    </table>
                  </div>
                )}

                {/* Interest charges table */}
                {loanInterest.length > 0 && (
                  <div className="px-5 py-4">
                    <p className="text-xs font-semibold text-gray-500 uppercase tracking-wide mb-2">
                      Monthly Interest Charges · {peso(totalInterestForLoan)} total
                    </p>
                    <table className="w-full text-xs">
                      <thead>
                        <tr className="text-gray-400 border-b border-gray-100">
                          <th className="text-left pb-1.5 font-medium">Month</th>
                          <th className="text-right pb-1.5 font-medium">Beg. Balance</th>
                          <th className="text-right pb-1.5 font-medium">Interest (2%)</th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-gray-50">
                        {loanInterest.map(i => (
                          <tr key={i.id}>
                            <td className="py-1.5 font-mono text-gray-600">{i.charge_month}</td>
                            <td className="py-1.5 text-right text-gray-600">{peso(i.beginning_balance)}</td>
                            <td className="py-1.5 text-right font-semibold text-amber-700">{peso(i.interest_amount)}</td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                )}
              </div>
            )
          })}
        </div>
      )}
    </div>
  )
}
