function input_cursor_elastic_get(argument0 = 0)
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
    
    with (_global.__players[argument0].__cursor)
    {
        return 
        {
            x: __elastic_x,
            y: __elastic_y,
            strength: __elastic_strength
        };
    }
}
