function input_gamepad_check_released(argument0, argument1)
{
    static _global = __input_global();
    
    if (!_global.__game_input_allowed || !_global.__gamepad_allowed || _global.__cleared || argument0 == undefined || argument0 < 0 || argument0 >= array_length(_global.__gamepads))
        return false;
    
    var _gamepad = _global.__gamepads[argument0];
    
    if (!is_struct(_gamepad))
        return false;
    
    return _gamepad.__get_released(argument1);
}
