function input_player_swap(argument0, argument1)
{
    static _global = __input_global();
    
    if (argument0 < 0)
    {
        __input_error("Invalid player index A provided (", argument0, ")");
        return undefined;
    }
    
    if (argument0 >= 1)
    {
        __input_error("Player index A too large (", argument0, " must be less than ", 1, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    if (argument1 < 0)
    {
        __input_error("Invalid player index B provided (", argument1, ")");
        return undefined;
    }
    
    if (argument1 >= 1)
    {
        __input_error("Player index B too large (", argument1, " must be less than ", 1, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    var _original_a = _global.__players[argument0];
    var _original_b = _global.__players[argument1];
    _original_a.__index = argument1;
    _original_b.__index = argument0;
    _global.__players[argument0] = _original_b;
    _global.__players[argument1] = _original_a;
}
