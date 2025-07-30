function draw_text_scribble(argument0, argument1, argument2 = "", argument3 = "")
{
    static _scribble_state = __scribble_get_state();
    
    var _font = draw_get_font();
    
    if (is_numeric(_font) && _font >= 0 && font_exists(_font))
    {
        _font = font_get_name(_font);
        
        if (!scribble_font_exists(_font))
            __scribble_error("Font \"", _font, "\" does not exist in Scribble\n(Fonts added with font_add() are not supported)");
    }
    else
    {
        _font = _scribble_state.__default_font;
    }
    
    var _element = scribble(argument2, "__draw_text_scribble__").align(draw_get_halign(), draw_get_valign()).starting_format(_font, 16777215).blend(draw_get_color(), draw_get_alpha());
    
    if (argument3 != undefined)
        _element.reveal(argument3);
    
    _element.draw(argument0, argument1);
    return _element;
}
