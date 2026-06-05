import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

function ok(body: unknown) {
  return new Response(JSON.stringify(body), {
    status: 200,
    headers: { ...corsHeaders, 'Content-Type': 'application/json' },
  })
}

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    const authHeader = req.headers.get('Authorization')
    if (!authHeader) return ok({ error: 'Missing authorization header' })

    // Admin client — service role key bypasses RLS
    const supabaseAdmin = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
    )

    // Verify calling user's session
    const supabaseUser = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      { global: { headers: { Authorization: authHeader } } },
    )
    const { data: { user: caller }, error: authErr } = await supabaseUser.auth.getUser()
    if (authErr || !caller) return ok({ error: `Invalid session: ${authErr?.message ?? 'no user'}` })

    // Check caller is admin or owner
    const { data: callerProfile, error: profileFetchErr } = await supabaseAdmin
      .from('profiles')
      .select('role')
      .eq('id', caller.id)
      .single()

    if (profileFetchErr) return ok({ error: `Could not fetch caller profile: ${profileFetchErr.message}` })
    if (!callerProfile || !['admin', 'owner'].includes(callerProfile.role)) {
      return ok({ error: 'Only admins and owners can create accounts' })
    }

    // Parse body
    const { email, password, role, member_id } = await req.json()
    if (!email || !password || !role) return ok({ error: 'email, password, and role are required' })

    // Create auth user
    const { data: newUser, error: createError } = await supabaseAdmin.auth.admin.createUser({
      email,
      password,
      email_confirm: true,
    })
    if (createError) return ok({ error: `Create user failed: ${createError.message}` })

    // The on_auth_user_created trigger already inserted a profile row.
    // Update it with the correct role, first_login flag, email, and optional member_id.
    const updatePayload: Record<string, unknown> = { role, first_login: true, email }
    if (member_id) updatePayload.member_id = member_id

    const { error: profileError } = await supabaseAdmin
      .from('profiles')
      .update(updatePayload)
      .eq('id', newUser.user.id)

    if (profileError) {
      await supabaseAdmin.auth.admin.deleteUser(newUser.user.id)
      return ok({ error: `Profile update failed: ${profileError.message}` })
    }

    return ok({ user: { id: newUser.user.id, email: newUser.user.email } })

  } catch (err) {
    return ok({ error: `Unexpected error: ${String(err)}` })
  }
})
