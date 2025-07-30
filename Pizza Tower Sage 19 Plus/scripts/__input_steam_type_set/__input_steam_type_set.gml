function __input_steam_type_set(argument0, argument1, argument2)
{
    static _global = __input_global();
    
    variable_struct_set(_global.__steam_type_to_raw, _string(argument0), argument1);
    variable_struct_set(_global.__steam_type_to_name, _string(argument0), argument2);
}
