import { useEffect, useState } from 'react'
import { supabase } from '../../lib/supabase'

const peso = n => `₱${Number(n).toLocaleString('en-PH', { minimumFractionDigits: 2 })}`

function StatCard({ label, value, sub, accent }) {
  return (
    <div className="bg-white rounded-xl shadow p-5">
      <p className="text-sm text-gray-500 mb-1">{label}</p>
      <p className={`text-2xl font-bold ${accent ?? 'text-gray-800'}`}>{value}</p>
      {sub && <p className="text-xs text-gray-400 mt-1">{sub}</p>}
    </div>
  )
}

const LOAN_STATUS_LABEL = {
  pending:  { label: 'Pending',  cls: 'bg-yellow-100 text-yellow-700' },
  approved: { label: 'Approved', cls: 'bg-blue-100 text-blue-700' },
  released: { label: 'Released', cls: 'bg-green-100 text-green-700' },
  closed:   { label: 'Closed',   cls: 'bg-gray-100 text-gray-500' },
  rejected: { label: 'Rejected', cls: 'bg-red-100 text-red-600' },
}

export default function DashboardPage() {
  const [stats,       setStats]       = useState(null)
  const [recentLoans, setRecentLoans] = useState([])
  const [loading,     setLoading]     = useState(true)

  useEffect(() => {
    async function load() {
      try {
        const [
          { count: totalMembers },
          { count: activeMembers },
          { count: pendingLoans },
          { data: releasedLoans },
          { data: allContribs },
          { count: linkedProfiles },
          { data: recentLoanRows },
        ] = await Promise.all([
          supabase.from('members').select('*', { count: 'exact', head: true }),
          supabase.from('members').select('*', { count: 'exact', head: true }).eq('status', 'active'),
          supabase.from('loans').select('*', { count: 'exact', head: true }).eq('status', 'pending'),
          supabase.from('loans').select('principal_amount').eq('status', 'released'),
          supabase.from('contributions').select('amount'),
          supabase.from('profiles').select('*', { count: 'exact', head: true }).not('member_id', 'is', null),
          supabase
            .from('loans')
            .select('id, loan_number, loan_type, principal_amount, status, date_applied, members(full_name)')
            .order('created_at', { ascending: false })
            .limit(6),
        ])

        const totalOutstanding   = (releasedLoans ?? []).reduce((s, r) => s + Number(r.principal_amount), 0)
        const totalContributions = (allContribs   ?? []).reduce((s, c) => s + Number(c.amount), 0)
        const tm = totalMembers  ?? 0
        const lp = linkedProfiles ?? 0

        setStats({
          totalMembers:      tm,
          activeMembers:     activeMembers  ?? 0,
          pendingLoans:      pendingLoans   ?? 0,
          inactiveMembers:   tm - (activeMembers ?? 0),
          totalOutstanding,
          totalContributions,
          linkedProfiles:    lp,
          noAccount:         tm - lp,
        })
        setRecentLoans(recentLoanRows ?? [])
      } catch (err) {
        console.error('Dashboard load error:', err)
      } finally {
        setLoading(false)
      }
    }
    load()
  }, [])

  return (
    <div>
      <h1 className="text-xl font-bold text-gray-800 mb-6">Dashboard</h1>

      {loading ? (
        <p className="text-sm text-gray-500 mb-6">Loading...</p>
      ) : !stats ? (
        <p className="text-sm text-red-500 mb-6">Failed to load stats.</p>
      ) : (
        <>
          {/* Row 1: members & loans */}
          <div className="grid grid-cols-2 lg:grid-cols-4 gap-4 mb-4">
            <StatCard label="Total Members"   value={stats.totalMembers} />
            <StatCard label="Active Members"  value={stats.activeMembers} />
            <StatCard
              label="Pending Loan Approvals"
              value={stats.pendingLoans}
              accent={stats.pendingLoans > 0 ? 'text-yellow-600' : 'text-gray-800'}
            />
            <StatCard
              label="Total Outstanding Loans"
              value={peso(stats.totalOutstanding)}
              accent="text-red-600"
            />
          </div>

          {/* Row 2: contributions & accounts */}
          <div className="grid grid-cols-2 lg:grid-cols-4 gap-4 mb-6">
            <StatCard
              label="Total Contributions Collected"
              value={peso(stats.totalContributions)}
              accent="text-blue-700"
            />
            <StatCard
              label="Members with App Account"
              value={stats.linkedProfiles}
            />
            <StatCard
              label="Members Without Account"
              value={stats.noAccount}
              accent={stats.noAccount > 0 ? 'text-orange-500' : 'text-green-600'}
              sub={stats.noAccount === 0 ? 'All members linked' : 'need accounts'}
            />
            <StatCard label="Inactive Members" value={stats.inactiveMembers} />
          </div>
        </>
      )}

      {/* Recent Loan Activity */}
      <div className="bg-white rounded-xl shadow p-5">
        <h2 className="font-semibold text-gray-700 mb-4">Recent Loan Activity</h2>
        {recentLoans.length === 0 ? (
          <p className="text-sm text-gray-400">No loan records yet.</p>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="text-left text-xs text-gray-400 border-b">
                  <th className="pb-2 font-medium">Member</th>
                  <th className="pb-2 font-medium">Loan #</th>
                  <th className="pb-2 font-medium">Type</th>
                  <th className="pb-2 font-medium text-right">Amount</th>
                  <th className="pb-2 font-medium">Date Applied</th>
                  <th className="pb-2 font-medium">Status</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-50">
                {recentLoans.map(l => {
                  const s = LOAN_STATUS_LABEL[l.status] ?? { label: l.status, cls: 'bg-gray-100 text-gray-600' }
                  return (
                    <tr key={l.id} className="hover:bg-gray-50">
                      <td className="py-2 pr-4 font-medium text-gray-700">
                        {l.members?.full_name ?? '—'}
                      </td>
                      <td className="py-2 pr-4 text-gray-500">#{l.loan_number}</td>
                      <td className="py-2 pr-4 capitalize text-gray-600">{l.loan_type}</td>
                      <td className="py-2 pr-4 text-right font-medium text-gray-800">
                        {peso(l.principal_amount)}
                      </td>
                      <td className="py-2 pr-4 text-gray-500">{l.date_applied}</td>
                      <td className="py-2">
                        <span className={`px-2 py-0.5 rounded-full text-xs font-medium ${s.cls}`}>
                          {s.label}
                        </span>
                      </td>
                    </tr>
                  )
                })}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </div>
  )
}
