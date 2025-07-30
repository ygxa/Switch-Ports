function input_binding_scan_start(argument0, argument1 = undefined, argument2 = 0)
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
    
    if (!is_numeric(argument2) && !is_undefined(argument2))
        __input_error("Usage of input_binding_scan_start() has changed. Please refer to documentation for details");
    
    if (!(is_method(argument0) || (is_numeric(argument0) && script_exists(argument0))))
        __input_error("Binding scan success callback set to an illegal value (typeof=", typeof(argument0), ")");
    
    if (!(is_method(argument1) || (is_numeric(argument1) && script_exists(argument1)) || argument1 == undefined))
        __input_error("Binding scan failure callback set to an illegal value (typeof=", typeof(argument1), ")");
    
    with (_global.__players[argument2])
    {
        __rebind_state = 1;
        __rebind_start_time = _global.__current_time;
        __rebind_success_callback = argument0;
        __rebind_failure_callback = argument1;
        __input_trace("Binding scan started for player ", argument2);
    }
}
