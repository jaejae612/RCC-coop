import { useEffect, useState } from 'react'
import { supabase } from '../../lib/supabase'
import { broadcastToMembers, notifyMember } from '../../lib/notify'

const timeAgo = ts => {
  const diff = Math.floor((Date.now() - new Date(ts)) / 1000)
  if (diff < 60)    return 'just now'
  if (diff < 3600)  return `${Math.floor(diff / 60)}m ago`
  if (diff < 86400) return `${Math.floor(diff / 3600)}h ago`
  return `${Math.floor(diff / 86400)}d ago`
}

const TYPE_LABELS = {
  loan_approved:   'Loan Approved',
  loan_released:   'Loan Released',
  loan_rejected:   'Loan Rejected',
  payment_received:'Payment Received',
  announcement:    'Announcement',
  general:         'General',
}

const TYPE_COLORS = {
  loan_approved:    'bg-green-100 text-green-700',
  loan_released:    'bg-blue-100  text-blue-700',
  loan_rejected:    'bg-red-100   text-red-700',
  payment_received: 'bg-teal-100  text-teal-700',
  announcement:     'bg-yellow-100 text-yellow-700',
  general:          'bg-gray-100  text-gray-600',
}

export default function NotificationsPage() {
  const [notifications, setNotifications] = useState([])
  const [members,       setMembers]       = useState([])
  const [loading,       setLoading]       = useState(true)
  const [sending,       setSending]       = useState(false)

  // Compose form state
  const [mode,      setMode]      = useState('all')     // 'all' | 'single'
  const [memberId,  setMemberId]  = useState('')
  const [title,     setTitle]     = useState('')
  const [message,   setMessage]   = useState('')

  useEffect(() => {
    Promise.all([fetchNotifications(), fetchMembers()])
  }, [])

  async function fetchNotifications() {
    setLoading(true)
    const { data } = await supabase
      .from('notifications')
      .select('*, profiles(display_name, member_id, members(full_name))')
      .order('created_at', { ascending: false })
      .limit(100)
    setNotifications(data ?? [])
    setLoading(false)
  }

  async function fetchMembers() {
    const { data } = await supabase
      .from('members')
      .select('id, full_name')
      .eq('status', 'active')
      .order('full_name')
    setMembers(data ?? [])
  }

  async function handleSend(e) {
    e.preventDefault()
    if (!title.trim()) return
    setSending(true)

    if (mode === 'all') {
      await broadcastToMembers(supabase, 'announcement', title.trim(), message.trim())
    } else {
      if (!memberId) { setSending(false); return }
      await notifyMember(supabase, memberId, 'announcement', title.trim(), message.trim())
    }

    setTitle('')
    setMessage('')
    setMemberId('')
    setSending(false)
    await fetchNotifications()
  }

  async function deleteNotification(id) {
    await supabase.from('notifications').delete().eq('id', id)
    setNotifications(prev => prev.filter(n => n.id !== id))
  }

  const unreadCount = notifications.filter(n => !n.is_read).length

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-xl font-bold text-gray-800">Notifications</h1>
        <p className="text-sm text-gray-500">
          Send announcements and view notification history
        </p>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">

        {/* ── Compose panel ───────────────────────────────────── */}
        <div className="lg:col-span-1">
          <div className="bg-white rounded-xl shadow p-5">
            <h2 className="font-semibold text-gray-800 mb-4">Send Notification</h2>
            <form onSubmit={handleSend} className="space-y-3">

              {/* Target */}
              <div>
                <label className="text-xs font-medium text-gray-500 block mb-1">Send to</label>
                <div className="flex gap-2">
                  <button
                    type="button"
                    onClick={() => setMode('all')}
                    className={`flex-1 text-sm py-1.5 rounded border font-medium transition-colors ${
                      mode === 'all'
                        ? 'bg-blue-600 text-white border-blue-600'
                        : 'border-gray-200 text-gray-600 hover:bg-gray-50'
                    }`}
                  >
                    All Members
                  </button>
                  <button
                    type="button"
                    onClick={() => setMode('single')}
                    className={`flex-1 text-sm py-1.5 rounded border font-medium transition-colors ${
                      mode === 'single'
                        ? 'bg-blue-600 text-white border-blue-600'
                        : 'border-gray-200 text-gray-600 hover:bg-gray-50'
                    }`}
                  >
                    One Member
                  </button>
                </div>
              </div>

              {/* Member selector */}
              {mode === 'single' && (
                <div>
                  <label className="text-xs font-medium text-gray-500 block mb-1">Member</label>
                  <select
                    value={memberId}
                    onChange={e => setMemberId(e.target.value)}
                    required
                    className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
                  >
                    <option value="">Select member...</option>
                    {members.map(m => (
                      <option key={m.id} value={m.id}>{m.full_name}</option>
                    ))}
                  </select>
                </div>
              )}

              {/* Title */}
              <div>
                <label className="text-xs font-medium text-gray-500 block mb-1">Title</label>
                <input
                  type="text"
                  value={title}
                  onChange={e => setTitle(e.target.value)}
                  required
                  placeholder="e.g. Office Closure Notice"
                  className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
                />
              </div>

              {/* Message */}
              <div>
                <label className="text-xs font-medium text-gray-500 block mb-1">Message (optional)</label>
                <textarea
                  value={message}
                  onChange={e => setMessage(e.target.value)}
                  rows={3}
                  placeholder="Additional details..."
                  className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 resize-none"
                />
              </div>

              <button
                type="submit"
                disabled={sending || !title.trim()}
                className="w-full bg-blue-600 hover:bg-blue-700 text-white text-sm font-medium py-2 rounded-lg disabled:opacity-50"
              >
                {sending ? 'Sending...' : mode === 'all' ? 'Broadcast to All Members' : 'Send to Member'}
              </button>
            </form>
          </div>

          {/* Stats card */}
          <div className="bg-white rounded-xl shadow p-5 mt-4">
            <p className="text-xs text-gray-500 mb-1">Total in log</p>
            <p className="text-2xl font-bold text-gray-800">{notifications.length}</p>
            <p className="text-xs text-gray-400 mt-1">{unreadCount} unread by recipients</p>
          </div>
        </div>

        {/* ── Notification log ─────────────────────────────────── */}
        <div className="lg:col-span-2">
          <div className="bg-white rounded-xl shadow overflow-hidden">
            <div className="px-5 py-4 border-b border-gray-100 flex items-center justify-between">
              <h2 className="font-semibold text-gray-800">Notification Log</h2>
              <span className="text-xs text-gray-400">{notifications.length} total</span>
            </div>

            {loading ? (
              <p className="text-sm text-gray-400 text-center py-10">Loading...</p>
            ) : notifications.length === 0 ? (
              <p className="text-sm text-gray-400 text-center py-10">No notifications sent yet.</p>
            ) : (
              <div className="divide-y divide-gray-50 max-h-[600px] overflow-y-auto">
                {notifications.map(n => {
                  const recipientName =
                    n.profiles?.members?.full_name ??
                    n.profiles?.display_name ??
                    'Unknown'
                  return (
                    <div key={n.id} className="px-5 py-3 hover:bg-gray-50 flex items-start gap-3">
                      <div className="flex-1 min-w-0">
                        <div className="flex items-center gap-2 flex-wrap mb-0.5">
                          <span className={`text-xs font-medium px-2 py-0.5 rounded-full ${TYPE_COLORS[n.type] ?? TYPE_COLORS.general}`}>
                            {TYPE_LABELS[n.type] ?? n.type}
                          </span>
                          <span className="text-xs text-gray-500 truncate">→ {recipientName}</span>
                          {!n.is_read && (
                            <span className="w-2 h-2 bg-blue-500 rounded-full flex-shrink-0" title="Unread" />
                          )}
                        </div>
                        <p className="text-sm font-medium text-gray-800">{n.title}</p>
                        {n.message && (
                          <p className="text-xs text-gray-500 mt-0.5 line-clamp-2">{n.message}</p>
                        )}
                        <p className="text-[10px] text-gray-400 mt-1">{timeAgo(n.created_at)}</p>
                      </div>
                      <button
                        onClick={() => deleteNotification(n.id)}
                        className="text-gray-300 hover:text-red-400 text-xs flex-shrink-0 mt-0.5"
                        title="Delete"
                      >
                        ✕
                      </button>
                    </div>
                  )
                })}
              </div>
            )}
          </div>
        </div>

      </div>
    </div>
  )
}
