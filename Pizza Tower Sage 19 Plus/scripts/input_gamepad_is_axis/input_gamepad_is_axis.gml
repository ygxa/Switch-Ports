function input_gamepad_is_axis(argument0, argument1)
{
    static _global = __input_global();
    
    if (argument0 == undefined || argument0 < 0 || argument0 >= array_length(_global.__gamepads))
        return false;
    
    var _gamepad = _global.__gamepads[argument0];
    
    if (!is_struct(_gamepad))
        return false;
    
    return _gamepad.__is_axis(argument1);
}
