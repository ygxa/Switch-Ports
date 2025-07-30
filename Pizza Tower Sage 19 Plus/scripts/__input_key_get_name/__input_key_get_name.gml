function __input_key_get_name(argument0)
{
    static _global = __input_global();
    
    if (is_string(argument0))
        argument0 = ord(string_upper(argument0));
    
    var _lookup_name = variable_struct_get(_global.__key_name_dict, argument0);
    
    if (_lookup_name == undefined)
        return chr(argument0);
    else
        return _lookup_name;
}
