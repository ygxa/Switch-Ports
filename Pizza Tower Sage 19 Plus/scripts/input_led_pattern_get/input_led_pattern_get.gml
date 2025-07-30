function input_led_pattern_get(argument0)
{
    static _global = __input_global();
    static _led_pattern_unknown = 
    {
        __value: 0,
        __pattern: [],
        __layout: "unknown"
    };
    
    if (argument0 == undefined || argument0 < 0 || argument0 >= array_length(_global.__gamepads))
        return _led_pattern_unknown;
    
    var _gamepad = _global.__gamepads[argument0];
    
    if (!is_struct(_gamepad))
        return _led_pattern_unknown;
    
    return _gamepad.__led_pattern ?? _led_pattern_unknown;
}
