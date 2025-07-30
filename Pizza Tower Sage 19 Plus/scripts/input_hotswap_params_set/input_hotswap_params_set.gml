function input_hotswap_params_set(argument0)
{
    static _global = __input_global();
    
    if (!is_method(argument0) && !(is_numeric(argument0) && script_exists(argument0)) && !is_undefined(argument0))
        __input_error("Hotswap callback must be a function, a _script, or <undefined>");
    
    _global.__hotswap_callback = argument0;
}
