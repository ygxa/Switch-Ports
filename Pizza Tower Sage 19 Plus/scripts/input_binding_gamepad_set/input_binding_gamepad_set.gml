function input_binding_gamepad_set(argument0, argument1)
{
    static _global = __input_global();
    
    if (!input_value_is_binding(argument0))
    {
        __input_error("Parameter is not a binding (typeof=", typeof(argument0), ")");
        exit;
    }
    
    argument0.__gamepad_set(argument1);
}
