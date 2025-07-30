function input_binding_swap(argument0, argument1, argument2, argument3, argument4 = 0, argument5 = undefined)
{
    static _global = __input_global();
    
    if (argument4 < 0)
    {
        __input_error("Invalid player index provided (", argument4, ")");
        return undefined;
    }
    
    if (argument4 >= 1)
    {
        __input_error("Player index too large (", argument4, " must be less than ", 1, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    if (!input_profile_exists(argument5, argument4))
        __input_error("Profile name \"", argument5, "\" doesn't exist");
    
    var _binding_a = input_binding_get(argument0, argument4, argument1, argument5);
    var _binding_b = input_binding_get(argument2, argument4, argument3, argument5);
    
    if (_binding_b == undefined)
        input_binding_remove(argument0, argument4, argument1, argument5);
    else
        input_binding_set(argument0, _binding_b, argument4, argument1, argument5);
    
    if (_binding_a == undefined)
        input_binding_remove(argument2, argument4, argument3, argument5);
    else
        input_binding_set(argument2, _binding_a, argument4, argument3, argument5);
}
