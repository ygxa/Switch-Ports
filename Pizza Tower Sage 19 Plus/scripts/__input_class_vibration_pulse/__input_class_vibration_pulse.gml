function __input_class_vibration_pulse(argument0, argument1, argument2, argument3, argument4) constructor
{
    static __tick = function(argument0)
    {
        __time += argument0;
        var _t = __time / __duration;
        var _output = 0.5 + (0.5 * dsin(_t * ((360 * __repeats) - 180)));
        __output_left = _output * __strength_left;
        __output_right = _output * __strength_right;
        return __time < __duration;
    };
    
    __force = argument4;
    __output_left = 0;
    __output_right = 0;
    __strength_left = argument0 * clamp(1 - argument1, 0, 1);
    __strength_right = argument0 * clamp(1 + argument1, 0, 1);
    __repeats = argument2;
    __time = 0;
    __duration = argument3;
}
