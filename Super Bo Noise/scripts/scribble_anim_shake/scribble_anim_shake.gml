function scribble_anim_shake(argument0, argument1)
{
    static _array = __scribble_get_anim_properties();
    static _scribble_state = __scribble_get_state();
    
    if (argument0 != _array[3] || argument1 != _array[4])
    {
        _array[3] = argument0;
        _array[4] = argument1;
        
        with (_scribble_state)
        {
            __shader_anim_desync = true;
            __shader_anim_desync_to_default = false;
        }
    }
}
