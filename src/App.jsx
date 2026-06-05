import { BrowserRouter, Routes, Route, Navigate, useNavigate, useLocation } from 'react-router-dom'
import { useEffect } from 'react'
import { AuthProvider, useAuth } from './context/AuthContext'
import AppLayout from './components/layout/AppLayout'
import LoginPage from './pages/auth/LoginPage'
import SetupAccountPage from './pages/auth/SetupAccountPage'
// Admin pages
import DashboardPage from './pages/admin/DashboardPage'
import MembersPage from './pages/admin/MembersPage'
import ContributionsPage from './pages/admin/ContributionsPage'
import LoansPage from './pages/admin/LoansPage'
import RepaymentsPage from './pages/admin/RepaymentsPage'
import InterestPage from './pages/admin/InterestPage'
import DividendsPage from './pages/admin/DividendsPage'
import CashFlowPage from './pages/admin/CashFlowPage'
import ReportsPage from './pages/admin/ReportsPage'
import NotificationsPage from './pages/admin/NotificationsPage'
import UserAccountsPage from './pages/admin/UserAccountsPage'
// Member pages
import MemberDashboardPage from './pages/member/MemberDashboardPage'
import MemberContributionsPage from './pages/member/MemberContributionsPage'
import MemberLoansPage from './pages/member/MemberLoansPage'
import MemberApplyPage from './pages/member/MemberApplyPage'
import MemberDividendPage from './pages/member/MemberDividendPage'
import MemberStatementPage from './pages/member/MemberStatementPage'
// Shared pages
import ProfilePage from './pages/shared/ProfilePage'


const roleHome = {
  admin: '/admin/dashboard',
  officer: '/officer/dashboard',
  member: '/member/dashboard',
  owner: '/owner/dashboard',
}

// Redirects to correct home after login based on role
function RootRedirect() {
  const { session, profile, loading } = useAuth()
  const navigate = useNavigate()
  useEffect(() => {
    if (loading) return
    if (!session) { navigate('/login', { replace: true }); return }
    if (profile?.first_login) { navigate('/setup-account', { replace: true }); return }
    if (profile?.role) navigate(roleHome[profile.role], { replace: true })
  }, [session, profile, loading])
  return <p className="p-8 text-gray-500 text-sm">Loading...</p>
}

// Guards all app routes — redirects to setup if first_login is still true
function RequireAuth({ children }) {
  const { session, profile, loading } = useAuth()
  const location = useLocation()

  if (loading) return <p className="p-8 text-gray-500 text-sm">Loading...</p>
  if (!session) return <Navigate to="/login" replace />

  // Force setup before accessing anything else
  if (profile?.first_login && location.pathname !== '/setup-account') {
    return <Navigate to="/setup-account" replace />
  }

  return children
}

export default function App() {
  return (
    <AuthProvider>
      <BrowserRouter>
        <Routes>
          <Route path="/login" element={<LoginPage />} />
          <Route path="/setup-account" element={<SetupAccountPage />} />
          <Route path="/" element={<RootRedirect />} />

          {/* Admin routes */}
          <Route path="/admin" element={<RequireAuth><AppLayout /></RequireAuth>}>
            <Route path="dashboard" element={<DashboardPage />} />
            <Route path="members" element={<MembersPage />} />
            <Route path="contributions" element={<ContributionsPage />} />
            <Route path="loans" element={<LoansPage />} />
            <Route path="repayments" element={<RepaymentsPage />} />
            <Route path="interest" element={<InterestPage />} />
            <Route path="dividends" element={<DividendsPage />} />
            <Route path="cashflow" element={<CashFlowPage />} />
            <Route path="reports" element={<ReportsPage />} />
            <Route path="notifications" element={<NotificationsPage />} />
            <Route path="users" element={<UserAccountsPage />} />
            <Route path="profile" element={<ProfilePage />} />
          </Route>

          {/* Officer routes — reuse admin pages (role-aware components handle display) */}
          <Route path="/officer" element={<RequireAuth><AppLayout /></RequireAuth>}>
            <Route path="dashboard" element={<DashboardPage />} />
            <Route path="loans" element={<LoansPage />} />
            <Route path="members" element={<MembersPage />} />
            <Route path="reports" element={<ReportsPage />} />
            <Route path="profile" element={<ProfilePage />} />
          </Route>

          {/* Member routes */}
          <Route path="/member" element={<RequireAuth><AppLayout /></RequireAuth>}>
            <Route path="dashboard" element={<MemberDashboardPage />} />
            <Route path="contributions" element={<MemberContributionsPage />} />
            <Route path="loans" element={<MemberLoansPage />} />
            <Route path="apply" element={<MemberApplyPage />} />
            <Route path="dividend" element={<MemberDividendPage />} />
            <Route path="statement" element={<MemberStatementPage />} />
            <Route path="profile" element={<ProfilePage />} />
          </Route>

          {/* Owner routes */}
          <Route path="/owner" element={<RequireAuth><AppLayout /></RequireAuth>}>
            <Route path="dashboard" element={<DashboardPage />} />
            <Route path="reports" element={<ReportsPage />} />
            <Route path="profile" element={<ProfilePage />} />
          </Route>

          <Route path="*" element={<Navigate to="/" replace />} />
        </Routes>
      </BrowserRouter>
    </AuthProvider>
  )
}
