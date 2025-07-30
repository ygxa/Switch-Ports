function input_gamepad_is_connected(argument0)
{
    static _global = __input_global();
    
    if (argument0 == undefined || argument0 < 0 || argument0 >= array_length(_global.__gamepad_connections_internal))
        return false;
    
    return _global.__gamepad_connections_internal[argument0];
}
