function input_held_time(argument0, argument1 = 0)
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
    
    if (_verb_struct.__inactive || !_verb_struct.__held)
        return -1;
    
    return __input_get_time() - _verb_struct.__press_time;
}
