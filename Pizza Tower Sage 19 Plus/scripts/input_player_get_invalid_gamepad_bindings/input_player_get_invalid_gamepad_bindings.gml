function input_player_get_invalid_gamepad_bindings(argument0 = 0, argument1 = undefined)
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
    
    if (!input_profile_exists(argument1, argument0))
        __input_error("Profile name \"", argument1, "\" doesn't exist");
    
    return _global.__players[argument0].__get_invalid_gamepad_bindings(argument1);
}
