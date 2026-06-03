import { useEffect, useState } from 'react'
import { supabase } from '../../lib/supabase'

function StatCard({ label, value, sub }) {
  return (
    <div className="bg-white rounded-xl shadow p-5">
      <p className="text-sm text-gray-500 mb-1">{label}</p>
      <p className="text-2xl font-bold text-gray-800">{value}</p>
      {sub && <p className="text-xs text-gray-400 mt-1">{sub}</p>}
    </div>
  )
}

export default function DashboardPage() {
  const [stats, setStats] = useState(null)

  useEffect(() => {
    async function load() {
      const [
        { count: totalMembers },
        { count: activeMembers },
        { count: pendingLoans },
        { data: loanData },
      ] = await Promise.all([
        supabase.from('members').select('*', { count: 'exact', head: true }),
        supabase.from('members').select('*', { count: 'exact', head: true }).eq('status', 'active'),
        supabase.from('loans').select('*', { count: 'exact', head: true }).eq('status', 'pending'),
        supabase.from('loans').select('principal_amount').eq('status', 'released'),
      ])
      const totalOutstanding = (loanData ?? []).reduce((s, r) => s + Number(r.principal_amount), 0)
      setStats({ totalMembers, activeMembers, pendingLoans, totalOutstanding })
    }
    load()
  }, [])

  return (
    <div>
      <h1 className="text-xl font-bold text-gray-800 mb-6">Dashboard</h1>
      {stats ? (
        <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
          <StatCard label="Total Members" value={stats.totalMembers} />
          <StatCard label="Active Members" value={stats.activeMembers} />
          <StatCard label="Pending Loan Approvals" value={stats.pendingLoans} />
          <StatCard
            label="Total Outstanding Loans"
            value={`₱${Number(stats.totalOutstanding).toLocaleString('en-PH', { minimumFractionDigits: 2 })}`}
          />
        </div>
      ) : (
        <p className="text-sm text-gray-500">Loading...</p>
      )}
    </div>
  )
}
