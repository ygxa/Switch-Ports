function input_vibrate_curve(argument0, argument1, argument2, argument3, argument4 = 0, argument5 = false)
{
    static _global = __input_global();
    
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
    
    argument0 = clamp(argument0, 0, 1);
    
    if (!animcurve_exists(argument1))
        __input_error("Animation curve doesn't exist (", argument1, ")");
    
    argument2 = clamp(argument2, -1, 1);
    argument3 = max(argument3, 0);
    _global.__players[argument4].__vibration_add_event(new __input_class_vibration_curve(argument0, animcurve_get(argument1), argument2, argument3, argument5));
}
