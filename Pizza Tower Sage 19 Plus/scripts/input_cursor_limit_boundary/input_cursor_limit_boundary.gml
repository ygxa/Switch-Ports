function input_cursor_limit_boundary(argument0 = 0, argument1 = 0)
{
    static _global = __input_global();
    
    if (argument1 == -3)
    {
        var _p = 0;
        
        repeat (1)
        {
            input_cursor_limit_boundary(_p);
            _p++;
        }
        
        exit;
    }
    
    if (argument1 < 0)
    {
        __input_error("Invalid player index provided (", argument1, ")");
        return undefined;
    }
    
    if (argument1 >= 1)
    {
        __input_error("Player index too large (", argument1, " must be less than ", 1, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    with (_global.__players[argument1].__cursor)
    {
        __limit_l = undefined;
        __limit_t = undefined;
        __limit_r = undefined;
        __limit_b = undefined;
        __limit_x = undefined;
        __limit_y = undefined;
        __limit_radius = undefined;
        __limit_boundary_margin = argument0;
        __limit();
    }
}
