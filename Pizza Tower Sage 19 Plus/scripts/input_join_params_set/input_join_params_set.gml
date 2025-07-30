function input_join_params_set(argument0, argument1, argument2, argument3, argument4 = true)
{
    static _global = __input_global();
    
    if (argument_count < 4)
        __input_error("input_join_params_set() must be given at least 4 arguments");
    
    if (argument1 < 1)
    {
        __input_error("Invalid maximum player count provided (", argument1, ")");
        return undefined;
    }
    
    if (argument1 > 1)
    {
        __input_error("Maximum player count too large (", argument1, " must not be greater than ", 1, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    if (argument0 < 1)
    {
        __input_error("Invalid minimum player count provided (", argument0, ")");
        return undefined;
    }
    
    if (argument0 > argument1)
    {
        __input_error("Minimum player count larger than maximum (", argument0, " must be less than ", argument1, ")");
        return undefined;
    }
    
    if (!is_string(argument2) && !is_undefined(argument2))
        __input_error("Multiplayer leave verb must be a _string or <undefined>");
    
    if (!is_method(argument3) && !(is_numeric(argument3) && script_exists(argument3)) && !is_undefined(argument3))
        __input_error("Multiplayer abort callback must be a function, a _script, or <undefined>");
    
    _global.__join_player_min = argument0;
    _global.__join_player_max = argument1;
    _global.__join_leave_verb = argument2;
    _global.__join_abort_callback = argument3;
    _global.__join_drop_down = argument4;
}
