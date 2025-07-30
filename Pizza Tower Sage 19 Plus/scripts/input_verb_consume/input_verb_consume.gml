function input_verb_consume(argument0, argument1 = 0)
{
    static _global = __input_global();
    
    if (argument1 == -3)
    {
        var _i = 0;
        
        repeat (1)
        {
            input_verb_consume(argument0, _i);
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
    
    if (argument0 == -3)
    {
        var _verb_names = variable_struct_get_names(_global.__players[argument1].__verb_state_dict);
        var _v = 0;
        
        repeat (array_length(_verb_names))
        {
            input_verb_consume(_verb_names[_v], argument1);
            _v++;
        }
    }
    else if (is_array(argument0))
    {
        var _v = 0;
        
        repeat (array_length(argument0))
        {
            input_verb_consume(argument0[_v], argument1);
            _v++;
        }
    }
    else
    {
        var _verb_struct = variable_struct_get(_global.__players[argument1].__verb_state_dict, argument0);
        
        if (!is_struct(_verb_struct))
        {
            __input_error("Verb not recognised (", argument0, ")");
            return undefined;
        }
        
        with (_verb_struct)
        {
            __consumed = true;
            __previous_held = true;
            __inactive = true;
            __toggle_state = false;
        }
    }
}
