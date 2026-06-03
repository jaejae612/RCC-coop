import { NavLink, useNavigate } from 'react-router-dom'
import { useAuth } from '../../context/AuthContext'

const adminLinks = [
  { to: '/admin/dashboard', label: 'Dashboard' },
  { to: '/admin/members', label: 'Members' },
  { to: '/admin/contributions', label: 'Contributions' },
  { to: '/admin/loans', label: 'Loans' },
  { to: '/admin/repayments', label: 'Repayments' },
  { to: '/admin/interest', label: 'Monthly Interest' },
  { to: '/admin/dividends', label: 'Dividends' },
  { to: '/admin/cashflow', label: 'Cash Flow' },
  { to: '/admin/reports', label: 'Reports' },
  { to: '/admin/users', label: 'User Accounts' },
]

const officerLinks = [
  { to: '/officer/dashboard', label: 'Dashboard' },
  { to: '/officer/loans', label: 'Loan Applications' },
  { to: '/officer/members', label: 'Members' },
  { to: '/officer/reports', label: 'Reports' },
]

const memberLinks = [
  { to: '/member/dashboard', label: 'My Dashboard' },
  { to: '/member/contributions', label: 'My Contributions' },
  { to: '/member/loans', label: 'My Loans' },
  { to: '/member/apply', label: 'Apply for Loan' },
  { to: '/member/dividend', label: 'My Dividend' },
  { to: '/member/statement', label: 'Statement' },
]

const ownerLinks = [
  { to: '/owner/dashboard', label: 'Dashboard' },
  { to: '/owner/reports', label: 'Reports' },
]

const linksByRole = {
  admin: adminLinks,
  officer: officerLinks,
  member: memberLinks,
  owner: ownerLinks,
}

export default function Sidebar() {
  const { profile, signOut } = useAuth()
  const navigate = useNavigate()
  const links = linksByRole[profile?.role] ?? []

  async function handleSignOut() {
    await signOut()
    navigate('/login')
  }

  return (
    <aside className="w-56 min-h-screen bg-gray-900 text-white flex flex-col">
      <div className="px-4 py-5 border-b border-gray-700">
        <p className="text-xs text-gray-400 uppercase tracking-widest mb-1">RCC COOP</p>
        <p className="font-semibold text-sm truncate">
          {profile?.members?.full_name ?? profile?.display_name ?? 'User'}
        </p>
        <span className="text-xs bg-blue-700 text-white rounded px-2 py-0.5 mt-1 inline-block capitalize">
          {profile?.role}
        </span>
      </div>

      <nav className="flex-1 px-2 py-4 space-y-0.5">
        {links.map(({ to, label }) => (
          <NavLink
            key={to}
            to={to}
            className={({ isActive }) =>
              `block px-3 py-2 rounded text-sm transition-colors ${
                isActive
                  ? 'bg-blue-600 text-white'
                  : 'text-gray-300 hover:bg-gray-700 hover:text-white'
              }`
            }
          >
            {label}
          </NavLink>
        ))}
      </nav>

      <div className="px-4 py-4 border-t border-gray-700">
        <button
          onClick={handleSignOut}
          className="w-full text-sm text-gray-400 hover:text-white text-left"
        >
          Sign out
        </button>
      </div>
    </aside>
  )
}
