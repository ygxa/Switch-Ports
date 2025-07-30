function input_binding_scan_abort(argument0 = 0)
{
    static _global = __input_global();
    
    if (argument0 == -3)
    {
        var _p = 0;
        
        repeat (1)
        {
            input_binding_scan_abort(_p);
            _p++;
        }
        
        exit;
    }
    
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
        if (__rebind_state > 0)
            __binding_scan_failure((-30 << 0));
    }
}
