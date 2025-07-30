function input_mouse_dx(argument0 = undefined)
{
    static _global = __input_global();
    
    return _global.__pointer_dx[argument0 ?? _global.__pointer_coord_space];
}
