function scribble_font_exists(argument0)
{
    static _font_data_map = __scribble_get_font_data_map();
    
    return ds_map_exists(_font_data_map, argument0);
}
