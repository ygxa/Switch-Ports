function input_binding_get_verbs(argument0, argument1 = 0, argument2 = undefined)
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
    
    if (!input_profile_exists(argument2, argument1))
        __input_error("Profile name \"", argument2, "\" doesn't exist");
    
    if (!input_value_is_binding(argument0))
    {
        __input_error("Value provided is not a binding");
        return undefined;
    }
    
    var _output_array = [];
    
    with (_global.__players[argument1])
    {
        argument2 = __profile_get(argument2);
        
        if (argument2 == undefined)
        {
            __input_trace("Warning! Cannot get verbs from binding, profile was <undefined>");
            return _output_array;
        }
        
        var _v = 0;
        
        repeat (array_length(_global.__basic_verb_array))
        {
            var _verb = _global.__basic_verb_array[_v];
            var _alternate_index = 0;
            
            repeat (2)
            {
                var _extant_binding = __binding_get(argument2, _verb, _alternate_index, false);
                
                if (is_struct(_extant_binding) && _extant_binding.__label == argument0.__label)
                {
                    array_push(_output_array, 
                    {
                        __verb: _verb,
                        __alternate: _alternate_index
                    });
                }
                
                _alternate_index++;
            }
            
            _v++;
        }
    }
    
    return _output_array;
}
