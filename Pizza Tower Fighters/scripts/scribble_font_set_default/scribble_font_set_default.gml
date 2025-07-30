function scribble_font_set_default(argument0)
{
    static _scribble_state = __scribble_get_state();
    
    __scribble_initialize();
    
    if (!is_string(argument0))
    {
        __scribble_error("The default font should be defined using its name as a string.\n(Input was an invalid datatype)");
        return undefined;
    }
    
    if (false && _scribble_state.__default_font == undefined)
        __scribble_trace("Setting default font to \"" + string(argument0) + "\"");
    
    _scribble_state.__default_font = argument0;
}
