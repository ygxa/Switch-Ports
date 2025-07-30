function input_mouse_x(argument0 = undefined)
{
    static _global = __input_global();
    
    return _global.__pointer_x[argument0 ?? _global.__pointer_coord_space];
}
