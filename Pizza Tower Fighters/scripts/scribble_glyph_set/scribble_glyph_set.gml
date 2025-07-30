function scribble_glyph_set(argument0, argument1, argument2, argument3, argument4 = false)
{
    var _font_data = __scribble_get_font_data(argument0);
    var _grid = _font_data.__glyph_data_grid;
    var _map = _font_data.__glyphs_map;
    
    if (argument1 == -3 || argument1 == "all")
    {
        if (argument4)
            ds_grid_add_region(_grid, 0, argument2, ds_grid_width(_grid) - 1, argument2, argument3);
        else
            ds_grid_set_region(_grid, 0, argument2, ds_grid_width(_grid) - 1, argument2, argument3);
        
        var _glyph_index = ds_map_find_value(_map, 32);
        
        if (_glyph_index == undefined)
        {
            __scribble_error("Space character not found for font \"", argument0, "\"");
            exit;
        }
        
        if (argument2 == (8 << 0))
            ds_grid_set(_grid, _glyph_index, (5 << 0), ds_grid_get(_grid, _glyph_index, (8 << 0)));
        
        if (argument2 == (5 << 0))
            ds_grid_set(_grid, _glyph_index, (8 << 0), ds_grid_get(_grid, _glyph_index, (5 << 0)));
        
        if (argument2 == (6 << 0))
            ds_grid_set(_grid, _glyph_index, (7 << 0), ds_grid_get(_grid, _glyph_index, (6 << 0)));
        
        if (argument2 == (7 << 0))
            ds_grid_set(_grid, _glyph_index, (6 << 0), ds_grid_get(_grid, _glyph_index, (7 << 0)));
        
        if (argument2 == (6 << 0) || argument2 == (7 << 0))
        {
            ds_grid_set_region(_grid, 0, (7 << 0), ds_grid_width(_grid) - 1, (7 << 0), ds_grid_get(_grid, _glyph_index, (7 << 0)));
            _font_data.__calculate_font_height();
        }
    }
    else
    {
        var _unicode = is_real(argument1) ? argument1 : ord(argument1);
        var _glyph_index = ds_map_find_value(_map, _unicode);
        
        if (_glyph_index == undefined)
        {
            __scribble_error("Character \"", argument1, "\" not found for font \"", argument0, "\"");
            exit;
        }
        
        var _new_value = argument4 ? (ds_grid_get(_grid, _glyph_index, argument2) + argument3) : argument3;
        ds_grid_set(_grid, _glyph_index, argument2, _new_value);
        
        if (_unicode == 32)
        {
            if (argument2 == (8 << 0))
                ds_grid_set(_grid, _glyph_index, (5 << 0), _new_value);
            
            if (argument2 == (5 << 0))
                ds_grid_set(_grid, _glyph_index, (8 << 0), _new_value);
            
            if (argument2 == (6 << 0))
                ds_grid_set(_grid, _glyph_index, (7 << 0), _new_value);
            
            if (argument2 == (7 << 0))
                ds_grid_set(_grid, _glyph_index, (6 << 0), _new_value);
            
            if (argument2 == (6 << 0) || argument2 == (7 << 0))
            {
                ds_grid_set_region(_grid, 0, (7 << 0), ds_grid_width(_grid) - 1, (7 << 0), _new_value);
                _font_data.__calculate_font_height();
            }
        }
        
        return _new_value;
    }
}
