import { createContext, useContext, useEffect, useState } from 'react'
import { supabase } from '../lib/supabase'

const AuthContext = createContext(null)

export function AuthProvider({ children }) {
  const [session, setSession] = useState(null)
  const [profile, setProfile] = useState(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    supabase.auth.getSession().then(({ data: { session } }) => {
      setSession(session)
      if (session) fetchProfile(session.user.id)
      else setLoading(false)
    })

    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
      setSession(session)
      if (session) fetchProfile(session.user.id)
      else { setProfile(null); setLoading(false) }
    })

    return () => subscription.unsubscribe()
  }, [])

  async function fetchProfile(userId) {
    const { data } = await supabase
      .from('profiles')
      .select('*, members(full_name, first_name, last_name, name_suffix, address)')
      .eq('id', userId)
      .single()
    setProfile(data)
    setLoading(false)
  }

  async function signIn(email, password) {
    const { error } = await supabase.auth.signInWithPassword({ email, password })
    return { error }
  }

  async function signOut() {
    await supabase.auth.signOut()
  }

  async function updatePassword(newPassword) {
    const { error } = await supabase.auth.updateUser({ password: newPassword })
    return { error }
  }

  async function refreshProfile() {
    if (session) await fetchProfile(session.user.id)
  }

  // Called from SetupAccountPage on first login — only sets a new password
  async function completeSetup(newPassword) {
    // Update first_login BEFORE changing the password so that the
    // onAuthStateChange triggered by updateUser re-fetches a profile
    // that already has first_login: false, avoiding a race condition.
    const { error: profileError } = await supabase
      .from('profiles')
      .update({ first_login: false })
      .eq('id', session.user.id)
    if (profileError) return { error: profileError }

    const { error } = await supabase.auth.updateUser({ password: newPassword })
    if (error) return { error }

    // Ensure local profile state reflects first_login: false before returning
    await fetchProfile(session.user.id)
    return { error: null }
  }

  return (
    <AuthContext.Provider value={{ session, profile, loading, signIn, signOut, completeSetup, updatePassword, refreshProfile }}>
      {children}
    </AuthContext.Provider>
  )
}

export function useAuth() {
  return useContext(AuthContext)
}
