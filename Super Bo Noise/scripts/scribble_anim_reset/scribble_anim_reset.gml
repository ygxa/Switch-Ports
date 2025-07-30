function scribble_anim_reset()
{
    static _scribble_state = __scribble_get_state();
    static _array = __scribble_get_anim_properties();
    
    with (_scribble_state)
    {
        if (!__shader_anim_default)
        {
            _array[0] = 4;
            _array[1] = 50;
            _array[2] = 0.2;
            _array[3] = 2;
            _array[4] = 0.4;
            _array[5] = 0.5;
            _array[6] = 0.01;
            _array[7] = 40;
            _array[8] = 0.15;
            _array[9] = 0.4;
            _array[10] = 0.1;
            _array[11] = 1;
            _array[12] = 0.5;
            _array[13] = 0.2;
            _array[14] = 0.5;
            _array[15] = 180;
            _array[16] = 255;
            _array[17] = 0.7;
            _array[18] = 1.2;
            _array[19] = 0.4;
            _array[20] = 0.25;
            __blink_on_duration = 50;
            __blink_off_duration = 50;
            __blink_time_offset = 0;
        }
        
        if (!__shader_anim_desync)
        {
            __shader_anim_desync = true;
            __shader_anim_desync_to_default = true;
        }
    }
}
