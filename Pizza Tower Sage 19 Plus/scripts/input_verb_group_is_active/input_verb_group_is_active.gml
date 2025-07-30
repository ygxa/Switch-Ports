function input_verb_group_is_active(argument0, argument1 = 0)
{
    static _global = __input_global();
    
    if (!variable_struct_exists(_global.__group_to_verbs_dict, argument0))
        __input_error("Verb group \"", argument0, "\" doesn't exist\nPlease make sure it has been defined in __input_config_verb_groups()");
    
    return _global.__players[argument1].__verb_group_is_active(argument0);
}
