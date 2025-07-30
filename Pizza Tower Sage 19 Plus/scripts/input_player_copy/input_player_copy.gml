function input_player_copy(argument0, argument1)
{
    static _global = __input_global();
    
    if (argument0 < 0)
    {
        __input_error("Invalid source player index provided (", argument0, ")");
        return undefined;
    }
    
    if (argument0 >= 1)
    {
        __input_error("Source player index too large (", argument0, " must be less than ", 1, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    if (argument1 < 0)
    {
        __input_error("Invalid destination player index provided (", argument1, ")");
        return undefined;
    }
    
    if (argument1 >= 1)
    {
        __input_error("Destination player index too large (", argument1, " must be less than ", 1, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    input_player_import(input_player_export(argument0, false, false), argument1);
}
