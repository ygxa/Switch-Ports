function input_profile_verify(argument0, argument1, argument2 = 0)
{
    static _global = __input_global();
    
    if (argument2 < 0)
    {
        __input_error("Invalid player index provided (", argument2, ")");
        return undefined;
    }
    
    if (argument2 >= 1)
    {
        __input_error("Player index too large (", argument2, " must be less than ", 1, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    var _backup = input_profile_export(argument1, argument2, false);
    var _error = undefined;
    
    try
    {
        _global.__players[argument2].__profile_import(argument0, argument1);
    }
    catch (_error)
    {
        __input_trace("input_profile_verify() failed with the following error: ", _error);
    }
    
    input_profile_import(_backup, argument1, argument2);
    return _error == undefined;
}
