function input_trigger_effect_get_state(argument0, argument1 = 0)
{
    static _global = __input_global();
    
    if (argument1 < 0)
    {
        __input_error("Invalid player index provided (", argument1, ")");
        return undefined;
    }
    
    if (argument1 >= 1)
    {
        __input_error("Player index too large (", argument1, " must be less than ", 1, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    if (!(argument0 == 32775 || argument0 == 32776))
        __input_error("Value ", argument0, " not a gamepad trigger");
    
    var _player = _global.__players[argument1];
    var _gamepad = input_player_get_gamepad(argument1);
    
    if (_gamepad < 0)
        return undefined;
    
    if (_player.__trigger_effect_paused)
        return (-1 << 0);
    
    if (os_type == os_ps5)
        return ps5_gamepad_get_trigger_effect_state(_gamepad, argument0);
    
    var _effect = undefined;
    
    if (argument0 == 32775)
    {
        if (_player.__trigger_intercepted_left)
            return (-1 << 0);
        
        _effect = _player.__trigger_effect_left;
    }
    else if (argument0 == 32776)
    {
        if (_player.__trigger_intercepted_right)
            return (-1 << 0);
        
        _effect = _player.__trigger_effect_right;
    }
    else
    {
        __input_error("Value ", argument0, " not a gamepad trigger");
        return false;
    }
    
    if (!is_struct(_effect))
        return (0 << 0);
    
    return _effect.__steam_get_state(_gamepad, argument0);
}
