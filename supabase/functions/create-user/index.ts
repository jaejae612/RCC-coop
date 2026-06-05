import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

Deno.serve(async (req) => {
  // Handle CORS preflight
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    const authHeader = req.headers.get('Authorization')
    if (!authHeader) {
      return new Response(JSON.stringify({ error: 'Missing authorization header' }), {
        status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      })
    }

    // Admin client — uses service role key (available automatically in Edge Functions)
    const supabaseAdmin = createClient(
      Deno.env.get('SUPABASE_URL')!,
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!,
    )

    // Verify the calling user exists and has admin or owner role
    const supabaseUser = createClient(
      Deno.env.get('SUPABASE_URL')!,
      Deno.env.get('SUPABASE_ANON_KEY')!,
      { global: { headers: { Authorization: authHeader } } },
    )
    const { data: { user: caller } } = await supabaseUser.auth.getUser()
    if (!caller) {
      return new Response(JSON.stringify({ error: 'Invalid session' }), {
        status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      })
    }

    const { data: callerProfile } = await supabaseAdmin
      .from('profiles')
      .select('role')
      .eq('id', caller.id)
      .single()

    if (!callerProfile || !['admin', 'owner'].includes(callerProfile.role)) {
      return new Response(JSON.stringify({ error: 'Only admins and owners can create accounts' }), {
        status: 403, headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      })
    }

    // Parse request body
    const { email, password, role, member_id } = await req.json()

    if (!email || !password || !role) {
      return new Response(JSON.stringify({ error: 'email, password, and role are required' }), {
        status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      })
    }

    // Create the auth user (email_confirm: true skips email verification)
    const { data: newUser, error: createError } = await supabaseAdmin.auth.admin.createUser({
      email,
      password,
      email_confirm: true,
    })

    if (createError) {
      return new Response(JSON.stringify({ error: createError.message }), {
        status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      })
    }

    // The on_auth_user_created trigger already inserted a profile row.
    // Update it with the correct role, first_login flag, and optional member_id.
    const updatePayload: Record<string, unknown> = { role, first_login: true }
    if (member_id) updatePayload.member_id = member_id

    const { error: profileError } = await supabaseAdmin
      .from('profiles')
      .update(updatePayload)
      .eq('id', newUser.user.id)

    if (profileError) {
      // Roll back — delete the auth user so we don't leave orphaned accounts
      await supabaseAdmin.auth.admin.deleteUser(newUser.user.id)
      return new Response(JSON.stringify({ error: profileError.message }), {
        status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      })
    }

    return new Response(
      JSON.stringify({ user: { id: newUser.user.id, email: newUser.user.email } }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } },
    )
  } catch (err) {
    return new Response(JSON.stringify({ error: String(err) }), {
      status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' },
    })
  }
})
