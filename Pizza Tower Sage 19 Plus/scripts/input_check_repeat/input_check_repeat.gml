function input_check_repeat(argument0, argument1 = 0, argument2 = 10, argument3 = 30)
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
    
    var _verb_struct = variable_struct_get(_global.__players[argument1].__verb_state_dict, argument0);
    
    if (!is_struct(_verb_struct))
    {
        __input_error("Verb not recognised (", argument0, ")");
        return undefined;
    }
    
    if (_global.__cleared || _verb_struct.__inactive || !_verb_struct.__held)
        return false;
    
    var _time = __input_get_time() - _verb_struct.__press_time - argument3;
    
    if (_time < 0)
        return false;
    
    var _prev_time = __input_get_previous_time() - _verb_struct.__press_time - argument3;
    return floor(_time / argument2) > floor(_prev_time / argument2);
}
