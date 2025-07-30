function input_binding_get_source_type(argument0)
{
    if (!input_value_is_binding(argument0))
        return undefined;
    
    return argument0.__source_type_get(argument0);
}
