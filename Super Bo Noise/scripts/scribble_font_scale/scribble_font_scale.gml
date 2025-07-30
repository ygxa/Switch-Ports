function scribble_font_scale(argument0, argument1)
{
    var _font_data = __scribble_get_font_data(argument0);
    var _grid = _font_data.__glyph_data_grid;
    ds_grid_multiply_region(_grid, 0, 3, ds_grid_width(_grid) - 1, 10, argument1);
    _font_data.__scale *= argument1;
    _font_data.__calculate_font_height();
}
