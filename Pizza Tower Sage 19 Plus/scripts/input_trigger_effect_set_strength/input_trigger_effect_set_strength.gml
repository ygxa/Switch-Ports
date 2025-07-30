function input_trigger_effect_set_strength(argument0, argument1 = 0)
{
    static _global = __input_global();
    
    if (argument1 == -3)
    {
        var _i = 0;
        
        repeat (1)
        {
            input_trigger_effect_set_strength(argument0, _i);
            _i++;
        }
        
        exit;
    }
    
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
    
    argument0 = clamp(argument0, 0, 1);
    
    with (_global.__players[argument1])
    {
        if (__trigger_effect_strength != argument0)
        {
            __trigger_effect_strength = argument0;
            __input_player_apply_trigger_effects(argument1);
        }
    }
}
