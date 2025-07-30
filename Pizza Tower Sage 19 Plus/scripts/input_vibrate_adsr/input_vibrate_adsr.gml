function input_vibrate_adsr(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7 = 0, argument8 = false)
{
    static _global = __input_global();
    
    if (argument7 < 0)
    {
        __input_error("Invalid player index provided (", argument7, ")");
        return undefined;
    }
    
    if (argument7 >= 1)
    {
        __input_error("Player index too large (", argument7, " must be less than ", 1, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    argument0 = clamp(argument0, 0, 1);
    argument1 = clamp(argument1, 0, 1);
    argument2 = clamp(argument2, -1, 1);
    argument3 = max(argument3, 0);
    argument4 = max(argument4, 0);
    argument5 = max(argument5, 0);
    argument6 = max(argument6, 0);
    _global.__players[argument7].__vibration_add_event(new __input_class_vibration_adsr(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument8));
}
