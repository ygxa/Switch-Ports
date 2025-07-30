function input_binding_scan_params_set(argument0 = undefined, argument1 = undefined, argument2 = undefined, argument3 = 0)
{
    static _global = __input_global();
    
    if (argument3 < 0)
    {
        __input_error("Invalid player index provided (", argument3, ")");
        return undefined;
    }
    
    if (argument3 >= 1)
    {
        __input_error("Player index too large (", argument3, " must be less than ", 1, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    if (is_numeric(argument2))
        __input_error("Usage of input_binding_scan_params_set() has changed. Please refer to documentation for details");
    
    if (!is_array(argument1) && argument1 != undefined)
        argument1 = [argument1];
    
    if (!is_array(argument0) && argument0 != undefined)
        argument0 = [argument0];
    
    var _ignore_struct = undefined;
    var _allow_struct = undefined;
    
    if (is_array(argument0))
    {
        _ignore_struct = {};
        var _i = 0;
        
        repeat (array_length(argument0))
        {
            var _value = argument0[_i];
            
            if (is_string(_value) && _value != "mouse wheel up" && _value != "mouse wheel down")
                _value = ord(_value);
            
            variable_struct_set(_ignore_struct, _string(_value), true);
            _i++;
        }
    }
    
    if (is_array(argument1))
    {
        _allow_struct = {};
        var _i = 0;
        
        repeat (array_length(argument1))
        {
            var _value = argument1[_i];
            
            if (is_string(_value) && _value != "mouse wheel up" && _value != "mouse wheel down")
                _value = ord(_value);
            
            variable_struct_set(_allow_struct, _string(_value), true);
            _i++;
        }
    }
    
    with (_global.__players[argument3])
    {
        if (!is_undefined(argument2) && !is_array(argument2))
            argument2 = [argument2];
        
        __rebind_ignore_struct = _ignore_struct;
        __rebind_allow_struct = _allow_struct;
        __rebind_source_filter = argument2;
    }
}
