import { useState } from 'react'
import { useAuth } from '../../context/AuthContext'
import { supabase } from '../../lib/supabase'

function SuccessBanner({ message }) {
  if (!message) return null
  return (
    <p className="text-sm text-green-700 bg-green-50 border border-green-200 rounded px-3 py-2">
      {message}
    </p>
  )
}

function ErrorBanner({ message }) {
  if (!message) return null
  return (
    <p className="text-sm text-red-600 bg-red-50 border border-red-200 rounded px-3 py-2">
      {message}
    </p>
  )
}

// ── Name card (only for users linked to a member record) ─────────────────────
function NameCard({ profile, refreshProfile }) {
  const [name, setName] = useState(profile.members?.full_name ?? '')
  const [saving, setSaving] = useState(false)
  const [success, setSuccess] = useState('')
  const [error, setError]   = useState('')

  async function handleSave(e) {
    e.preventDefault()
    const trimmed = name.trim()
    if (!trimmed) return
    setSaving(true)
    setSuccess('')
    setError('')

    const { error: err } = await supabase
      .from('members')
      .update({ full_name: trimmed })
      .eq('id', profile.member_id)

    setSaving(false)

    if (err) {
      setError(err.message)
    } else {
      await refreshProfile()
      setSuccess('Name updated successfully.')
      setTimeout(() => setSuccess(''), 3000)
    }
  }

  return (
    <div className="bg-white rounded-xl shadow p-6">
      <h2 className="font-semibold text-gray-800 mb-1">Display Name</h2>
      <p className="text-sm text-gray-500 mb-4">
        This is the name shown across the app for your account.
      </p>
      <form onSubmit={handleSave} className="space-y-3">
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Full Name</label>
          <input
            type="text"
            value={name}
            onChange={e => setName(e.target.value)}
            required
            className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>
        <SuccessBanner message={success} />
        <ErrorBanner  message={error}   />
        <button
          type="submit"
          disabled={saving || !name.trim()}
          className="bg-blue-600 hover:bg-blue-700 disabled:opacity-50 text-white text-sm font-medium px-4 py-2 rounded-lg transition-colors"
        >
          {saving ? 'Saving...' : 'Save Name'}
        </button>
      </form>
    </div>
  )
}

// ── Password card (all users) ─────────────────────────────────────────────────
function PasswordCard({ updatePassword }) {
  const [password, setPassword] = useState('')
  const [confirm,  setConfirm]  = useState('')
  const [saving,   setSaving]   = useState(false)
  const [success,  setSuccess]  = useState('')
  const [error,    setError]    = useState('')

  async function handleSave(e) {
    e.preventDefault()
    setSuccess('')
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
    const { error: err } = await updatePassword(password)
    setSaving(false)

    if (err) {
      setError(err.message)
    } else {
      setPassword('')
      setConfirm('')
      setSuccess('Password changed successfully.')
      setTimeout(() => setSuccess(''), 3000)
    }
  }

  return (
    <div className="bg-white rounded-xl shadow p-6">
      <h2 className="font-semibold text-gray-800 mb-1">Change Password</h2>
      <p className="text-sm text-gray-500 mb-4">
        Choose a strong password of at least 8 characters.
      </p>
      <form onSubmit={handleSave} className="space-y-3">
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">New Password</label>
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
          <label className="block text-sm font-medium text-gray-700 mb-1">Confirm Password</label>
          <input
            type="password"
            value={confirm}
            onChange={e => setConfirm(e.target.value)}
            required
            placeholder="Repeat password"
            className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>
        <SuccessBanner message={success} />
        <ErrorBanner  message={error}   />
        <button
          type="submit"
          disabled={saving}
          className="bg-blue-600 hover:bg-blue-700 disabled:opacity-50 text-white text-sm font-medium px-4 py-2 rounded-lg transition-colors"
        >
          {saving ? 'Saving...' : 'Change Password'}
        </button>
      </form>
    </div>
  )
}

// ── Page ─────────────────────────────────────────────────────────────────────
export default function ProfilePage() {
  const { profile, updatePassword, refreshProfile } = useAuth()

  const displayEmail =
    profile?.email ??
    profile?.members?.email ??
    '—'

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-xl font-bold text-gray-800">My Profile</h1>
        <p className="text-sm text-gray-500">Manage your account settings</p>
      </div>

      {/* Read-only account info */}
      <div className="bg-white rounded-xl shadow p-6 mb-4">
        <h2 className="font-semibold text-gray-800 mb-3">Account Info</h2>
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
          <div>
            <p className="text-xs font-medium text-gray-500 mb-0.5">Login Email</p>
            <p className="text-sm text-gray-800">{displayEmail}</p>
          </div>
          <div>
            <p className="text-xs font-medium text-gray-500 mb-0.5">Role</p>
            <span className="text-xs bg-blue-100 text-blue-700 rounded px-2 py-0.5 capitalize">
              {profile?.role}
            </span>
          </div>
        </div>
      </div>

      <div className="space-y-4 max-w-lg">
        {/* Name card — only for users linked to a member */}
        {profile?.member_id && (
          <NameCard profile={profile} refreshProfile={refreshProfile} />
        )}

        {/* Password card — all users */}
        <PasswordCard updatePassword={updatePassword} />
      </div>
    </div>
  )
}
