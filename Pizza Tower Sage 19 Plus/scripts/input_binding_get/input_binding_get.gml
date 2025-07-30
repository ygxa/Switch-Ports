function input_binding_get(argument0, argument1 = 0, argument2 = 0, argument3 = undefined)
{
    static _global = __input_global();
    
    if (argument2 < 0)
    {
        __input_error("Invalid \"alternate\" argument (", argument2, ")");
        return undefined;
    }
    
    if (argument2 >= 2)
    {
        __input_error("\"alternate\" argument too large (", argument2, " must be less than ", 2, ")\nIncrease INPUT_MAX_ALTERNATE_BINDINGS for more alternate binding slots");
        return undefined;
    }
    
    if (variable_struct_exists(_global.__chord_verb_dict, argument0))
        __input_error("\"", argument0, "\" is a chord verb. Verbs passed to this function must be basic verb");
    
    if (variable_struct_exists(_global.__combo_verb_dict, argument0))
        __input_error("\"", argument0, "\" is a combo verb. Verbs passed to this function must be basic verb");
    
    if (!variable_struct_exists(_global.__basic_verb_dict, argument0))
        __input_error("Verb \"", argument0, "\" not recognised");
    
    if (!input_profile_exists(argument3, argument1))
        __input_error("Profile name \"", argument3, "\" doesn't exist");
    
    if (is_string(argument1))
    {
        if (argument1 == "default")
        {
            if (argument3 == undefined)
                __input_error("Source must be specified when getting a binding from the default player");
            
            with (_global.__default_player)
                return __binding_get(argument3, argument0, argument2, false).__duplicate();
        }
        else
        {
            __input_error("Player \"", argument1, "\" not supported");
        }
    }
    
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
    
    with (_global.__players[argument1])
        return __binding_get(argument3, argument0, argument2, true);
    
    return undefined;
}
