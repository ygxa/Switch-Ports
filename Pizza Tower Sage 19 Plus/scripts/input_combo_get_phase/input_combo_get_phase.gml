function input_combo_get_phase(argument0, argument1 = 0)
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
    
    var _combo_state = variable_struct_get(_global.__players[argument1].__combo_state_dict, argument0);
    
    if (!is_struct(_combo_state))
        __input_error("Combo with name \"", argument0, "\" doesn't exist");
    
    return _combo_state.__phase;
}
