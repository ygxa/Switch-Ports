function input_ignore_key_add(argument0)
{
    static _global = __input_global();
    
    if (is_string(argument0))
        argument0 = ord(string_upper(argument0));
    
    if (argument0 == 1)
        __input_error("Cannot ignore vk_anykey (=", 1, ")");
    
    if (!variable_struct_exists(_global.__ignore_key_dict, argument0))
        variable_struct_set(_global.__ignore_key_dict, argument0, true);
    else
        __input_trace("Could not ignore keycode ", argument0, ", it is already ignored");
}
