function input_binding_scan_params_get(argument0 = 0)
{
    static _global = __input_global();
    
    if (argument0 < 0)
    {
        __input_error("Invalid player index provided (", argument0, ")");
        return undefined;
    }
    
    if (argument0 >= 1)
    {
        __input_error("Player index too large (", argument0, " must be less than ", 1, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    with (_global.__players[argument0])
    {
        return 
        {
            __ignore_array: is_struct(__rebind_ignore_struct) ? variable_struct_get_names(__rebind_ignore_struct) : undefined,
            __allow_array: is_struct(__rebind_allow_struct) ? variable_struct_get_names(__rebind_allow_struct) : undefined,
            __source_filter: __rebind_source_filter
        };
    }
}
