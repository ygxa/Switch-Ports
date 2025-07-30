function __input_gamepad_value_internal(argument0, argument1)
{
    static _global = __input_global();
    
    if (argument0 == undefined || argument0 < 0 || argument0 >= array_length(_global.__gamepads))
        return 0;
    
    var _gamepad = _global.__gamepads[argument0];
    
    if (!is_struct(_gamepad))
        return false;
    
    return _gamepad.__get_value(argument1);
}
