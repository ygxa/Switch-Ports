function input_mouse_dy(argument0 = undefined)
{
    static _global = __input_global();
    
    return _global.__pointer_dy[argument0 ?? _global.__pointer_coord_space];
}
