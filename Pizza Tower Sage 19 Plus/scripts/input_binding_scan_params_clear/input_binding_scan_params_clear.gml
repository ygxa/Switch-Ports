function input_binding_scan_params_clear(argument0 = 0)
{
    static _global = __input_global();
    
    if (argument0 < 0)
    {
        __input_error("Invalid player index provided (", argument0, ")");
        return undefined;
    }
    
    if (argument0 >= 1)
    {
        __input_error("Player index too large (", argument0, " must be less than ", 1, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    with (_global.__players[argument0])
    {
        __rebind_ignore_struct = undefined;
        __rebind_allow_struct = undefined;
        __rebind_source_filter = undefined;
    }
}
