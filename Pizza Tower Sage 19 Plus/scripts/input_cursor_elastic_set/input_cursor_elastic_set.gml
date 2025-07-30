function input_cursor_elastic_set(argument0, argument1, argument2, argument3 = 0, argument4 = true)
{
    static _global = __input_global();
    
    if (argument3 == -3)
    {
        var _p = 0;
        
        repeat (1)
        {
            input_cursor_elastic_set(argument0, argument1, argument2, _p, argument4);
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
        if (argument4 && __elastic_x != undefined && __elastic_y != undefined)
            __set(argument0 - __elastic_x, argument1 - __elastic_y, true);
        
        __elastic_x = argument0;
        __elastic_y = argument1;
        __elastic_strength = argument2;
    }
}
