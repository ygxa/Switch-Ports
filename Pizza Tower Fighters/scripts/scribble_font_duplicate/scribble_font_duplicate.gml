function scribble_font_duplicate(argument0, argument1)
{
    static _font_data_map = __scribble_get_font_data_map();
    
    var _old_font_data = __scribble_get_font_data(argument0);
    
    if (ds_map_exists(_font_data_map, argument1))
        __scribble_error("Font \"", argument1, "\" already exists");
    
    var _new_font_data = new __scribble_class_font(argument1, ds_grid_width(_old_font_data.__glyph_data_grid), _old_font_data.__msdf);
    _new_font_data.__runtime = true;
    _old_font_data.__copy_to(_new_font_data, true);
}
