function __input_class_trigger_effect_off() constructor
{
    static __mode_name = "off";
    static __mode = (0 << 0);
    
    static __steam_get_state = function(argument0, argument1)
    {
        return (0 << 0);
    };
    
    static __apply_ps5 = function(argument0, argument1, argument2)
    {
        return ps5_gamepad_set_trigger_effect_off(argument0, argument1);
    };
    
    __params = {};
}
