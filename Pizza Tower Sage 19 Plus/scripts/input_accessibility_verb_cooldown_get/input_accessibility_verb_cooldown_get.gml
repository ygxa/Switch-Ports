function input_accessibility_verb_cooldown_get(argument0)
{
    static _global = __input_global();
    
    if (variable_struct_exists(_global.__chord_verb_dict, argument0))
        __input_error("\"", argument0, "\" is a chord verb. Verbs passed to this function must be basic verb");
    
    if (variable_struct_exists(_global.__combo_verb_dict, argument0))
        __input_error("\"", argument0, "\" is a combo verb. Verbs passed to this function must be basic verb");
    
    if (!variable_struct_exists(_global.__basic_verb_dict, argument0))
        __input_error("Verb \"", argument0, "\" not recognised");
    
    return variable_struct_exists(_global.__cooldown_dict, argument0);
}
