import { useEffect, useState } from 'react'
import { supabase } from '../../lib/supabase'

const peso = n => `₱${Number(n).toLocaleString('en-PH', { minimumFractionDigits: 2 })}`
const date = s => s ? new Date(s).toLocaleDateString('en-PH') : '—'

export default function MemberContributionsPage() {
  const [rows, setRows] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    supabase
      .from('contributions')
      .select('*')
      .order('cutoff_date', { ascending: false })
      .then(({ data }) => { setRows(data ?? []); setLoading(false) })
  }, [])

  const total = rows.reduce((s, r) => s + Number(r.amount), 0)

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-xl font-bold text-gray-800">My Contributions</h1>
        <p className="text-sm text-gray-500">
          {rows.length} records · {peso(total)} total share capital
        </p>
      </div>

      <div className="bg-white rounded-xl shadow overflow-hidden">
        {loading ? (
          <p className="text-center text-sm text-gray-500 py-12">Loading...</p>
        ) : rows.length === 0 ? (
          <p className="text-center text-sm text-gray-500 py-12">No contributions on record.</p>
        ) : (
          <table className="w-full text-sm">
            <thead className="bg-gray-50 border-b border-gray-200">
              <tr>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Cutoff Period</th>
                <th className="text-right px-4 py-3 font-medium text-gray-600">Amount</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Cutoff Date</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Payment Date</th>
                <th className="text-left px-4 py-3 font-medium text-gray-600">Notes</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              {rows.map((r, i) => (
                <tr key={r.id} className="hover:bg-gray-50">
                  <td className="px-4 py-3 font-mono text-gray-700">{r.cutoff_period}</td>
                  <td className="px-4 py-3 text-right font-medium text-gray-800">{peso(r.amount)}</td>
                  <td className="px-4 py-3 text-gray-500">{date(r.cutoff_date)}</td>
                  <td className="px-4 py-3 text-gray-500">{date(r.payment_date)}</td>
                  <td className="px-4 py-3 text-gray-400 text-xs">{r.notes ?? ''}</td>
                </tr>
              ))}
            </tbody>
            <tfoot className="bg-gray-50 border-t border-gray-200">
              <tr>
                <td className="px-4 py-2 text-sm font-medium text-gray-600">Total</td>
                <td className="px-4 py-2 text-right text-sm font-bold text-blue-700">{peso(total)}</td>
                <td colSpan={3}></td>
              </tr>
            </tfoot>
          </table>
        )}
      </div>
    </div>
  )
}
