/**
 * Notification helper — creates a notification record for a member.
 *
 * Usage:
 *   await notifyMember(supabase, memberId, 'loan_approved', 'Loan Approved', 'Your loan #1 was approved.')
 *
 * Silently ignores failures (notifications are best-effort).
 */
export async function notifyMember(supabase, memberId, type, title, message = '') {
  if (!memberId) return

  // Find the profile linked to this member
  const { data: prof } = await supabase
    .from('profiles')
    .select('id')
    .eq('member_id', memberId)
    .maybeSingle()

  if (!prof?.id) return  // No linked profile yet — skip

  await supabase.from('notifications').insert({
    profile_id: prof.id,
    type,
    title,
    message,
  })
}

/**
 * Broadcast a notification to all active member profiles.
 */
export async function broadcastToMembers(supabase, type, title, message = '') {
  // Get all profiles with a member_id (i.e., member accounts)
  const { data: profs } = await supabase
    .from('profiles')
    .select('id')
    .not('member_id', 'is', null)

  if (!profs?.length) return

  const rows = profs.map(p => ({ profile_id: p.id, type, title, message }))
  await supabase.from('notifications').insert(rows)
}
