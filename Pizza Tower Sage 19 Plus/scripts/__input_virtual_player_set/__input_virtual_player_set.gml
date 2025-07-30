function __input_virtual_player_set(argument0)
{
    static _global = __input_global();
    
    if (argument0 != _global.__touch_player)
    {
        _global.__touch_player = argument0;
        var _i = 0;
        
        repeat (array_length(_global.__virtual_array))
        {
            _global.__virtual_array[_i].__clear_state();
            _i++;
        }
    }
}
