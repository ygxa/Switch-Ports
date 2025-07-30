function input_accessibility_verb_toggle_set(argument0, argument1)
{
    static _global = __input_global();
    
    if (is_array(argument0))
    {
        var _i = 0;
        
        repeat (array_length(argument0))
        {
            input_accessibility_verb_toggle_set(argument0[_i], argument1);
            _i++;
        }
        
        exit;
    }
    
    if (variable_struct_exists(_global.__chord_verb_dict, argument0))
        __input_error("\"", argument0, "\" is a chord verb. Verbs passed to this function must be basic verb");
    
    if (variable_struct_exists(_global.__combo_verb_dict, argument0))
        __input_error("\"", argument0, "\" is a combo verb. Verbs passed to this function must be basic verb");
    
    if (!variable_struct_exists(_global.__basic_verb_dict, argument0))
        __input_error("Verb \"", argument0, "\" not recognised");
    
    if (argument1)
        variable_struct_set(_global.__toggle_momentary_dict, argument0, true);
    else
        variable_struct_remove(_global.__toggle_momentary_dict, argument0);
}
