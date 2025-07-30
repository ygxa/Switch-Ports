function __input_player_apply_trigger_effects(argument0)
{
    static _global = __input_global();
    
    if (argument0 == -3)
    {
        var _i = 0;
        
        repeat (1)
        {
            __input_player_apply_trigger_effects(_i);
            _i++;
        }
        
        exit;
    }
    
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
    
    with (_global.__players[argument0])
    {
        if (__trigger_effect_paused)
            exit;
        
        __trigger_effect_set(32775, __trigger_effect_left, false);
        __trigger_effect_set(32776, __trigger_effect_right, false);
    }
}
