function __input_class_vibration_adsr(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) constructor
{
    static __tick = function(argument0)
    {
        __time_in_phase += argument0;
        var _min = 0;
        var _max = 0;
        var _phase_time = infinity;
        
        switch (__phase)
        {
            case 0:
                _min = 0;
                _max = 1;
                _phase_time = __attack;
                break;
            
            case 1:
                _min = 1;
                _max = __sustain_level;
                _phase_time = __decay;
                break;
            
            case 2:
                _min = __sustain_level;
                _max = __sustain_level;
                _phase_time = __sustain;
                break;
            
            case 3:
                _min = __sustain_level;
                _max = 0;
                _phase_time = __release;
                break;
        }
        
        var _output = lerp(_min, _max, clamp(__time_in_phase / _phase_time, 0, 1));
        __output_left = _output * __strength_left;
        __output_right = _output * __strength_right;
        __time_in_phase += argument0;
        
        if (__time_in_phase > _phase_time)
        {
            __time_in_phase -= _phase_time;
            __phase++;
        }
        
        return __phase <= 3;
    };
    
    __force = argument7;
    __output_left = 0;
    __output_right = 0;
    __strength_left = argument0 * clamp(1 - argument2, 0, 1);
    __strength_right = argument0 * clamp(1 + argument2, 0, 1);
    __sustain_level = argument1;
    __pan = argument2;
    __attack = argument3;
    __decay = argument4;
    __sustain = argument5;
    __release = argument6;
    __phase = 0;
    __time_in_phase = 0;
}
