function input_cursor_translate(argument0 = undefined, argument1 = undefined, argument2, argument3 = 0, argument4 = false)
{
    static _global = __input_global();
    
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
    
    return _global.__players[argument3].__cursor.__translate(argument0, argument1, argument2, argument4);
}
