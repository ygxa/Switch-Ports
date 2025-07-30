function __input_class_vibration_constant(argument0, argument1, argument2, argument3) constructor
{
    static __tick = function(argument0)
    {
        __time += argument0;
        return __time < __duration;
    };
    
    __force = argument3;
    __output_left = argument0 * clamp(1 - argument1, 0, 1);
    __output_right = argument0 * clamp(1 + argument1, 0, 1);
    __time = 0;
    __duration = argument2;
}
