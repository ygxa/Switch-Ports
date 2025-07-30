function input_cursor_limit_circle(argument0, argument1, argument2, argument3 = 0)
{
    static _global = __input_global();
    
    if (argument3 == -3)
    {
        var _p = 0;
        
        repeat (1)
        {
            input_cursor_limit_circle(argument0, argument1, argument2, _p);
            _p++;
        }
        
        exit;
    }
    
    if (argument3 < 0)
    {
        __input_error("Invalid player index provided (", argument3, ")");
        return undefined;
    }
    
    if (argument3 >= 1)
    {
        __input_error("Player index too large (", argument3, " must be less than ", 1, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    with (_global.__players[argument3].__cursor)
    {
        __limit_l = undefined;
        __limit_t = undefined;
        __limit_r = undefined;
        __limit_b = undefined;
        __limit_x = argument0;
        __limit_y = argument1;
        __limit_radius = argument2;
        __limit_boundary_margin = undefined;
        __limit();
    }
}
