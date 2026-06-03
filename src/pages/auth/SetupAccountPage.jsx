import { useState } from 'react'
import { useAuth } from '../../context/AuthContext'

export default function SetupAccountPage() {
  const { profile, completeSetup, signOut } = useAuth()
  const memberName = profile?.members?.full_name ?? profile?.display_name ?? 'Member'

  const [password, setPassword] = useState('')
  const [confirm, setConfirm] = useState('')
  const [error, setError] = useState('')
  const [saving, setSaving] = useState(false)

  async function handleSubmit(e) {
    e.preventDefault()
    setError('')

    if (password.length < 8) {
      setError('Password must be at least 8 characters.')
      return
    }
    if (password !== confirm) {
      setError('Passwords do not match.')
      return
    }

    setSaving(true)
    const { error } = await completeSetup(password)
    setSaving(false)

    if (error) {
      setError(error.message)
    }
    // On success, AuthContext sets first_login = false → App.jsx redirects to role home
  }

  return (
    <div className="min-h-screen bg-gray-100 flex items-center justify-center p-4">
      <div className="bg-white rounded-xl shadow p-8 w-full max-w-md">

        <div className="mb-6">
          <h1 className="text-xl font-bold text-gray-800">Welcome, {memberName}</h1>
          <p className="text-sm text-gray-500 mt-1">
            Please set a new password to secure your account.
            You will continue to log in using your assigned email address.
          </p>
        </div>

        <form onSubmit={handleSubmit} className="space-y-4">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              New Password
            </label>
            <input
              type="password"
              value={password}
              onChange={e => setPassword(e.target.value)}
              required
              placeholder="At least 8 characters"
              className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Confirm New Password
            </label>
            <input
              type="password"
              value={confirm}
              onChange={e => setConfirm(e.target.value)}
              required
              placeholder="Repeat password"
              className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
          </div>

          {error && (
            <p className="text-sm text-red-600 bg-red-50 border border-red-200 rounded px-3 py-2">
              {error}
            </p>
          )}

          <button
            type="submit"
            disabled={saving}
            className="w-full bg-blue-600 hover:bg-blue-700 disabled:opacity-50 text-white font-medium py-2 rounded-lg text-sm transition-colors"
          >
            {saving ? 'Saving...' : 'Set New Password'}
          </button>
        </form>

        <div className="mt-4 text-center">
          <button
            onClick={signOut}
            className="text-xs text-gray-400 hover:text-gray-600"
          >
            Sign out instead
          </button>
        </div>
      </div>
    </div>
  )
}
