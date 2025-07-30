function input_binding_get_name(argument0)
{
    if (!input_value_is_binding(argument0))
        return "not a binding";
    
    return argument0.__label;
}
