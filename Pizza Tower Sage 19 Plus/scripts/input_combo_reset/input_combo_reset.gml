function input_combo_reset(argument0, argument1 = 0)
{
    static _global = __input_global();
    
    if (argument0 == -3)
    {
        var _i = 0;
        
        repeat (array_length(_global.__combo_verb_array))
        {
            input_combo_reset(_global.__combo_verb_array[_i], argument1);
            _i++;
        }
        
        exit;
    }
    
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
    
    _combo_state.__reset();
}
