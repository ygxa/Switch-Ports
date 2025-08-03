try
{
    if (!loggingOut && session == (2 << 0))
    {
        gj_session_close(global.gj_username, global.gj_token);
        openedSession = false;
        session = (0 << 0);
    }
    
    trophiesToSync = [];
    ds_map_destroy(callbacks);
}
catch (e)
{
    //show_debug_message(e);
}

global.gj_initialized = false;
