function scribble_font_set_style_family(argument0, argument1, argument2, argument3)
{
    static _font_data_map = __scribble_get_font_data_map();
    
    var _font_names = array_create(4, undefined);
    _font_names[0] = is_string(argument0) ? argument0 : undefined;
    _font_names[1] = is_string(argument1) ? argument1 : undefined;
    _font_names[2] = is_string(argument2) ? argument2 : undefined;
    _font_names[3] = is_string(argument3) ? argument3 : undefined;
    var _i = 0;
    
    repeat (4)
    {
        var _struct = ds_map_find_value(_font_data_map, array_get(_font_names, _i));
        
        if (is_struct(_struct))
        {
            with (_struct)
            {
                __style_regular = _font_names[0];
                __style_bold = _font_names[1];
                __style_italic = _font_names[2];
                __style_bold_italic = _font_names[3];
            }
        }
        
        _i++;
    }
}
