function __input_class_trigger_effect_weapon(argument0, argument1, argument2, argument3) constructor
{
    static __mode_name = "weapon";
    static __mode = (2 << 0);
    
    static __apply_ps5 = function(argument0, argument1, argument2)
    {
        return ps5_gamepad_set_trigger_effect_weapon(argument0, argument1, variable_struct_get(__params, "start_position"), variable_struct_get(__params, "end_position"), variable_struct_get(__params, "strength") * argument2);
    };
    
    static __steam_get_state = function(argument0, argument1)
    {
        var _trigger_value = input_gamepad_value(argument0, argument1);
        
        if (_trigger_value > (min(9.9, variable_struct_get(__params, "end_position") + 2) / 10))
            return (5 << 0);
        else if (_trigger_value >= (variable_struct_get(__params, "start_position") / 10))
            return (4 << 0);
        
        return (3 << 0);
    };
    
    __params = {};
    variable_struct_set(__params, "start_position", clamp(argument1 * 10, 2, 7));
    variable_struct_set(__params, "end_position", clamp(argument2 * 10, max(argument2 * 10, argument1 * 10), 8));
    variable_struct_set(__params, "strength", clamp(argument3 * 8, 0, 8));
}
