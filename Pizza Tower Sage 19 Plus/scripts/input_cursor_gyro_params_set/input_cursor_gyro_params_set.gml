function input_cursor_gyro_params_set(argument0 = undefined, argument1 = undefined, argument2 = undefined, argument3 = undefined, argument4 = 0, argument5 = undefined)
{
    static _global = __input_global();
    
    if (argument4 == -3)
    {
        var _p = 0;
        
        repeat (1)
        {
            input_cursor_gyro_params_set(argument0, argument1, argument2, argument3, _p, argument5);
            _p++;
        }
        
        exit;
    }
    
    if (argument4 < 0)
    {
        __input_error("Invalid player index provided (", argument4, ")");
        return undefined;
    }
    
    if (argument4 >= 1)
    {
        __input_error("Player index too large (", argument4, " must be less than ", 1, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    if (argument5 != undefined)
        _global.__players[argument4].__gyro_gamepad = argument5;
    
    if (argument0 != undefined)
        _global.__players[argument4].__gyro_axis_x = argument0;
    
    if (argument1 != undefined)
        _global.__players[argument4].__gyro_axis_y = argument1;
    
    if (argument2 != undefined)
        _global.__players[argument4].__gyro_sensitivity_x = argument2;
    
    if (argument3 != undefined)
        _global.__players[argument4].__gyro_sensitivity_y = argument3;
}
