function input_player_verify(argument0, argument1 = 0)
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
    
    var _backup = input_player_export(argument1, false);
    var _error = undefined;
    
    try
    {
        _global.__players[argument1].__import(argument0);
    }
    catch (_error)
    {
        __input_trace("input_player_verify() failed with the following error: ", _error);
    }
    
    input_player_import(_backup, argument1);
    return _error == undefined;
}
