function __input_class_vibration_curve(argument0, argument1, argument2, argument3, argument4) constructor
{
    static __tick = function(argument0)
    {
        __time += argument0;
        var _t = __time / __duration;
        var _count = array_length(__curve.channels);
        
        if (_count == 1)
        {
            __output_left = clamp(animcurve_channel_evaluate(animcurve_get_channel(__curve, 0), _t), 0, 1);
            __output_right = __output_left;
        }
        else
        {
            var _left = animcurve_get_channel(__curve, animcurve_get_channel(__curve, 0));
            var _right = animcurve_get_channel(__curve, animcurve_get_channel(__curve, 1));
            
            if (_left != -1)
                __output_left = clamp(animcurve_channel_evaluate(_left, _t), 0, 1);
            
            if (_right != -1)
                __output_right = clamp(animcurve_channel_evaluate(_right, _t), 0, 1);
        }
        
        __output_left *= __strength_left;
        __output_right *= __strength_right;
        return __time < __duration;
    };
    
    __force = argument4;
    __output_left = 0;
    __output_right = 0;
    __strength_left = argument0 * clamp(1 - argument2, 0, 1);
    __strength_right = argument0 * clamp(1 + argument2, 0, 1);
    __curve = argument1;
    __time = 0;
    __duration = argument3;
}
