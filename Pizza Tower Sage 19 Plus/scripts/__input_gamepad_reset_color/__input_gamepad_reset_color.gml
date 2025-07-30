function __input_gamepad_reset_color(argument0)
{
    static _global = __input_global();
    
    if (argument0 < 0)
        exit;
    
    with (_global.__gamepads[argument0])
        __color_set(undefined);
}
