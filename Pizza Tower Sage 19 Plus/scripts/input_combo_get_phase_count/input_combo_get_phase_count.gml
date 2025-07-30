function input_combo_get_phase_count(argument0)
{
    static _global = __input_global();
    
    var _combo_def = variable_struct_get(_global.__combo_verb_dict, argument0);
    
    if (!is_struct(_combo_def))
        __input_error("Combo with name \"", argument0, "\" doesn't exist");
    
    return array_length(_combo_def.__phase_array);
}
