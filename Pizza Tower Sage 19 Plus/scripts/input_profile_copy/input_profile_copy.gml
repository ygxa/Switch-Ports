function input_profile_copy(argument0, argument1, argument2, argument3)
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
    
    if (argument2 < 0)
    {
        __input_error("Invalid destination player index provided (", argument2, ")");
        return undefined;
    }
    
    if (argument2 >= 1)
    {
        __input_error("Destination player index too large (", argument2, " must be less than ", 1, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    input_profile_import(input_profile_export(argument1, argument0, false, false), argument3, argument2);
}
