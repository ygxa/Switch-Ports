function input_check_opposing(argument0, argument1, argument2 = 0, argument3 = false)
{
    static _global = __input_global();
    
    var _held_n = input_check(argument0, argument2);
    var _held_p = input_check(argument1, argument2);
    
    if (!_held_n && !_held_p)
        return 0;
    
    if (_held_n && _held_p && !argument3)
        return 0;
    
    if (!_held_p)
        return _held_n ? -1 : 0;
    
    if (!_held_n)
        return _held_p ? 1 : 0;
    
    var _player_verbs_struct = _global.__players[argument2].__verb_state_dict;
    var _verb_struct_n = variable_struct_get(_player_verbs_struct, argument0);
    var _verb_struct_p = variable_struct_get(_player_verbs_struct, argument1);
    
    if (_verb_struct_n.__press_time > _verb_struct_p.__press_time)
        return _held_n ? -1 : 0;
    else
        return _held_p ? 1 : 0;
    
    __input_error("Opposing check unhandled");
}
