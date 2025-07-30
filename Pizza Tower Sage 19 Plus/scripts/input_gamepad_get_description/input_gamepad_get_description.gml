function input_gamepad_get_description(argument0)
{
    static _global = __input_global();
    
    if (argument0 == undefined || argument0 < 0 || argument0 >= array_length(_global.__gamepads))
        return "Unknown";
    
    var _gamepad = _global.__gamepads[argument0];
    
    if (!is_struct(_gamepad))
        return "Unknown";
    
    return _gamepad.__description;
}
