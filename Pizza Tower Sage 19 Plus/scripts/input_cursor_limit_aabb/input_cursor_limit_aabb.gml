function input_cursor_limit_aabb(argument0, argument1, argument2, argument3, argument4 = 0)
{
    static _global = __input_global();
    
    if (argument4 == -3)
    {
        var _p = 0;
        
        repeat (1)
        {
            input_cursor_limit_aabb(argument0, argument1, argument2, argument3, _p);
            _p++;
        }
        
        exit;
    }
    
    if (argument4 < 0)
    {
        __input_error("Invalid player index provided (", argument4, ")");
        return undefined;
    }
    
    if (argument4 >= 1)
    {
        __input_error("Player index too large (", argument4, " must be less than ", 1, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    with (_global.__players[argument4].__cursor)
    {
        __limit_l = argument0;
        __limit_t = argument1;
        __limit_r = argument2;
        __limit_b = argument3;
        __limit_x = undefined;
        __limit_y = undefined;
        __limit_radius = undefined;
        __limit_boundary_margin = undefined;
        __limit();
    }
}
