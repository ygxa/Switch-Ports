function input_vibrate_constant(argument0, argument1, argument2, argument3 = 0, argument4 = false)
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
    
    argument0 = clamp(argument0, 0, 1);
    argument1 = clamp(argument1, -1, 1);
    argument2 = max(argument2, 0);
    _global.__players[argument3].__vibration_add_event(new __input_class_vibration_constant(argument0, argument1, argument2, argument4));
}
