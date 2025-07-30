function input_cursor_inverted_set(argument0, argument1 = 0)
{
    static _global = __input_global();
    
    if (argument1 == -3)
    {
        var _p = 0;
        
        repeat (1)
        {
            input_cursor_inverted_set(argument0, _p);
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
    
    _global.__players[argument1].__cursor_inverted = argument0;
}
