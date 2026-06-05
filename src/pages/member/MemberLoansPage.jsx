import { useEffect, useState } from 'react'
import { supabase } from '../../lib/supabase'
import Badge from '../../components/ui/Badge'

const peso = n => `₱${Number(n).toLocaleString('en-PH', { minimumFractionDigits: 2 })}`
const date = s => s ? new Date(s).toLocaleDateString('en-PH') : '—'

function LoanCard({ loan, payments, charges }) {
  const totalPaid = payments.reduce((s, p) => s + Number(p.amount_paid), 0)
  const totalInterest = charges.reduce((s, c) => s + Number(c.interest_amount), 0)
  const totalPayable = Number(loan.total_payable ?? loan.principal_amount)
  const remaining = Math.max(0, totalPayable - totalPaid)
  const progressPct = totalPayable > 0 ? Math.min(100, (totalPaid / totalPayable) * 100) : 0

  const [expanded, setExpanded] = useState(false)

  return (
    <div className="bg-white rounded-xl shadow">
      {/* Loan header */}
      <div className="p-5">
        <div className="flex items-start justify-between mb-3">
          <div>
            <span className="font-semibold text-gray-800 capitalize">
              #{loan.loan_number} — {loan.loan_type} Loan
            </span>
            {loan.guarantor_name && (
              <span className="text-xs text-gray-400 ml-2">c/o {loan.guarantor_name}</span>
            )}
          </div>
          <Badge value={loan.status} />
        </div>

        <div className="grid grid-cols-2 md:grid-cols-4 gap-4 text-sm mb-4">
          <div>
            <span className="text-gray-400 text-xs block">Principal</span>
            <span className="font-medium">{peso(loan.principal_amount)}</span>
          </div>
          <div>
            <span className="text-gray-400 text-xs block">Monthly Payment</span>
            <span className="font-medium">{loan.monthly_payment ? peso(loan.monthly_payment) : '—'}</span>
          </div>
          <div>
            <span className="text-gray-400 text-xs block">Term</span>
            <span className="font-medium">{loan.term_months ? `${loan.term_months} months` : '—'}</span>
          </div>
          <div>
            <span className="text-gray-400 text-xs block">Interest Rate</span>
            <span className="font-medium">{loan.interest_rate}%/mo</span>
          </div>
        </div>

        <div className="grid grid-cols-3 gap-4 text-sm mb-4">
          <div>
            <span className="text-gray-400 text-xs block">Total Paid</span>
            <span className="font-semibold text-green-700">{peso(totalPaid)}</span>
          </div>
          <div>
            <span className="text-gray-400 text-xs block">Interest Accrued</span>
            <span className="font-semibold text-amber-700">{peso(totalInterest)}</span>
          </div>
          <div>
            <span className="text-gray-400 text-xs block">Remaining Balance</span>
            <span className={`font-semibold ${remaining === 0 ? 'text-green-600' : 'text-red-600'}`}>
              {peso(remaining)}
            </span>
          </div>
        </div>

        {/* Progress bar */}
        {loan.status === 'released' && (
          <div>
            <div className="flex justify-between text-xs text-gray-400 mb-1">
              <span>{progressPct.toFixed(1)}% paid</span>
              <span>{peso(totalPayable)} total</span>
            </div>
            <div className="bg-gray-100 rounded-full h-2">
              <div
                className="bg-blue-500 h-2 rounded-full transition-all"
                style={{ width: `${progressPct}%` }}
              />
            </div>
          </div>
        )}

        <div className="flex gap-4 text-xs text-gray-400 mt-3">
          <span>Applied: {date(loan.date_applied)}</span>
          {loan.date_approved && <span>Approved: {date(loan.date_approved)}</span>}
          {loan.date_released && <span>Released: {date(loan.date_released)}</span>}
        </div>
      </div>

      {/* Expandable payment history */}
      {payments.length > 0 && (
        <>
          <div className="border-t border-gray-100">
            <button
              onClick={() => setExpanded(e => !e)}
              className="w-full text-left px-5 py-2.5 text-xs text-gray-500 hover:bg-gray-50 flex justify-between"
            >
              <span>Payment History ({payments.length})</span>
              <span>{expanded ? '▲' : '▼'}</span>
            </button>
          </div>
          {expanded && (
            <div className="px-5 pb-4">
              <table className="w-full text-xs">
                <thead>
                  <tr className="text-gray-400">
                    <th className="text-left pb-1">Date</th>
                    <th className="text-right pb-1">Amount</th>
                    <th className="text-left pb-1 pl-4">Notes</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-50">
                  {payments.map(p => (
                    <tr key={p.id}>
                      <td className="py-1 text-gray-600">{date(p.payment_date)}</td>
                      <td className="py-1 text-right font-medium text-green-700">{peso(p.amount_paid)}</td>
                      <td className="py-1 pl-4 text-gray-400">{p.notes ?? ''}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </>
      )}
    </div>
  )
}

export default function MemberLoansPage() {
  const [loans, setLoans] = useState([])
  const [payments, setPayments] = useState([])
  const [charges, setCharges] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const [{ data: l }, { data: p }, { data: c }] = await Promise.all([
        supabase.from('loans').select('*').order('created_at', { ascending: false }),
        supabase.from('loan_payments').select('*').order('payment_date', { ascending: false }),
        supabase.from('loan_interest_charges').select('*'),
      ]).catch(() => [
        { data: null }, { data: null }, { data: null },
      ])
      setLoans(l ?? [])
      setPayments(p ?? [])
      setCharges(c ?? [])
      setLoading(false)
    }
    load()
  }, [])

  if (loading) return <p className="text-sm text-gray-500 p-8">Loading...</p>

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-xl font-bold text-gray-800">My Loans</h1>
        <p className="text-sm text-gray-500">{loans.length} loan{loans.length !== 1 ? 's' : ''} on record</p>
      </div>

      {loans.length === 0 ? (
        <div className="bg-white rounded-xl shadow p-8 text-center text-sm text-gray-400">
          No loans on record. Apply for a loan to get started.
        </div>
      ) : (
        <div className="space-y-4">
          {loans.map(loan => (
            <LoanCard
              key={loan.id}
              loan={loan}
              payments={payments.filter(p => p.loan_id === loan.id)}
              charges={charges.filter(c => c.loan_id === loan.id)}
            />
          ))}
        </div>
      )}
    </div>
  )
}
