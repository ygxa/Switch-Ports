function input_player_ghost_set(argument0, argument1 = 0)
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
    
    if (argument1 == -3)
    {
        var _i = 0;
        
        repeat (1)
        {
            input_player_ghost_set(argument0, _i);
            _i++;
        }
        
        exit;
    }
    
    if (_global.__players[argument1].__ghost == argument0)
        exit;
    
    _global.__players[argument1].__ghost = argument0;
    
    if (argument0)
        input_source_clear(argument1);
}
