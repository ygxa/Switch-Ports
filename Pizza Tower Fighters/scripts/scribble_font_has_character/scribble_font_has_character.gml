function scribble_font_has_character(argument0, argument1)
{
    return ds_map_exists(__scribble_get_font_data(argument0).__glyphs_map, ord(argument1));
}
