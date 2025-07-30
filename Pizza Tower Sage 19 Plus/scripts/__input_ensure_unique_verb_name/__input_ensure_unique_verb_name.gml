function __input_ensure_unique_verb_name(argument0)
{
    static _global = __input_global();
    
    if (variable_struct_exists(_global.__basic_verb_dict, argument0))
    {
        __input_error("A basic verb named \"", argument0, "\" already exists");
        exit;
    }
    
    if (variable_struct_exists(_global.__chord_verb_dict, argument0))
    {
        __input_error("A chord named \"", argument0, "\" already exists");
        exit;
    }
    
    if (variable_struct_exists(_global.__combo_verb_dict, argument0))
    {
        __input_error("A combo named \"", argument0, "\" already exists");
        exit;
    }
}
