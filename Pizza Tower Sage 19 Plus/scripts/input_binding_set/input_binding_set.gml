function input_binding_set(argument0, argument1, argument2 = 0, argument3 = 0, argument4 = undefined)
{
    static _global = __input_global();
    
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
    
    if (variable_struct_exists(_global.__chord_verb_dict, argument0))
        __input_error("\"", argument0, "\" is a chord verb. Verbs passed to this function must be basic verb");
    
    if (variable_struct_exists(_global.__combo_verb_dict, argument0))
        __input_error("\"", argument0, "\" is a combo verb. Verbs passed to this function must be basic verb");
    
    if (!variable_struct_exists(_global.__basic_verb_dict, argument0))
        __input_error("Verb \"", argument0, "\" not recognised");
    
    if (!input_profile_exists(argument4, argument2))
        __input_error("Profile name \"", argument4, "\" doesn't exist");
    
    if (!input_value_is_binding(argument1))
    {
        __input_error("Value provided is not a binding");
        return undefined;
    }
    
    _global.__players[argument2].__binding_set(argument4, argument0, argument3, argument1);
    input_verb_consume(-3, argument2);
}
