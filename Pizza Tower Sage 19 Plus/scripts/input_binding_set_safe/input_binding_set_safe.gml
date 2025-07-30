function input_binding_set_safe(argument0, argument1, argument2 = 0, argument3 = 0, argument4 = undefined)
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
    
    if (argument3 < 0)
    {
        __input_error("Invalid \"alternate\" argument (", argument3, ")");
        return undefined;
    }
    
    if (argument3 >= 2)
    {
        __input_error("\"alternate\" argument too large (", argument3, " must be less than ", 2, ")\nIncrease INPUT_MAX_ALTERNATE_BINDINGS for more alternate binding slots");
        return undefined;
    }
    
    if (input_value_is_binding(argument1))
    {
        var _collisions = input_binding_test_collisions(argument0, argument1, argument2, argument4);
        
        if (array_length(_collisions) == 0)
        {
            input_binding_set(argument0, argument1, argument2, argument3, argument4);
        }
        else
        {
            if (array_length(_collisions) > 1)
                __input_trace("Warning! More than one binding collision found, resolution may not be desirable");
            
            argument4 = _global.__players[argument2].__profile_get(argument4);
            
            if (argument4 == undefined)
            {
                __input_trace("Warning! Cannot set binding, profile was <undefined>");
                return false;
            }
            
            var _verb_b = _collisions[0].__verb;
            var _alternate_b = _collisions[0].__alternate;
            
            if (argument0 != _verb_b || argument3 != _alternate_b)
            {
                __input_trace("Collision found in profile=", argument4, ", verb=", _verb_b, ", alternate=", _alternate_b);
                input_binding_swap(argument0, argument3, _verb_b, _alternate_b, argument2, argument4);
                input_binding_set(argument0, argument1, argument2, argument3, argument4);
            }
            else
            {
                __input_trace("New binding (", input_binding_get_name(argument1), ") is the same as existing binding for profile=", argument4, ", verb=", argument0, ", alternate=", argument3);
            }
        }
        
        return true;
    }
    else
    {
        __input_trace("Warning! Value isn't a binding, ignoring");
        return false;
    }
}
