function input_binding_threshold_set(argument0, argument1, argument2)
{
    static _global = __input_global();
    
    if (!input_value_is_binding(argument0))
    {
        __input_error("Parameter is not a binding (typeof=", typeof(argument0), ")");
        exit;
    }
    
    argument0.__threshold_set(argument1, argument2);
}
