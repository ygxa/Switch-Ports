function __input_class_trigger_effect_feedback(argument0, argument1) constructor
{
    static __mode_name = "feedback";
    static __mode = (1 << 0);
    
    static __steam_get_state = function(argument0, argument1)
    {
        if (input_gamepad_value(argument0, argument1) >= (variable_struct_get(__params, "position") / 10))
            return (2 << 0);
        
        return (1 << 0);
    };
    
    static __apply_ps5 = function(argument0, argument1, argument2)
    {
        return ps5_gamepad_set_trigger_effect_feedback(argument0, argument1, variable_struct_get(__params, "position"), variable_struct_get(__params, "strength") * argument2);
    };
    
    __params = {};
    variable_struct_set(__params, "position", clamp(argument0 * 10, 0, 9));
    variable_struct_set(__params, "strength", clamp(argument1 * 8, 0, 8));
}
