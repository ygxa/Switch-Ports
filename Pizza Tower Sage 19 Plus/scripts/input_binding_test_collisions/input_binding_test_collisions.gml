function input_binding_test_collisions(argument0, argument1, argument2 = 0, argument3 = undefined)
{
    static _global = __input_global();
    
    if (variable_struct_exists(_global.__chord_verb_dict, argument0))
        __input_error("\"", argument0, "\" is a chord verb. Verbs passed to this function must be basic verb");
    
    if (variable_struct_exists(_global.__combo_verb_dict, argument0))
        __input_error("\"", argument0, "\" is a combo verb. Verbs passed to this function must be basic verb");
    
    if (!variable_struct_exists(_global.__basic_verb_dict, argument0))
        __input_error("Verb \"", argument0, "\" not recognised");
    
    if (argument2 < 0)
    {
        __input_error("Invalid player index provided (", argument2, ")");
        return undefined;
    }
    
    if (argument2 >= 1)
    {
        __input_error("Player index too large (", argument2, " must be less than ", 1, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    if (!input_profile_exists(argument3, argument2))
        __input_error("Profile name \"", argument3, "\" doesn't exist");
    
    if (!input_value_is_binding(argument1))
    {
        __input_error("Value provided is not a binding");
        return undefined;
    }
    
    var _src_group = input_verb_get_group(argument0);
    var _output_array = [];
    
    with (_global.__players[argument2])
    {
        argument3 = __profile_get(argument3);
        
        if (argument3 == undefined)
        {
            __input_trace("Warning! Cannot test binding collisions, profile was <undefined>");
            return _output_array;
        }
        
        var _v = 0;
        
        repeat (array_length(_global.__basic_verb_array))
        {
            var _verb = _global.__basic_verb_array[_v];
            var _group_matches = false;
            
            if (_src_group == undefined)
            {
                _group_matches = true;
            }
            else
            {
                var _dst_group = input_verb_get_group(_verb);
                
                if (_dst_group == undefined)
                    _group_matches = true;
                else
                    _group_matches = _src_group == _dst_group;
            }
            
            if (_group_matches)
            {
                var _alternate_index = 0;
                
                repeat (2)
                {
                    var _extant_binding = __binding_get(argument3, _verb, _alternate_index, false);
                    
                    if (is_struct(_extant_binding))
                    {
                        if (_extant_binding.__label == argument1.__label && (_global.__source_mode != (4 << 0) || _extant_binding.__gamepad_index == argument1.__gamepad_index || _extant_binding.__gamepad_index == undefined || argument1.__gamepad_index == undefined))
                        {
                            array_push(_output_array, 
                            {
                                __verb: _verb,
                                __alternate: _alternate_index
                            });
                        }
                    }
                    
                    _alternate_index++;
                }
            }
            
            _v++;
        }
    }
    
    return _output_array;
}
