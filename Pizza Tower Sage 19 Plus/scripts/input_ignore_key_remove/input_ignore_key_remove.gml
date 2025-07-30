function input_ignore_key_remove(argument0)
{
    static _global = __input_global();
    
    if (is_string(argument0))
        argument0 = ord(string_upper(argument0));
    
    if (variable_struct_exists(_global.__ignore_key_dict, argument0))
        variable_struct_remove(_global.__ignore_key_dict, argument0);
    else
        __input_trace("Could not un-ignore keycode ", argument0, ", it is already permitted");
}
