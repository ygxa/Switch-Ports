function input_trigger_effect_feedback(argument0, argument1, argument2, argument3 = 0)
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
    
    _global.__players[argument3].__trigger_effect_set(argument0, new __input_class_trigger_effect_feedback(argument1, argument2), true);
}
