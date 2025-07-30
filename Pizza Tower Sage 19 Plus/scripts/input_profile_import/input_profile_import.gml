function input_profile_import(argument0, argument1, argument2 = 0)
{
    static _global = __input_global();
    
    if (argument2 < 0)
    {
        __input_error("Invalid player index provided (", argument2, ")");
        return undefined;
    }
    
    if (argument2 >= 1)
    {
        __input_error("Player index too large (", argument2, " must be less than ", 1, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    return _global.__players[argument2].__profile_import(argument0, argument1);
}
