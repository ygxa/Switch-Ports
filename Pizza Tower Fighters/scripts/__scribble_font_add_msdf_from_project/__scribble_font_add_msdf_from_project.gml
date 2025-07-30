function __scribble_font_add_msdf_from_project(argument0)
{
    static _font_data_map = __scribble_get_font_data_map();
    
    var _name = sprite_get_name(argument0);
    
    if (ds_map_exists(_font_data_map, _name))
    {
        __scribble_trace("Warning! An MSDF font for \"", _name, "\" has already been added. Destroying the old MSDF font and creating a new one");
        ds_map_find_value(_font_data_map, _name).__destroy();
    }
    
    var _scribble_state = __scribble_get_state();
    
    if (_scribble_state.__default_font == undefined)
        _scribble_state.__default_font = _name;
    
    var _is_krutidev = __scribble_asset_is_krutidev(argument0, 1);
    var _global_glyph_bidi_map = __scribble_get_glyph_data().__bidi_map;
    var _sprite_width = sprite_get_width(argument0);
    var _sprite_height = sprite_get_height(argument0);
    var _sprite_uvs = sprite_get_uvs(argument0, 0);
    var _texture = sprite_get_texture(argument0, 0);
    var _texel_w = texture_get_texel_width(_texture);
    var _texel_h = texture_get_texel_height(_texture);
    _sprite_uvs[0] -= _texel_w * _sprite_uvs[4];
    _sprite_uvs[1] -= _texel_h * _sprite_uvs[5];
    _sprite_uvs[2] += _texel_w * _sprite_width * (1 - _sprite_uvs[6]);
    _sprite_uvs[3] += _texel_h * _sprite_height * (1 - _sprite_uvs[7]);
    var _font_directory = __scribble_get_font_directory();
    var _json_buffer = buffer_load(_font_directory + _name + ".json");
    
    if (_json_buffer < 0)
        _json_buffer = buffer_load(_font_directory + _name);
    
    if (_json_buffer < 0)
        __scribble_error("Could not find \"", _font_directory + _name + ".json\"\nPlease add it to the project's Included Files");
    
    var _json_string = buffer_read(_json_buffer, buffer_text);
    buffer_delete(_json_buffer);
    var _json = json_decode(_json_string);
    var _metrics_map = ds_map_find_value(_json, "metrics");
    var _json_glyph_list = ds_map_find_value(_json, "glyphs");
    var _atlas_map = ds_map_find_value(_json, "atlas");
    var _kerning_list = ds_map_find_value(_json, "kerning");
    var _em_size = ds_map_find_value(_atlas_map, "size");
    var _msdf_pxrange = ds_map_find_value(_atlas_map, "distanceRange");
    var _json_line_height = _em_size * ds_map_find_value(_metrics_map, "lineHeight");
    var _size = ds_list_size(_json_glyph_list);
    var _font_data = new __scribble_class_font(_name, _size, true);
    _font_data.__runtime = true;
    var _font_glyphs_map = _font_data.__glyphs_map;
    var _font_glyph_data_grid = _font_data.__glyph_data_grid;
    var _font_kerning_map = _font_data.__kerning_map;
    
    if (_is_krutidev)
        _font_data.__is_krutidev = true;
    
    _font_data.__msdf_pxrange = _msdf_pxrange;
    var _i = 0;
    
    repeat (_size)
    {
        var _json_glyph_map = ds_list_find_value(_json_glyph_list, _i);
        var _plane_map = ds_map_find_value(_json_glyph_map, "planeBounds");
        _atlas_map = ds_map_find_value(_json_glyph_map, "atlasBounds");
        var _unicode = ds_map_find_value(_json_glyph_map, "unicode");
        var _char = chr(_unicode);
        var _tex_r, _tex_l, _tex_b, _tex_t;
        
        if (_atlas_map != undefined)
        {
            _tex_l = ds_map_find_value(_atlas_map, "left") + 1;
            _tex_t = (_sprite_height - ds_map_find_value(_atlas_map, "top")) + 1;
            _tex_r = ds_map_find_value(_atlas_map, "right") - 1;
            _tex_b = _sprite_height - ds_map_find_value(_atlas_map, "bottom") - 1;
        }
        else
        {
            _tex_l = 0;
            _tex_t = 0;
            _tex_r = 0;
            _tex_b = 0;
        }
        
        var _w = _tex_r - _tex_l;
        var _h = _tex_b - _tex_t;
        var _xoffset, _yoffset, _xadvance;
        
        if (_plane_map != undefined)
        {
            _xoffset = _em_size * ds_map_find_value(_plane_map, "left");
            _yoffset = _em_size - (_em_size * ds_map_find_value(_plane_map, "top"));
            _xadvance = round(_em_size * ds_map_find_value(_json_glyph_map, "advance"));
        }
        else
        {
            _xoffset = 0;
            _yoffset = 0;
            _xadvance = round(_em_size * ds_map_find_value(_json_glyph_map, "advance"));
        }
        
        var _u0 = lerp(_sprite_uvs[0], _sprite_uvs[2], _tex_l / _sprite_width);
        var _v0 = lerp(_sprite_uvs[1], _sprite_uvs[3], _tex_t / _sprite_height);
        var _u1 = lerp(_sprite_uvs[0], _sprite_uvs[2], _tex_r / _sprite_width);
        var _v1 = lerp(_sprite_uvs[1], _sprite_uvs[3], _tex_b / _sprite_height);
        var _bidi;
        
        if (_unicode >= 12288 && _unicode <= 12351)
        {
            _bidi = (1 << 0);
        }
        else if (_unicode >= 12352 && _unicode <= 12543)
        {
            _bidi = (3 << 0);
        }
        else if (_unicode >= 19968 && _unicode <= 40959)
        {
            _bidi = (3 << 0);
        }
        else if (_unicode >= 65280 && _unicode <= 65295)
        {
            _bidi = (1 << 0);
        }
        else if (_unicode >= 65306 && _unicode <= 65311)
        {
            _bidi = (1 << 0);
        }
        else if (_unicode >= 65371 && _unicode <= 65380)
        {
            _bidi = (1 << 0);
        }
        else
        {
            _bidi = ds_map_find_value(_global_glyph_bidi_map, _unicode);
            
            if (_bidi == undefined)
                _bidi = (4 << 0);
        }
        
        if (_is_krutidev)
        {
            if (_bidi != (0 << 0))
            {
                _bidi = (5 << 0);
                _unicode += 65535;
            }
        }
        
        ds_grid_set(_font_glyph_data_grid, _i, (0 << 0), _char);
        ds_grid_set(_font_glyph_data_grid, _i, (1 << 0), _unicode);
        ds_grid_set(_font_glyph_data_grid, _i, (2 << 0), _bidi);
        ds_grid_set(_font_glyph_data_grid, _i, (3 << 0), _xoffset);
        ds_grid_set(_font_glyph_data_grid, _i, (4 << 0), _yoffset);
        ds_grid_set(_font_glyph_data_grid, _i, (5 << 0), _w);
        ds_grid_set(_font_glyph_data_grid, _i, (6 << 0), _h);
        ds_grid_set(_font_glyph_data_grid, _i, (7 << 0), _json_line_height);
        ds_grid_set(_font_glyph_data_grid, _i, (8 << 0), _xadvance);
        ds_grid_set(_font_glyph_data_grid, _i, (9 << 0), 1 - _xoffset - (0.5 * _msdf_pxrange));
        ds_grid_set(_font_glyph_data_grid, _i, (10 << 0), 1);
        ds_grid_set(_font_glyph_data_grid, _i, (11 << 0), _texture);
        ds_grid_set(_font_glyph_data_grid, _i, (12 << 0), _u0);
        ds_grid_set(_font_glyph_data_grid, _i, (14 << 0), _v0);
        ds_grid_set(_font_glyph_data_grid, _i, (13 << 0), _u1);
        ds_grid_set(_font_glyph_data_grid, _i, (15 << 0), _v1);
        ds_grid_set(_font_glyph_data_grid, _i, (16 << 0), _msdf_pxrange);
        ds_grid_set(_font_glyph_data_grid, _i, (17 << 0), 0);
        ds_grid_set(_font_glyph_data_grid, _i, (18 << 0), true);
        ds_map_set(_font_glyphs_map, _unicode, _i);
        _i++;
    }
    
    var _space_index = ds_map_find_value(_font_glyphs_map, 32);
    
    if (_space_index == undefined)
    {
        __scribble_trace("Warning! Space character not found in character set for MSDF font \"", _name, "\"");
        _i = _size;
        ds_grid_resize(_font_glyph_data_grid, _i + 1, (19 << 0));
        ds_map_set(_font_glyphs_map, 32, _i);
        ds_grid_set(_font_glyph_data_grid, _i, (0 << 0), " ");
        ds_grid_set(_font_glyph_data_grid, _i, (1 << 0), 32);
        ds_grid_set(_font_glyph_data_grid, _i, (2 << 0), (0 << 0));
        ds_grid_set(_font_glyph_data_grid, _i, (3 << 0), 0);
        ds_grid_set(_font_glyph_data_grid, _i, (4 << 0), 0);
        ds_grid_set(_font_glyph_data_grid, _i, (5 << 0), 0.5 * _json_line_height);
        ds_grid_set(_font_glyph_data_grid, _i, (6 << 0), _json_line_height);
        ds_grid_set(_font_glyph_data_grid, _i, (7 << 0), _json_line_height);
        ds_grid_set(_font_glyph_data_grid, _i, (8 << 0), 0.5 * _json_line_height);
        ds_grid_set(_font_glyph_data_grid, _i, (9 << 0), 0);
        ds_grid_set(_font_glyph_data_grid, _i, (10 << 0), 1);
        ds_grid_set(_font_glyph_data_grid, _i, (11 << 0), _texture);
        ds_grid_set(_font_glyph_data_grid, _i, (12 << 0), 0);
        ds_grid_set(_font_glyph_data_grid, _i, (14 << 0), 0);
        ds_grid_set(_font_glyph_data_grid, _i, (13 << 0), 0);
        ds_grid_set(_font_glyph_data_grid, _i, (15 << 0), 0);
        ds_grid_set(_font_glyph_data_grid, _i, (16 << 0), undefined);
        ds_grid_set(_font_glyph_data_grid, _i, (17 << 0), undefined);
        ds_grid_set(_font_glyph_data_grid, _i, (18 << 0), undefined);
    }
    
    _space_index = ds_map_find_value(_font_glyphs_map, 32);
    ds_grid_set(_font_glyph_data_grid, _space_index, (5 << 0), ds_grid_get(_font_glyph_data_grid, _space_index, (8 << 0)));
    ds_grid_set(_font_glyph_data_grid, _space_index, (6 << 0), _json_line_height);
    _i = 0;
    
    repeat (ds_list_size(_kerning_list))
    {
        var _kerning_pair = ds_list_find_value(_kerning_list, _i);
        var _offset = round(_em_size * ds_map_find_value(_kerning_pair, "advance"));
        
        if (_offset != 0)
            ds_map_set(_font_kerning_map, ((ds_map_find_value(_kerning_pair, "unicode2") & 65535) << 16) | (ds_map_find_value(_kerning_pair, "unicode1") & 65535), _offset);
        
        _i++;
    }
    
    ds_map_destroy(_json);
    _font_data.__calculate_font_height();
}
