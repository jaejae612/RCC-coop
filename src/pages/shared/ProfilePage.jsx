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

// ── Personal info card (only for users linked to a member record) ────────────
function PersonalInfoCard({ profile, refreshProfile }) {
  const m = profile.members ?? {}
  const [firstName, setFirstName] = useState(m.first_name ?? '')
  const [lastName,  setLastName]  = useState(m.last_name  ?? '')
  const [address,   setAddress]   = useState(m.address    ?? '')
  const [saving,    setSaving]    = useState(false)
  const [success,   setSuccess]   = useState('')
  const [error,     setError]     = useState('')

  async function handleSave(e) {
    e.preventDefault()
    const fn = firstName.trim()
    const ln = lastName.trim()
    if (!fn || !ln) return
    setSaving(true)
    setSuccess('')
    setError('')

    const { error: err } = await supabase
      .from('members')
      .update({
        first_name: fn,
        last_name:  ln,
        // keep full_name in sync so the rest of the app displays correctly
        full_name:  `${fn} ${ln}`,
        address:    address.trim() || null,
      })
      .eq('id', profile.member_id)

    setSaving(false)

    if (err) {
      setError(err.message)
    } else {
      await refreshProfile()
      setSuccess('Profile updated successfully.')
      setTimeout(() => setSuccess(''), 3000)
    }
  }

  return (
    <div className="bg-white rounded-xl shadow p-6">
      <h2 className="font-semibold text-gray-800 mb-1">Personal Information</h2>
      <p className="text-sm text-gray-500 mb-4">
        Your name is shown across the app. Address is for cooperative records only.
      </p>
      <form onSubmit={handleSave} className="space-y-3">
        <div className="grid grid-cols-2 gap-3">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">First Name</label>
            <input
              type="text"
              value={firstName}
              onChange={e => setFirstName(e.target.value)}
              required
              placeholder="e.g. Juan"
              className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Last Name</label>
            <input
              type="text"
              value={lastName}
              onChange={e => setLastName(e.target.value)}
              required
              placeholder="e.g. Dela Cruz"
              className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
          </div>
        </div>
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">
            Address <span className="text-gray-400 font-normal">(optional)</span>
          </label>
          <textarea
            value={address}
            onChange={e => setAddress(e.target.value)}
            rows={2}
            placeholder="e.g. 123 Rizal St., Cebu City"
            className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 resize-none"
          />
        </div>
        <SuccessBanner message={success} />
        <ErrorBanner  message={error}   />
        <button
          type="submit"
          disabled={saving || !firstName.trim() || !lastName.trim()}
          className="bg-blue-600 hover:bg-blue-700 disabled:opacity-50 text-white text-sm font-medium px-4 py-2 rounded-lg transition-colors"
        >
          {saving ? 'Saving...' : 'Save Info'}
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
  const { session, profile, updatePassword, refreshProfile } = useAuth()

  const displayEmail = session?.user?.email ?? '—'

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
        {/* Personal info card — only for users linked to a member */}
        {profile?.member_id && (
          <PersonalInfoCard profile={profile} refreshProfile={refreshProfile} />
        )}

        {/* Password card — all users */}
        <PasswordCard updatePassword={updatePassword} />
      </div>
    </div>
  )
}
