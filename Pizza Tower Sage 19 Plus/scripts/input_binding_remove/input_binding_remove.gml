function input_binding_remove(argument0, argument1 = 0, argument2 = 0, argument3 = undefined)
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
    
    if (argument2 < 0)
    {
        __input_error("Invalid \"alternate\" argument (", argument2, ")");
        return undefined;
    }
    
    if (argument2 >= 2)
    {
        __input_error("\"alternate\" argument too large (", argument2, " must be less than ", 2, ")\nIncrease INPUT_MAX_ALTERNATE_BINDINGS for more alternate binding slots");
        return undefined;
    }
    
    if (!input_profile_exists(argument3, argument1))
        __input_error("Profile name \"", argument3, "\" doesn't exist");
    
    _global.__players[argument1].__binding_remove(argument3, argument0, argument2);
}
