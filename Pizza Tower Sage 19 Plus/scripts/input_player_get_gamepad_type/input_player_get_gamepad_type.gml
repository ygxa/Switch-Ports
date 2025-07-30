function input_player_get_gamepad_type(argument0 = 0, argument1 = undefined)
{
    static _global = __input_global();
    
    if (argument0 < 0)
    {
        __input_error("Invalid player index provided (", argument0, ")");
        return undefined;
    }
    
    if (argument0 >= 1)
    {
        __input_error("Player index too large (", argument0, " must be less than ", 1, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    if (_global.__source_mode != (4 << 0))
        argument1 = undefined;
    
    if (argument1 != undefined)
    {
        if (!input_value_is_binding(argument1))
        {
            __input_error("Parameter is not a binding (typeof=", typeof(argument1), ")");
            exit;
        }
        
        var _gamepad_index = argument1.__gamepad_get();
        
        if (_gamepad_index == undefined)
            argument1 = undefined;
        else
            return input_gamepad_get_type(_gamepad_index);
    }
    
    if (argument1 == undefined)
        return input_gamepad_get_type(input_player_get_gamepad(argument0));
}
