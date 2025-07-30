function input_combo_create(argument0, argument1 = 20, argument2 = true)
{
    static _global = __input_global();
    
    __input_ensure_unique_verb_name(argument0);
    var _combo_definition = new __input_class_combo_definition(argument0, argument1, argument2);
    variable_struct_set(_global.__all_verb_dict, argument0, true);
    array_push(_global.__all_verb_array, argument0);
    variable_struct_set(_global.__combo_verb_dict, argument0, _combo_definition);
    array_push(_global.__combo_verb_array, argument0);
    var _p = 0;
    
    repeat (1)
    {
        with (_global.__players[_p])
        {
            __add_combo_state(argument0, _combo_definition);
            __add_complex_verb(argument0, (1 << 0));
        }
        
        _p++;
    }
    
    return _combo_definition;
}
