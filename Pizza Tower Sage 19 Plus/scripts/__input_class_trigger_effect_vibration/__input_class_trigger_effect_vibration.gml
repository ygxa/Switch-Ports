function __input_class_trigger_effect_vibration(argument0, argument1, argument2) constructor
{
    static __mode_name = "vibration";
    static __mode = (3 << 0);
    
    static __apply_ps5 = function(argument0, argument1, argument2)
    {
        return ps5_gamepad_set_trigger_effect_vibration(argument0, argument1, variable_struct_get(__params, "position"), variable_struct_get(__params, "amplitude") * argument2, variable_struct_get(__params, "frequency"));
    };
    
    static __steam_get_state = function(argument0, argument1)
    {
        if (input_gamepad_value(argument0, argument1) >= (variable_struct_get(__params, "position") / 10))
            return (7 << 0);
        
        return (6 << 0);
    };
    
    __params = {};
    variable_struct_set(__params, "position", clamp(argument0 * 10, 0, 9));
    variable_struct_set(__params, "amplitude", clamp(argument1 * 8, 0, 8));
    variable_struct_set(__params, "frequency", clamp(argument2 * 255, 0, 255));
}
