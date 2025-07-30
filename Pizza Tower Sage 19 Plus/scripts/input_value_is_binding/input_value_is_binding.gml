function input_value_is_binding(argument0)
{
    static _global = __input_global();
    
    if (_global.__use_is_instanceof)
        return is_struct(argument0) && is_instanceof(argument0, __input_class_binding);
    else
        return is_struct(argument0) && instanceof(argument0) == "__input_class_binding";
}
