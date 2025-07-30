function scribble_anim_wobble(argument0, argument1)
{
    static _array = __scribble_get_anim_properties();
    static _scribble_state = __scribble_get_state();
    
    if (argument0 != _array[(7 << 0)] || argument1 != _array[(8 << 0)])
    {
        _array[(7 << 0)] = argument0;
        _array[(8 << 0)] = argument1;
        
        with (_scribble_state)
        {
            __standard_anim_desync = true;
            __standard_anim_desync_to_default = false;
            __msdf_anim_desync = true;
            __msdf_anim_desync_to_default = false;
        }
    }
}
