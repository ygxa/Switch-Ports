function __input_key_name_set(argument0, argument1)
{
    static _global = __input_global();
    
    variable_struct_set(_global.__key_name_dict, _string(argument0), _string(argument1));
}
