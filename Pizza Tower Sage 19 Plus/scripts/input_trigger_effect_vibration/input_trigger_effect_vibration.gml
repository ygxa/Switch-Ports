function input_trigger_effect_vibration(argument0, argument1, argument2, argument3, argument4 = 0)
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
    
    _global.__players[argument4].__trigger_effect_set(argument0, new __input_class_trigger_effect_vibration(argument1, argument2, argument3), true);
}
