function input_verb_group_active(argument0, argument1, argument2 = 0, argument3 = false)
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
    
    if (!variable_struct_exists(_global.__group_to_verbs_dict, argument0))
        __input_error("Verb group \"", argument0, "\" doesn't exist\nPlease make sure it has been defined in __input_config_verbs()");
    
    _global.__players[argument2].__verb_group_active(argument0, argument1, argument3);
}
