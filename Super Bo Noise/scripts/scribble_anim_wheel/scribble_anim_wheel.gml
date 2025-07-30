function scribble_anim_wheel(argument0, argument1, argument2)
{
    static _array = __scribble_get_anim_properties();
    static _scribble_state = __scribble_get_state();
    
    if (argument0 != _array[11] || argument1 != _array[12] || argument2 != _array[13])
    {
        _array[11] = argument0;
        _array[12] = argument1;
        _array[13] = argument2;
        
        with (_scribble_state)
        {
            __shader_anim_desync = true;
            __shader_anim_desync_to_default = false;
        }
    }
}
