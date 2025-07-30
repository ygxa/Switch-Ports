function input_mouse_y(argument0 = undefined)
{
    static _global = __input_global();
    
    return _global.__pointer_y[argument0 ?? _global.__pointer_coord_space];
}
