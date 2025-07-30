function input_check_double_pressed(argument0, argument1 = 0, argument2 = 0)
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
    
    if (is_array(argument0))
    {
        var _i = 0;
        
        repeat (array_length(argument0))
        {
            if (input_check_double_pressed(argument0[_i], argument1, argument2))
                return true;
            
            _i++;
        }
        
        return false;
    }
    
    var _verb_struct = variable_struct_get(_global.__players[argument1].__verb_state_dict, argument0);
    
    if (!is_struct(_verb_struct))
    {
        __input_error("Verb not recognised (", argument0, ")");
        return undefined;
    }
    
    if (_verb_struct.__inactive)
        return false;
    
    if (argument2 <= 0)
        return _global.__cleared ? false : _verb_struct.__double_press;
    else
        return _verb_struct.__double_press_time >= 0 && (__input_get_time() - _verb_struct.__double_press_time) <= argument2;
}
