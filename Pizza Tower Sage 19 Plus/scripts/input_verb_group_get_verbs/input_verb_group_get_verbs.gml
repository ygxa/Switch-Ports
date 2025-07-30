function input_verb_group_get_verbs(argument0)
{
    static _global = __input_global();
    
    if (!variable_struct_exists(_global.__group_to_verbs_dict, argument0))
        __input_error("Verb group \"", argument0, "\" doesn't exist\nPlease make sure it has been defined in __input_config_verbs()");
    
    return variable_struct_get(_global.__group_to_verbs_dict, argument0);
}
