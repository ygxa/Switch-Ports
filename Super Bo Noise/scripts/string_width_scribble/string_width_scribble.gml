function string_width_scribble(argument0)
{
    static _scribble_state = __scribble_get_state();
    
    var _font = draw_get_font();
    _font = !font_exists(_font) ? _scribble_state.__default_font : font_get_name(_font);
    return scribble(argument0).starting_format(_font, 16777215).get_width();
}
