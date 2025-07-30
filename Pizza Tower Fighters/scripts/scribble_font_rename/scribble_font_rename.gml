function scribble_font_rename(argument0, argument1)
{
    static _font_data_map = __scribble_get_font_data_map();
    
    var _data = __scribble_get_font_data(argument0);
    ds_map_set(_font_data_map, argument1, _data);
    ds_map_delete(_font_data_map, argument0);
    var _scribble_state = __scribble_get_state();
    
    if (_scribble_state.__default_font == argument0)
        _scribble_state.__default_font = argument1;
}
