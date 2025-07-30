function input_color_set(argument0, argument1 = 0)
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
    
    if (!is_numeric(argument0) || argument0 < 0 || argument0 > 16777215)
    {
        __input_error("Invalid color value ", argument0);
        exit;
    }
    
    _global.__players[argument1].__color_set(argument0);
}
