function input_gamepad_map_contains(argument0, argument1)
{
    static _global = __input_global();
    
    if (argument0 == undefined || argument0 < 0 || argument0 >= array_length(_global.__gamepads))
        return false;
    
    var _gamepad = _global.__gamepads[argument0];
    
    if (!is_struct(_gamepad))
        return false;
    
    if (!is_array(argument1))
        argument1 = [argument1];
    
    var _i = 0;
    
    repeat (array_length(argument1))
    {
        if (input_gamepad_constant_get_name(argument1[_i]) == "unknown" || variable_struct_get(_gamepad.__mapping_gm_to_raw, array_get(argument1, _i)) == undefined)
            return false;
        
        _i++;
    }
    
    return true;
}
