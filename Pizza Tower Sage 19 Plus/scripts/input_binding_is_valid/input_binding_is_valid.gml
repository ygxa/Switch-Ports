function input_binding_is_valid(argument0, argument1 = 0)
{
    static _global = __input_global();
    
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
    
    if (argument0 == undefined)
    {
        return false;
    }
    else if (!input_value_is_binding(argument0))
    {
        __input_error("Value provided is not a binding");
        return false;
    }
    
    with (_global.__players[argument1])
        return __sources_validate_binding(argument0);
}
