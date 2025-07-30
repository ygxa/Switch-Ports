function scribble_font_delete(argument0)
{
    static _font_data_map = __scribble_get_font_data_map();
    
    if (!ds_map_exists(_font_data_map, argument0))
        exit;
    
    ds_map_find_value(_font_data_map, argument0).__destroy();
    ds_map_delete(_font_data_map, argument0);
}
