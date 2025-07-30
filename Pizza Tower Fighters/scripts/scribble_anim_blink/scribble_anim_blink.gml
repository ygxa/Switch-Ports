function scribble_anim_blink(argument0, argument1, argument2)
{
    static _scribble_state = __scribble_get_state();
    
    with (_scribble_state)
    {
        __blink_on_duration = argument0;
        __blink_off_duration = argument1;
        __blink_time_offset = argument2;
    }
}
