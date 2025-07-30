function input_keyboard_check_released(argument0)
{
    static _global = __input_global();
    
    if (!_global.__keyboard_allowed || _global.__cleared)
        return false;
    
    return keyboard_check_released(argument0);
}
