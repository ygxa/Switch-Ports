function scribble_font_force_bilinear_filtering(argument0, argument1)
{
    var _font_data = __scribble_get_font_data(argument0);
    var _grid = _font_data.__glyph_data_grid;
    var _map = _font_data.__glyphs_map;
    ds_grid_set_region(_grid, 0, 18, ds_map_size(_map) - 1, 18, argument1);
}
