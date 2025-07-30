function scribble_glyph_get(argument0, argument1, argument2)
{
    var _font_data = __scribble_get_font_data(argument0);
    var _grid = _font_data.__glyph_data_grid;
    var _map = _font_data.__glyphs_map;
    var _unicode = is_real(argument1) ? argument1 : ord(argument1);
    var _glyph_index = ds_map_find_value(_map, _unicode);
    
    if (_glyph_index == undefined)
    {
        __scribble_error("Character \"", argument1, "\" not found for font \"", argument0, "\"");
        return undefined;
    }
    
    return ds_grid_get(_grid, _glyph_index, argument2);
}
