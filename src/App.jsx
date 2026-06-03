import { BrowserRouter, Routes, Route, Navigate, useNavigate, useLocation } from 'react-router-dom'
import { useEffect } from 'react'
import { AuthProvider, useAuth } from './context/AuthContext'
import AppLayout from './components/layout/AppLayout'
import LoginPage from './pages/auth/LoginPage'
import SetupAccountPage from './pages/auth/SetupAccountPage'
import DashboardPage from './pages/admin/DashboardPage'
import MembersPage from './pages/admin/MembersPage'
import Placeholder from './pages/Placeholder'

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
            <Route path="contributions" element={<Placeholder title="Contributions" />} />
            <Route path="loans" element={<Placeholder title="Loans" />} />
            <Route path="repayments" element={<Placeholder title="Repayments" />} />
            <Route path="interest" element={<Placeholder title="Monthly Interest" />} />
            <Route path="dividends" element={<Placeholder title="Dividends" />} />
            <Route path="cashflow" element={<Placeholder title="Cash Flow" />} />
            <Route path="reports" element={<Placeholder title="Reports" />} />
            <Route path="users" element={<Placeholder title="User Accounts" />} />
          </Route>

          {/* Officer routes */}
          <Route path="/officer" element={<RequireAuth><AppLayout /></RequireAuth>}>
            <Route path="dashboard" element={<Placeholder title="Officer Dashboard" />} />
            <Route path="loans" element={<Placeholder title="Loan Applications" />} />
            <Route path="members" element={<Placeholder title="Member Overview" />} />
            <Route path="reports" element={<Placeholder title="Reports" />} />
          </Route>

          {/* Member routes */}
          <Route path="/member" element={<RequireAuth><AppLayout /></RequireAuth>}>
            <Route path="dashboard" element={<Placeholder title="My Dashboard" />} />
            <Route path="contributions" element={<Placeholder title="My Contributions" />} />
            <Route path="loans" element={<Placeholder title="My Loans" />} />
            <Route path="apply" element={<Placeholder title="Apply for Loan" />} />
            <Route path="dividend" element={<Placeholder title="My Dividend" />} />
            <Route path="statement" element={<Placeholder title="Statement of Account" />} />
          </Route>

          {/* Owner routes */}
          <Route path="/owner" element={<RequireAuth><AppLayout /></RequireAuth>}>
            <Route path="dashboard" element={<Placeholder title="Owner Dashboard" />} />
            <Route path="reports" element={<Placeholder title="Reports" />} />
          </Route>

          <Route path="*" element={<Navigate to="/" replace />} />
        </Routes>
      </BrowserRouter>
    </AuthProvider>
  )
}
