import { useEffect, useState } from 'react'
import { supabase } from '../../lib/supabase'

const peso  = n => `₱${Number(n).toLocaleString('en-PH', { minimumFractionDigits: 2 })}`
const pct   = n => `${Number(n).toFixed(2)}%`
const fdate = s => s ? new Date(s + 'T00:00:00').toLocaleDateString('en-PH') : 'Not yet released'

export default function MemberDividendPage() {
  const [records, setRecords] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const { data } = await supabase
        .from('dividends')
        .select('*')
        .order('fiscal_year', { ascending: false })
      setRecords(data ?? [])
      setLoading(false)
    }
    load()
  }, [])

  if (loading) return <p className="text-sm text-gray-500 py-8">Loading...</p>

  const totalEarnings    = records.reduce((s, r) => s + Number(r.total_earnings),  0)
  const totalCashOut     = records.reduce((s, r) => s + Number(r.cash_released),   0)
  const totalDeductions  = records.reduce((s, r) => s + Number(r.loan_deduction),  0)

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-xl font-bold text-gray-800">My Dividends</h1>
        <p className="text-sm text-gray-500">Annual dividend earnings per fiscal year</p>
      </div>

      {records.length === 0 ? (
        <div className="bg-white rounded-xl shadow p-8 text-center">
          <p className="text-gray-400 text-sm">No dividend records yet.</p>
          <p className="text-gray-400 text-xs mt-1">Dividends are posted by the cooperative admin after each fiscal year.</p>
        </div>
      ) : (
        <>
          {/* Summary */}
          <div className="grid grid-cols-3 gap-4 mb-6">
            <div className="bg-white rounded-xl shadow p-4">
              <p className="text-xs text-gray-500 mb-1">Total Earnings</p>
              <p className="text-xl font-bold text-blue-700">{peso(totalEarnings)}</p>
              <p className="text-xs text-gray-400 mt-1">across {records.length} fiscal year{records.length !== 1 ? 's' : ''}</p>
            </div>
            <div className="bg-white rounded-xl shadow p-4">
              <p className="text-xs text-gray-500 mb-1">Total Deductions</p>
              <p className="text-xl font-bold text-red-500">{peso(totalDeductions)}</p>
              <p className="text-xs text-gray-400 mt-1">loan offsets</p>
            </div>
            <div className="bg-white rounded-xl shadow p-4">
              <p className="text-xs text-gray-500 mb-1">Total Cash Released</p>
              <p className="text-xl font-bold text-green-700">{peso(totalCashOut)}</p>
            </div>
          </div>

          {/* Per-year cards */}
          <div className="space-y-4">
            {records.map(r => (
              <div key={r.id} className="bg-white rounded-xl shadow overflow-hidden">
                {/* Card header */}
                <div className="px-5 py-4 border-b border-gray-100 flex items-center justify-between">
                  <div>
                    <p className="font-semibold text-gray-800">Fiscal Year {r.fiscal_year}</p>
                    <p className="text-xs text-gray-400 mt-0.5">
                      Released: {fdate(r.release_date)}
                    </p>
                  </div>
                  <span className="text-2xl font-bold text-green-700">{peso(r.cash_released)}</span>
                </div>

                {/* Details grid */}
                <div className="px-5 py-4 grid grid-cols-2 md:grid-cols-3 gap-4 text-sm">
                  <div>
                    <p className="text-xs text-gray-400 mb-0.5">Share Capital</p>
                    <p className="font-medium text-gray-800">{peso(r.capital_amount)}</p>
                  </div>
                  <div>
                    <p className="text-xs text-gray-400 mb-0.5">Interest Rate</p>
                    <p className="font-medium text-gray-800">{pct(r.interest_rate)}</p>
                  </div>
                  <div>
                    <p className="text-xs text-gray-400 mb-0.5">Interest Earned</p>
                    <p className="font-medium text-blue-700">{peso(r.interest_earned)}</p>
                  </div>
                  <div>
                    <p className="text-xs text-gray-400 mb-0.5">Patronage Rate</p>
                    <p className="font-medium text-gray-800">{pct(r.patronage_rate)}</p>
                  </div>
                  <div>
                    <p className="text-xs text-gray-400 mb-0.5">Patronage Refund</p>
                    <p className="font-medium text-purple-700">{peso(r.patronage_refund)}</p>
                  </div>
                  <div>
                    <p className="text-xs text-gray-400 mb-0.5">Total Earnings</p>
                    <p className="font-semibold text-gray-800">{peso(r.total_earnings)}</p>
                  </div>
                </div>

                {/* Deduction + final */}
                {Number(r.loan_deduction) > 0 && (
                  <div className="px-5 pb-4">
                    <div className="bg-red-50 rounded-lg p-3 flex justify-between text-sm">
                      <span className="text-gray-600">Loan Deduction</span>
                      <span className="font-medium text-red-600">— {peso(r.loan_deduction)}</span>
                    </div>
                  </div>
                )}

                <div className="px-5 pb-4">
                  <div className="bg-green-50 rounded-lg p-3 flex justify-between">
                    <span className="text-sm font-semibold text-gray-700">Cash Released</span>
                    <span className="text-lg font-bold text-green-700">{peso(r.cash_released)}</span>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </>
      )}
    </div>
  )
}
