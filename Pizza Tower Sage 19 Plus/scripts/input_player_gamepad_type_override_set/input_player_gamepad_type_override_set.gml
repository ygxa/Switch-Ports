function input_player_gamepad_type_override_set(argument0, argument1 = 0)
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
    
    if (argument0 != undefined && argument0 != "xbox one" && argument0 != "xbox 360" && argument0 != "ps5" && argument0 != "ps4" && argument0 != "psx" && argument0 != "switch" && argument0 != "switch joycon left" && argument0 != "switch joycon right" && argument0 != "gamecube")
        __input_error("Gamepad type \"", argument0, "\" not supported");
    
    _global.__players[argument1].__gamepad_type_override = argument0;
}
