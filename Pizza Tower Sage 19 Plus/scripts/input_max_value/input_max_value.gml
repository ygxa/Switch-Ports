function input_max_value(argument0, argument1 = 0)
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
        var _sum = 0;
        var _i = 0;
        
        repeat (array_length(argument0))
        {
            _sum += input_max_value(argument0[_i], argument1);
            _i++;
        }
        
        return _sum;
    }
    
    var _verb_struct = variable_struct_get(_global.__players[argument1].__verb_state_dict, argument0);
    
    if (!is_struct(_verb_struct))
    {
        __input_error("Verb not recognised (", argument0, ")");
        return undefined;
    }
    
    if (_verb_struct.__inactive)
        return false;
    
    return _verb_struct.__max_value;
}
