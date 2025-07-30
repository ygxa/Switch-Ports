function input_check_press_most_recent(argument0 = -3, argument1 = 0)
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
    
    var _verbs_struct = _global.__players[argument1].__verb_state_dict;
    
    if (!is_array(argument0))
        argument0 = _global.__basic_verb_array;
    
    var _max_time = -1;
    var _max_verb = undefined;
    var _i = 0;
    
    repeat (array_length(argument0))
    {
        var _verb = argument0[_i];
        var _verb_struct = variable_struct_get(_verbs_struct, _verb);
        
        if (_verb_struct.__press_time > _max_time && input_check(_verb, argument1))
        {
            _max_time = _verb_struct.__press_time;
            _max_verb = _verb;
        }
        
        _i++;
    }
    
    return _max_verb;
}
