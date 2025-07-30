function __scribble_class_element(argument0, argument1) constructor
{
    static __scribble_state = __scribble_get_state();
    static __ecache_array = __scribble_get_cache_state().__ecache_array;
    static __ecache_dict = __scribble_get_cache_state().__ecache_dict;
    static __ecache_name_array = __scribble_get_cache_state().__ecache_name_array;
    
    static draw = function(argument0, argument1, argument2 = undefined)
    {
        static _scribble_state = __scribble_get_state();
        static _null = new __scribble_class_null_element();
        
        var _function_scope = other;
        var _model = __get_model(true);
        
        if (!is_struct(_model))
            return undefined;
        
        if (__last_drawn < __scribble_state.__frames)
        {
            __animation_time += (__animation_speed * (delta_time / 16666));
            __animation_time %= 16383;
        }
        
        __last_drawn = __scribble_state.__frames;
        
        if ((_scribble_state.__blink_on_duration + _scribble_state.__blink_off_duration) > 0)
            __animation_blink_state = ((__animation_time + _scribble_state.__blink_time_offset) % (_scribble_state.__blink_on_duration + _scribble_state.__blink_off_duration)) < _scribble_state.__blink_on_duration;
        else
            __animation_blink_state = true;
        
        if (_model.__uses_standard_font)
            __set_standard_uniforms(argument2, _function_scope);
        
        if (_model.__uses_msdf_font)
            __set_msdf_uniforms(argument2, _function_scope);
        
        var _old_matrix = matrix_get(2);
        var _matrix = matrix_multiply(__update_matrix(_model, argument0, argument1), _old_matrix);
        matrix_set(2, _matrix);
        _model.__submit(__page, __msdf_feather_thickness, __msdf_border_thickness > 0 || __msdf_shadow_alpha > 0);
        matrix_set(2, _old_matrix);
        return _null;
    };
    
    static starting_format = function(argument0, argument1)
    {
        if (is_string(argument0))
        {
            if (argument0 != __starting_font)
            {
                __model_cache_name_dirty = true;
                __starting_font = argument0;
            }
        }
        else if (!is_undefined(argument0))
        {
            __scribble_error("Fonts should be specified using their name as a string\nUse <undefined> to not set a new font");
        }
        
        if (argument1 != undefined)
        {
            var _colour = __scribble_process_colour(argument1);
            
            if (_colour != undefined && _colour >= 0 && _colour != __starting_colour)
            {
                __model_cache_name_dirty = true;
                __starting_colour = _colour & 16777215;
            }
        }
        
        return self;
    };
    
    static align = function(argument0, argument1)
    {
        if (argument0 == "pin_left")
            argument0 = 3;
        
        if (argument0 == "pin_centre")
            argument0 = 4;
        
        if (argument0 == "pin_center")
            argument0 = 4;
        
        if (argument0 == "pin_right")
            argument0 = 5;
        
        if (argument0 == "fa_justify")
            argument0 = 6;
        
        if (argument0 != __starting_halign)
        {
            __model_cache_name_dirty = true;
            __starting_halign = argument0;
        }
        
        if (argument1 != __starting_valign)
        {
            __model_cache_name_dirty = true;
            __starting_valign = argument1;
        }
        
        return self;
    };
    
    static blend = function(argument0, argument1)
    {
        static _colors_struct = __scribble_config_colours();
        
        if (is_string(argument0))
        {
            argument0 = variable_struct_get(_colors_struct, argument0);
            
            if (argument0 == undefined)
            {
                __scribble_error("Colour name \"", argument0, "\" not recognised");
                exit;
            }
        }
        
        if (argument0 != undefined)
            __blend_colour = argument0 & 16777215;
        
        if (argument1 != undefined)
            __blend_alpha = argument1;
        
        return self;
    };
    
    static gradient = function(argument0, argument1)
    {
        static _colors_struct = __scribble_config_colours();
        
        if (is_string(argument0))
        {
            argument0 = variable_struct_get(_colors_struct, argument0);
            
            if (argument0 == undefined)
            {
                __scribble_error("Colour name \"", argument0, "\" not recognised");
                exit;
            }
        }
        
        __gradient_colour = argument0 & 16777215;
        __gradient_alpha = argument1;
        return self;
    };
    
    static fog = function()
    {
        __scribble_error(".fog() has been replaced by .flash()");
    };
    
    static flash = function(argument0, argument1)
    {
        static _colors_struct = __scribble_config_colours();
        
        if (is_string(argument0))
        {
            argument0 = variable_struct_get(_colors_struct, argument0);
            
            if (argument0 == undefined)
            {
                __scribble_error("Colour name \"", argument0, "\" not recognised");
                exit;
            }
        }
        
        __flash_colour = argument0 & 16777215;
        __flash_alpha = argument1;
        return self;
    };
    
    static origin = function(argument0, argument1)
    {
        if (__origin_x != argument0 || __origin_y != argument1)
        {
            __matrix_dirty = true;
            __bbox_dirty = true;
            __origin_x = argument0;
            __origin_y = argument1;
        }
        
        return self;
    };
    
    static transform = function(argument0, argument1 = argument0, argument2 = 0)
    {
        if (__post_xscale != argument0 || __post_yscale != argument1 || __post_angle != argument2)
        {
            __matrix_dirty = true;
            __bbox_dirty = true;
            __post_xscale = argument0;
            __post_yscale = argument1;
            __post_angle = argument2;
        }
        
        return self;
    };
    
    static scale = function(argument0)
    {
        if (__pre_scale != argument0)
        {
            __model_cache_name_dirty = true;
            __pre_scale = argument0;
        }
        
        return self;
    };
    
    static skew = function(argument0, argument1)
    {
        __skew_x = argument0;
        __skew_y = argument1;
        return self;
    };
    
    static scale_to_box = function(argument0, argument1, argument2 = false)
    {
        argument0 = (argument0 == undefined || argument0 < 0) ? 0 : argument0;
        argument1 = (argument1 == undefined || argument1 < 0) ? 0 : argument1;
        
        if (argument0 != __scale_to_box_width || argument1 != __scale_to_box_height || argument2 != __scale_to_box_maximise)
        {
            __scale_to_box_width = argument0;
            __scale_to_box_height = argument1;
            __scale_to_box_maximise = argument2;
            __scale_to_box_dirty = true;
        }
        
        return self;
    };
    
    static wrap = function(argument0, argument1 = -1, argument2 = false)
    {
        if (!__wrap_apply || argument0 != __wrap_max_width || argument1 != __wrap_max_height || argument2 != __wrap_per_char || __wrap_no_pages || __wrap_max_scale != 1)
        {
            __model_cache_name_dirty = true;
            __bbox_dirty = true;
            __scale_to_box_dirty = true;
            __wrap_apply = argument0 >= 0 && !is_infinity(argument0);
            __wrap_max_width = argument0;
            __wrap_max_height = argument1;
            __wrap_per_char = argument2;
            __wrap_no_pages = false;
            __wrap_max_scale = 1;
        }
        
        return self;
    };
    
    static fit_to_box = function(argument0, argument1, argument2 = false, argument3 = 1)
    {
        if (!__wrap_apply || argument0 != __wrap_max_width || argument1 != __wrap_max_height || argument2 != __wrap_per_char || !__wrap_no_pages || argument3 != __wrap_max_scale)
        {
            __model_cache_name_dirty = true;
            __matrix_dirty = true;
            __bbox_dirty = true;
            __scale_to_box_dirty = true;
            __wrap_apply = argument0 >= 0 && !is_infinity(argument0);
            __wrap_max_width = argument0;
            __wrap_max_height = argument1;
            __wrap_per_char = argument2;
            __wrap_no_pages = true;
            __wrap_max_scale = argument3;
        }
        
        return self;
    };
    
    static pin_guide_width = function(argument0)
    {
        if (__wrap_apply || __wrap_max_width != argument0 || __wrap_max_height != -1 || __wrap_per_char || __wrap_no_pages || __wrap_max_scale != 1)
        {
            __model_cache_name_dirty = true;
            __bbox_dirty = true;
            __scale_to_box_dirty = true;
            __wrap_apply = false;
            __wrap_max_width = argument0;
            __wrap_max_height = -1;
            __wrap_per_char = false;
            __wrap_no_pages = false;
            __wrap_max_scale = 1;
        }
        
        return self;
    };
    
    static line_height = function(argument0, argument1)
    {
        if (argument0 != __line_height_min)
        {
            __model_cache_name_dirty = true;
            __line_height_min = argument0;
        }
        
        if (argument1 != __line_height_max)
        {
            __model_cache_name_dirty = true;
            __line_height_max = argument1;
        }
        
        return self;
    };
    
    static line_spacing = function(argument0)
    {
        if (argument0 != __line_spacing)
        {
            __model_cache_name_dirty = true;
            __line_spacing = argument0;
        }
        
        return self;
    };
    
    static padding = function(argument0, argument1, argument2, argument3)
    {
        if (argument0 != __padding_l || argument1 != __padding_t || argument2 != __padding_r || argument3 != __padding_b)
        {
            __model_cache_name_dirty = true;
            __matrix_dirty = true;
            __bbox_dirty = true;
            __scale_to_box_dirty = true;
            __padding_l = argument0;
            __padding_t = argument1;
            __padding_r = argument2;
            __padding_b = argument3;
        }
        
        return self;
    };
    
    static bezier = function(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7)
    {
        if (argument_count <= 0)
        {
            _bezier_array = array_create(6, 0);
        }
        else if (argument_count == 8)
        {
            if (!is_numeric(argument0) || !is_numeric(argument1) || !is_numeric(argument2) || !is_numeric(argument3) || !is_numeric(argument4) || !is_numeric(argument5) || !is_numeric(argument6) || !is_numeric(argument7))
            {
                __scribble_trace("Warning! One or more Bezier parameters were not numeric (", argument0, ", ", argument1, ", ", argument2, ", ", argument3, ", ", argument4, ", ", argument5, ", ", argument6, ", ", argument7, ")");
                argument0 = 0;
                argument1 = 0;
                argument2 = 0;
                argument3 = 0;
                argument4 = 0;
                argument5 = 0;
                argument6 = 0;
                argument7 = 0;
            }
        }
        else
        {
            __scribble_error("Wrong number of arguments (", argument_count, ") provided\nExpecting 0 or 8");
        }
        
        var _bezier_array = [argument2 - argument0, argument3 - argument1, argument4 - argument0, argument5 - argument1, argument6 - argument0, argument7 - argument1];
        
        if (!array_equals(__bezier_array, _bezier_array))
        {
            __model_cache_name_dirty = true;
            __bezier_array = _bezier_array;
            __bezier_using = true;
        }
        
        return self;
    };
    
    static right_to_left = function(argument0)
    {
        var _new_bidi_hint;
        
        if (argument0 == undefined)
            _new_bidi_hint = undefined;
        else
            _new_bidi_hint = argument0 ? (6 << 0) : (4 << 0);
        
        if (__bidi_hint != _new_bidi_hint)
        {
            __model_cache_name_dirty = true;
            __bidi_hint = _new_bidi_hint;
        }
        
        return self;
    };
    
    static region_detect = function(argument0, argument1, argument2, argument3)
    {
        var _model = __get_model(true);
        var _page = _model.__pages_array[__page];
        var _region_array = _page.__region_array;
        var _matrix = __update_matrix(_model, argument0, argument1);
        
        if (__matrix_inverse == undefined)
            __matrix_inverse = __scribble_matrix_inverse(matrix_multiply(_matrix, matrix_get(2)));
        
        var _vector = matrix_transform_vertex(__matrix_inverse, argument2, argument3, 0);
        var _x = _vector[0];
        var _y = _vector[1];
        var _found = undefined;
        var _i = array_length(_region_array) - 1;
        
        repeat (_i + 1)
        {
            var _region = _region_array[_i];
            var _bbox_array = _region.__bbox_array;
            var _j = 0;
            
            repeat (array_length(_bbox_array))
            {
                var _bbox = _bbox_array[_j];
                
                if (_x >= _bbox.__x1 && _y >= _bbox.__y1 && _x <= _bbox.__x2 && _y <= _bbox.__y2)
                {
                    _found = _region.__name;
                    break;
                }
                
                _j++;
            }
            
            if (_found != undefined)
                break;
            
            _i--;
        }
        
        return _found;
    };
    
    static region_set_active = function(argument0, argument1, argument2)
    {
        if (!is_string(argument0))
        {
            __region_active = undefined;
            __region_glyph_start = 0;
            __region_glyph_end = 0;
            __region_colour = 0;
            __region_blend = 0;
            exit;
        }
        
        var _model = __get_model(true);
        var _page = _model.__pages_array[__page];
        var _region_array = _page.__region_array;
        var _i = 0;
        
        repeat (array_length(_region_array))
        {
            var _region = _region_array[_i];
            
            if (_region.__name == argument0)
            {
                __region_active = argument0;
                __region_glyph_start = _region.__start_glyph;
                __region_glyph_end = _region.__end_glyph;
                __region_colour = argument1;
                __region_blend = argument2;
                exit;
            }
            
            _i++;
        }
        
        __scribble_error("Region \"", argument0, "\" not found");
    };
    
    static region_get_active = function()
    {
        return __region_active;
    };
    
    static __update_bbox_matrix = function()
    {
        __update_scale_to_box_scale();
        
        if (__bbox_dirty)
        {
            __bbox_dirty = false;
            var _model = __get_model(true);
            
            if (!is_struct(_model))
            {
                __bbox_matrix = matrix_build(-__origin_x, -__origin_y, 0, 0, 0, 0, 1, 1, 1);
                __bbox_aabb_left = 0;
                __bbox_aabb_top = 0;
                __bbox_aabb_right = 0;
                __bbox_aabb_bottom = 0;
                __bbox_obb_x0 = 0;
                __bbox_obb_y0 = 0;
                __bbox_obb_x1 = 0;
                __bbox_obb_y1 = 0;
                __bbox_obb_x2 = 0;
                __bbox_obb_y2 = 0;
                __bbox_obb_x3 = 0;
                __bbox_obb_y3 = 0;
                exit;
            }
            
            var _xscale = __scale_to_box_scale * _model.__fit_scale * __post_xscale;
            var _yscale = __scale_to_box_scale * _model.__fit_scale * __post_yscale;
            var _bbox = _model.__get_bbox(__page, __padding_l, __padding_t, __padding_r, __padding_b);
            __bbox_raw_width = (1 + _bbox.right) - _bbox.left;
            __bbox_raw_height = (1 + _bbox.bottom) - _bbox.top;
            
            if (_xscale == 1 && _yscale == 1 && __post_angle == 0)
            {
                __bbox_matrix = matrix_build(-__origin_x, -__origin_y, 0, 0, 0, 0, 1, 1, 1);
                __bbox_aabb_left = -__origin_x + _bbox.left;
                __bbox_aabb_top = -__origin_y + _bbox.top;
                __bbox_aabb_right = -__origin_x + _bbox.right;
                __bbox_aabb_bottom = -__origin_y + _bbox.bottom;
                __bbox_obb_x0 = __bbox_aabb_left;
                __bbox_obb_y0 = __bbox_aabb_top;
                __bbox_obb_x1 = __bbox_aabb_right;
                __bbox_obb_y1 = __bbox_aabb_top;
                __bbox_obb_x2 = __bbox_aabb_left;
                __bbox_obb_y2 = __bbox_aabb_bottom;
                __bbox_obb_x3 = __bbox_aabb_right;
                __bbox_obb_y3 = __bbox_aabb_bottom;
            }
            else
            {
                __bbox_matrix = matrix_multiply(matrix_build(-__origin_x, -__origin_y, 0, 0, 0, 0, 1, 1, 1), matrix_multiply(matrix_build(0, 0, 0, 0, 0, 0, _xscale, _yscale, 1), matrix_build(0, 0, 0, 0, 0, __post_angle, 1, 1, 1)));
                var _l = _bbox.left;
                var _t = _bbox.top;
                var _r = _bbox.right;
                var _b = _bbox.bottom;
                var _vertex = matrix_transform_vertex(__bbox_matrix, _l, _t, 0);
                __bbox_obb_x0 = _vertex[0];
                __bbox_obb_y0 = _vertex[1];
                _vertex = matrix_transform_vertex(__bbox_matrix, _r, _t, 0);
                __bbox_obb_x1 = _vertex[0];
                __bbox_obb_y1 = _vertex[1];
                _vertex = matrix_transform_vertex(__bbox_matrix, _l, _b, 0);
                __bbox_obb_x2 = _vertex[0];
                __bbox_obb_y2 = _vertex[1];
                _vertex = matrix_transform_vertex(__bbox_matrix, _r, _b, 0);
                __bbox_obb_x3 = _vertex[0];
                __bbox_obb_y3 = _vertex[1];
                __bbox_aabb_left = min(__bbox_obb_x0, __bbox_obb_x1, __bbox_obb_x2, __bbox_obb_x3);
                __bbox_aabb_top = min(__bbox_obb_y0, __bbox_obb_y1, __bbox_obb_y2, __bbox_obb_y3);
                __bbox_aabb_right = max(__bbox_obb_x0, __bbox_obb_x1, __bbox_obb_x2, __bbox_obb_x3);
                __bbox_aabb_bottom = max(__bbox_obb_y0, __bbox_obb_y1, __bbox_obb_y2, __bbox_obb_y3);
            }
            
            __bbox_aabb_width = (1 + __bbox_aabb_right) - __bbox_aabb_left;
            __bbox_aabb_height = (1 + __bbox_aabb_bottom) - __bbox_aabb_top;
        }
    };
    
    static get_left = function(argument0 = 0)
    {
        __update_bbox_matrix();
        return __bbox_aabb_left + argument0;
    };
    
    static get_top = function(argument0 = 0)
    {
        __update_bbox_matrix();
        return __bbox_aabb_top + argument0;
    };
    
    static get_right = function(argument0 = 0)
    {
        __update_bbox_matrix();
        return __bbox_aabb_right + argument0;
    };
    
    static get_bottom = function(argument0 = 0)
    {
        __update_bbox_matrix();
        return __bbox_aabb_bottom + argument0;
    };
    
    static get_width = function()
    {
        __update_bbox_matrix();
        return __bbox_raw_width;
    };
    
    static get_height = function()
    {
        __update_bbox_matrix();
        return __bbox_raw_height;
    };
    
    static get_bbox = function(argument0 = 0, argument1 = 0)
    {
        __update_bbox_matrix();
        return 
        {
            x: argument0,
            y: argument1,
            left: argument0 + __bbox_aabb_left,
            top: argument1 + __bbox_aabb_top,
            right: argument0 + __bbox_aabb_right,
            bottom: argument1 + __bbox_aabb_bottom,
            width: __bbox_aabb_width,
            height: __bbox_aabb_height,
            x0: argument0 + __bbox_obb_x0,
            y0: argument1 + __bbox_obb_y0,
            x1: argument0 + __bbox_obb_x1,
            y1: argument1 + __bbox_obb_y1,
            x2: argument0 + __bbox_obb_x2,
            y2: argument1 + __bbox_obb_y2,
            x3: argument0 + __bbox_obb_x3,
            y3: argument1 + __bbox_obb_y3
        };
    };
    
    static get_bbox_revealed = function(argument0, argument1, argument2)
    {
        if (argument2 == undefined && __tw_reveal == undefined)
            return get_bbox(argument0, argument1);
        
        var _model = __get_model(true);
        
        if (!is_struct(_model))
        {
            return 
            {
                left: argument0,
                top: argument1,
                right: argument0,
                bottom: argument1,
                width: 1,
                height: 1,
                x0: argument0,
                y0: argument1,
                x1: argument0,
                y1: argument1,
                x2: argument0,
                y2: argument1,
                x3: argument0,
                y3: argument1
            };
        }
        
        var _bbox;
        
        if (argument2 != undefined)
            _bbox = _model.__get_bbox_revealed(__page, 0, argument2.__window_array[argument2.__window_index], __padding_l, __padding_t, __padding_r, __padding_b);
        else if (__tw_reveal != undefined)
            _bbox = _model.__get_bbox_revealed(__page, 0, __tw_reveal, __padding_l, __padding_t, __padding_r, __padding_b);
        
        __update_bbox_matrix();
        var _xscale = __scale_to_box_scale * _model.__fit_scale * __post_xscale;
        var _yscale = __scale_to_box_scale * _model.__fit_scale * __post_yscale;
        var _l, _t, _r, _b, _x0, _y0, _x1, _y1, _x2, _y2, _x3, _y3;
        
        if (_xscale == 1 && _yscale == 1 && __post_angle == 0)
        {
            _l = (argument0 - __origin_x) + _bbox.left;
            _t = (argument1 - __origin_y) + _bbox.top;
            _r = (argument0 - __origin_x) + _bbox.right;
            _b = (argument1 - __origin_y) + _bbox.bottom;
            _x0 = _l;
            _y0 = _t;
            _x1 = _r;
            _y1 = _t;
            _x2 = _l;
            _y2 = _b;
            _x3 = _r;
            _y3 = _b;
        }
        else
        {
            _l = _bbox.left;
            _t = _bbox.top;
            _r = _bbox.right;
            _b = _bbox.bottom;
            var _vertex = matrix_transform_vertex(__bbox_matrix, _l, _t, 0);
            _x0 = argument0 + _vertex[0];
            _y0 = argument1 + _vertex[1];
            _vertex = matrix_transform_vertex(__bbox_matrix, _r, _t, 0);
            _x1 = argument0 + _vertex[0];
            _y1 = argument1 + _vertex[1];
            _vertex = matrix_transform_vertex(__bbox_matrix, _l, _b, 0);
            _x2 = argument0 + _vertex[0];
            _y2 = argument1 + _vertex[1];
            _vertex = matrix_transform_vertex(__bbox_matrix, _r, _b, 0);
            _x3 = argument0 + _vertex[0];
            _y3 = argument1 + _vertex[1];
            _l = min(_x0, _x1, _x2, _x3);
            _t = min(_y0, _y1, _y2, _y3);
            _r = max(_x0, _x1, _x2, _x3);
            _b = max(_y0, _y1, _y2, _y3);
        }
        
        return 
        {
            left: _l,
            top: _t,
            right: _r,
            bottom: _b,
            width: (1 + _r) - _l,
            height: (1 + _b) - _t,
            x0: _x0,
            y0: _y0,
            x1: _x1,
            y1: _y1,
            x2: _x2,
            y2: _y2,
            x3: _x3,
            y3: _y3
        };
    };
    
    static page = function(argument0)
    {
        var _old_page = __page;
        var _model = __get_model(false);
        
        if (is_struct(_model))
        {
            if (argument0 < 0)
            {
                __scribble_trace("Warning! Cannot set a text element's page to less than 0");
                __page = 0;
            }
            else if (argument0 > (_model.__get_page_count() - 1))
            {
                __page = _model.__get_page_count() - 1;
                __scribble_trace("Warning! Page ", argument0, " is too big. Valid pages are from 0 to ", __page, " (pages are 0-indexed)");
            }
            else
            {
                __page = argument0;
            }
        }
        else
        {
            __page = 0;
        }
        
        if (_old_page != __page)
            __bbox_dirty = true;
        
        return self;
    };
    
    static get_page = function()
    {
        return __page;
    };
    
    static get_pages = function()
    {
        __scribble_error(".get_pages() has been replaced by .get_page_count()");
    };
    
    static get_page_count = function()
    {
        var _model = __get_model(true);
        
        if (!is_struct(_model))
            return 0;
        
        return _model.__get_page_count();
    };
    
    static on_last_page = function()
    {
        return get_page() >= (get_page_count() - 1);
    };
    
    static get_wrapped = function()
    {
        var _model = __get_model(true);
        
        if (!is_struct(_model))
            return false;
        
        return _model.__get_wrapped();
    };
    
    static get_text = function()
    {
        var _page = (argument_count > 0 && argument[0] != undefined) ? argument[0] : __page;
        var _model = __get_model(true);
        
        if (!is_struct(_model))
            return 0;
        
        return _model.__get_text(_page);
    };
    
    static get_glyph_data = function()
    {
        var _index = argument[0];
        var _page = (argument_count > 1 && argument[1] != undefined) ? argument[1] : __page;
        var _model = __get_model(true);
        
        if (!is_struct(_model))
            return 0;
        
        return _model.__get_glyph_data(_index, _page);
    };
    
    static get_glyph_count = function()
    {
        var _page = (argument_count > 0 && argument[0] != undefined) ? argument[0] : __page;
        var _model = __get_model(true);
        
        if (!is_struct(_model))
            return 0;
        
        return _model.__get_glyph_count(_page);
    };
    
    static get_line_count = function()
    {
        var _page = (argument_count > 0 && argument[0] != undefined) ? argument[0] : __page;
        var _model = __get_model(true);
        
        if (!is_struct(_model))
            return 0;
        
        return _model.__get_line_count(_page);
    };
    
    static pre_update_typist = function(argument0)
    {
        var _function_scope = other;
        
        if (is_struct(argument0))
        {
            with (argument0)
                __tick(other, _function_scope);
        }
        
        return self;
    };
    
    static reveal = function(argument0)
    {
        if (__tw_reveal != argument0)
        {
            __tw_reveal = argument0;
            __tw_reveal_window_array[0] = argument0;
        }
        
        return self;
    };
    
    static get_reveal = function()
    {
        return __tw_reveal;
    };
    
    static animation_tick_speed = function()
    {
        __scribble_error(".animation_tick_speed() has been replaced by .animation_speed()");
    };
    
    static animation_speed = function(argument0)
    {
        __animation_speed = argument0;
        return self;
    };
    
    static get_animation_speed = function()
    {
        return __animation_speed;
    };
    
    static is_animated = function()
    {
        var _model = __get_model(true);
        
        if (!is_struct(_model))
            return false;
        
        return _model.__has_animation;
    };
    
    static animation_sync = function()
    {
        __scribble_error(".animation_sync() has been removed\nPlease get in touch if this feature is essential for your project");
    };
    
    static animation_wave = function()
    {
        __scribble_error(".animation_wave() has been replaced by scribble_anim_wave()");
    };
    
    static animation_shake = function()
    {
        __scribble_error(".animation_wave() has been replaced by scribble_anim_shake()");
    };
    
    static animation_rainbow = function()
    {
        __scribble_error(".animation_rainbow() has been replaced by scribble_anim_rainbow()");
    };
    
    static animation_wobble = function()
    {
        __scribble_error(".animation_wobble() has been replaced by scribble_anim_wobble()");
    };
    
    static animation_pulse = function()
    {
        __scribble_error(".animation_pulse() has been replaced by scribble_anim_pulse()");
    };
    
    static animation_wheel = function()
    {
        __scribble_error(".animation_wheel() has been replaced by scribble_anim_wheel()");
    };
    
    static animation_cycle = function()
    {
        __scribble_error(".animation_cycle() has been replaced by scribble_anim_cycle()");
    };
    
    static animation_jitter = function()
    {
        __scribble_error(".animation_jitter() has been replaced by scribble_anim_jitter()");
    };
    
    static animation_blink = function()
    {
        __scribble_error(".animation_blink() has been replaced by scribble_anim_blink()");
    };
    
    static msdf_shadow = function(argument0, argument1, argument2, argument3, argument4 = 1)
    {
        __msdf_shadow_colour = argument0;
        __msdf_shadow_alpha = argument1;
        __msdf_shadow_xoffset = argument2;
        __msdf_shadow_yoffset = argument3;
        __msdf_shadow_softness = max(0, argument4);
        return self;
    };
    
    static msdf_border = function(argument0, argument1)
    {
        __msdf_border_colour = argument0;
        __msdf_border_thickness = argument1;
        return self;
    };
    
    static msdf_feather = function(argument0)
    {
        __msdf_feather_thickness = argument0;
        return self;
    };
    
    static build = function(argument0)
    {
        static _null = new __scribble_class_null_element();
        
        __freeze = argument0;
        __get_model(true);
        return _null;
    };
    
    static refresh = function()
    {
        var _model = __get_model(false);
        
        if (_model != undefined)
        {
            _model.__flush();
            __get_model(true);
        }
        
        return self;
    };
    
    static flush = function()
    {
        static _null = new __scribble_class_null_element();
        
        if (__flushed)
            return undefined;
        
        variable_struct_remove(__ecache_dict, __cache_name);
        var _array = __ecache_array;
        var _i = 0;
        
        repeat (array_length(_array))
        {
            if (_array[_i] == self)
                array_delete(_array, _i, 1);
            else
                _i++;
        }
        
        __flushed = true;
        return _null;
    };
    
    static get_events = function(argument0, argument1 = __page, argument2 = false)
    {
        static _empty_array = [];
        
        var _model = __get_model(true);
        
        if (!is_struct(_model))
            return _empty_array;
        
        var _page = _model.__pages_array[argument1];
        var _event_struct = argument2 ? _page.__line_events : _page.__char_events;
        var _events = variable_struct_get(_event_struct, argument0);
        
        if (!is_array(_events))
            return _empty_array;
        
        return _events;
    };
    
    static template = function(argument0, argument1 = true)
    {
        if (is_array(argument0))
        {
            if (!argument1 || !is_array(__template) || !array_equals(__template, argument0))
            {
                if (argument1)
                {
                    __template = array_create(array_length(argument0));
                    array_copy(__template, 0, argument0, 0, array_length(argument0));
                }
                else
                {
                    __template = argument0;
                }
                
                var _i = 0;
                
                repeat (array_length(argument0))
                {
                    method(self, argument0[_i])();
                    _i++;
                }
            }
        }
        else if (!argument1 || is_array(__template) || __template != argument0)
        {
            __template = argument0;
            method(self, argument0)();
        }
        
        return self;
    };
    
    static ignore_command_tags = function(argument0)
    {
        if (__ignore_command_tags != argument0)
        {
            __model_cache_name_dirty = true;
            __ignore_command_tags = argument0;
        }
        
        return self;
    };
    
    static randomize_animation = function(argument0)
    {
        if (__randomize_animation != argument0)
        {
            __model_cache_name_dirty = true;
            __randomize_animation = argument0;
        }
        
        return self;
    };
    
    static z = function(argument0)
    {
        __z = argument0;
        return self;
    };
    
    static get_z = function()
    {
        return __z;
    };
    
    static overwrite = function(argument0, argument1 = __unique_id)
    {
        __text = argument0;
        __unique_id = argument1;
        var _new_cache_name = __text + ((argument1 == undefined) ? ":default" : (":" + string(argument1)));
        
        if (__cache_name != _new_cache_name)
        {
            flush();
            __flushed = false;
            __model_cache_name_dirty = true;
            __cache_name = _new_cache_name;
            var _weak = variable_struct_get(__ecache_dict, __cache_name);
            
            if (_weak != undefined && weak_ref_alive(_weak) && !_weak.ref.__flushed)
            {
                __scribble_trace("Warning! Flushing element \"", __cache_name, "\" due to cache name collision (try choosing a different unique ID)");
                _weak.ref.flush();
            }
            
            variable_struct_set(__ecache_dict, __cache_name, weak_ref_create(self));
            array_push(__ecache_array, self);
            array_push(__ecache_name_array, __cache_name);
        }
        
        return self;
    };
    
    static debug_draw_bbox = function(argument0, argument1)
    {
        var _oldColour = draw_get_colour();
        draw_set_colour(c_red);
        
        switch (__starting_halign)
        {
            case 0:
                break;
            
            case 1:
                argument0 -= (__wrap_max_width / 2);
                break;
            
            case 2:
                argument0 -= __wrap_max_width;
                break;
        }
        
        switch (__starting_valign)
        {
            case 0:
                break;
            
            case 1:
                argument1 -= (__wrap_max_height / 2);
                break;
            
            case 2:
                argument1 -= __wrap_max_height;
                break;
        }
        
        draw_rectangle(argument0, argument1, argument0 + __wrap_max_width, argument1 + __wrap_max_height, true);
        draw_rectangle(argument0 + 1, argument1 + 1, (argument0 - 1) + __wrap_max_width, (argument1 - 1) + __wrap_max_height, true);
        draw_set_colour(_oldColour);
        return self;
    };
    
    static __get_model = function(argument0)
    {
        static _mcache_dict = __scribble_get_cache_state().__mcache_dict;
        static _buffer = __scribble_get_buffer_a();
        
        if (__flushed || __text == "")
        {
            __model = undefined;
        }
        else
        {
            if (__model_cache_name_dirty)
            {
                __model_cache_name_dirty = false;
                __bbox_dirty = true;
                __scale_to_box_dirty = true;
                buffer_seek(_buffer, buffer_seek_start, 0);
                buffer_write(_buffer, buffer_text, string(__text));
                buffer_write(_buffer, buffer_u8, 58);
                buffer_write(_buffer, buffer_text, string(__starting_font));
                buffer_write(_buffer, buffer_u8, 58);
                buffer_write(_buffer, buffer_text, string(__starting_colour));
                buffer_write(_buffer, buffer_u8, 58);
                buffer_write(_buffer, buffer_text, string(__starting_halign));
                buffer_write(_buffer, buffer_u8, 58);
                buffer_write(_buffer, buffer_text, string(__starting_valign));
                buffer_write(_buffer, buffer_u8, 58);
                buffer_write(_buffer, buffer_text, string(__pre_scale));
                buffer_write(_buffer, buffer_u8, 58);
                buffer_write(_buffer, buffer_text, string(__line_height_min));
                buffer_write(_buffer, buffer_u8, 58);
                buffer_write(_buffer, buffer_text, string(__line_height_max));
                buffer_write(_buffer, buffer_u8, 58);
                buffer_write(_buffer, buffer_text, string(__line_spacing));
                buffer_write(_buffer, buffer_u8, 58);
                buffer_write(_buffer, buffer_text, string(__wrap_apply));
                buffer_write(_buffer, buffer_u8, 58);
                buffer_write(_buffer, buffer_text, string(__wrap_max_width - (__padding_l + __padding_r)));
                buffer_write(_buffer, buffer_u8, 58);
                buffer_write(_buffer, buffer_text, string(__wrap_max_height - (__padding_t + __padding_b)));
                buffer_write(_buffer, buffer_u8, 58);
                buffer_write(_buffer, buffer_text, string(__wrap_per_char));
                buffer_write(_buffer, buffer_u8, 58);
                buffer_write(_buffer, buffer_text, string(__wrap_no_pages));
                buffer_write(_buffer, buffer_u8, 58);
                buffer_write(_buffer, buffer_text, string(__wrap_max_scale));
                buffer_write(_buffer, buffer_u8, 58);
                buffer_write(_buffer, buffer_text, string(__bezier_array[0]));
                buffer_write(_buffer, buffer_u8, 44);
                buffer_write(_buffer, buffer_text, string(__bezier_array[1]));
                buffer_write(_buffer, buffer_u8, 44);
                buffer_write(_buffer, buffer_text, string(__bezier_array[2]));
                buffer_write(_buffer, buffer_u8, 44);
                buffer_write(_buffer, buffer_text, string(__bezier_array[3]));
                buffer_write(_buffer, buffer_u8, 44);
                buffer_write(_buffer, buffer_text, string(__bezier_array[4]));
                buffer_write(_buffer, buffer_u8, 44);
                buffer_write(_buffer, buffer_text, string(__bezier_array[5]));
                buffer_write(_buffer, buffer_u8, 58);
                buffer_write(_buffer, buffer_text, string(__bidi_hint));
                buffer_write(_buffer, buffer_u8, 58);
                buffer_write(_buffer, buffer_text, string(__ignore_command_tags));
                buffer_write(_buffer, buffer_u8, 58);
                buffer_write(_buffer, buffer_text, string(__randomize_animation));
                buffer_write(_buffer, buffer_u8, 58);
                buffer_write(_buffer, buffer_u8, 0);
                buffer_seek(_buffer, buffer_seek_start, 0);
                __model_cache_name = buffer_read(_buffer, buffer_string);
            }
            
            var _weak = variable_struct_get(_mcache_dict, __model_cache_name);
            
            if (_weak != undefined && weak_ref_alive(_weak) && !_weak.ref.__flushed)
                __model = _weak.ref;
            else if (argument0)
                __model = new __scribble_class_model(self, __model_cache_name);
            else
                __model = undefined;
        }
        
        return __model;
    };
    
    static __set_standard_uniforms = function(argument0, argument1)
    {
        static _u_fTime = shader_get_uniform(__shd_scribble, "u_fTime");
        static _u_vColourBlend = shader_get_uniform(__shd_scribble, "u_vColourBlend");
        static _u_fBlinkState = shader_get_uniform(__shd_scribble, "u_fBlinkState");
        static _u_vGradient = shader_get_uniform(__shd_scribble, "u_vGradient");
        static _u_vSkew = shader_get_uniform(__shd_scribble, "u_vSkew");
        static _u_vFlash = shader_get_uniform(__shd_scribble, "u_vFlash");
        static _u_vRegionActive = shader_get_uniform(__shd_scribble, "u_vRegionActive");
        static _u_vRegionColour = shader_get_uniform(__shd_scribble, "u_vRegionColour");
        static _u_aDataFields = shader_get_uniform(__shd_scribble, "u_aDataFields");
        static _u_aBezier = shader_get_uniform(__shd_scribble, "u_aBezier");
        static _u_iTypewriterUseLines = shader_get_uniform(__shd_scribble, "u_iTypewriterUseLines");
        static _u_iTypewriterMethod = shader_get_uniform(__shd_scribble, "u_iTypewriterMethod");
        static _u_iTypewriterCharMax = shader_get_uniform(__shd_scribble, "u_iTypewriterCharMax");
        static _u_fTypewriterWindowArray = shader_get_uniform(__shd_scribble, "u_fTypewriterWindowArray");
        static _u_fTypewriterSmoothness = shader_get_uniform(__shd_scribble, "u_fTypewriterSmoothness");
        static _u_vTypewriterStartPos = shader_get_uniform(__shd_scribble, "u_vTypewriterStartPos");
        static _u_vTypewriterStartScale = shader_get_uniform(__shd_scribble, "u_vTypewriterStartScale");
        static _u_fTypewriterStartRotation = shader_get_uniform(__shd_scribble, "u_fTypewriterStartRotation");
        static _u_fTypewriterAlphaDuration = shader_get_uniform(__shd_scribble, "u_fTypewriterAlphaDuration");
        static _scribble_state = __scribble_get_state();
        static _anim_properties_array = __scribble_get_anim_properties();
        static _shader_uniforms_dirty = true;
        static _shader_set_to_use_bezier = false;
        static _null_array = array_create(6, 0);
        
        shader_set(__shd_scribble);
        shader_set_uniform_f(_u_fTime, __animation_time);
        var _blend_colour = __blend_colour;
        shader_set_uniform_f(_u_vColourBlend, colour_get_red(_blend_colour) / 255, colour_get_green(_blend_colour) / 255, colour_get_blue(_blend_colour) / 255, __blend_alpha);
        shader_set_uniform_f(_u_fBlinkState, __animation_blink_state);
        
        if (__gradient_alpha != 0 || __skew_x != 0 || __skew_y != 0 || __flash_alpha != 0 || __region_blend != 0)
        {
            _shader_uniforms_dirty = true;
            shader_set_uniform_f(_u_vGradient, colour_get_red(__gradient_colour) / 255, colour_get_green(__gradient_colour) / 255, colour_get_blue(__gradient_colour) / 255, __gradient_alpha);
            shader_set_uniform_f(_u_vSkew, __skew_x, __skew_y);
            shader_set_uniform_f(_u_vFlash, colour_get_red(__flash_colour) / 255, colour_get_green(__flash_colour) / 255, colour_get_blue(__flash_colour) / 255, __flash_alpha);
            shader_set_uniform_f(_u_vRegionActive, __region_glyph_start, __region_glyph_end);
            shader_set_uniform_f(_u_vRegionColour, colour_get_red(__region_colour) / 255, colour_get_green(__region_colour) / 255, colour_get_blue(__region_colour) / 255, __region_blend);
        }
        else if (_shader_uniforms_dirty)
        {
            _shader_uniforms_dirty = false;
            shader_set_uniform_f(_u_vGradient, 0, 0, 0, 0);
            shader_set_uniform_f(_u_vSkew, 0, 0);
            shader_set_uniform_f(_u_vFlash, 0, 0, 0, 0);
            shader_set_uniform_f(_u_vRegionActive, 0, 0);
            shader_set_uniform_f(_u_vRegionColour, 0, 0, 0, 0);
        }
        
        if (_scribble_state.__standard_anim_desync)
        {
            with (_scribble_state)
            {
                __standard_anim_desync = false;
                __standard_anim_default = __standard_anim_desync_to_default;
            }
            
            shader_set_uniform_f_array(_u_aDataFields, _anim_properties_array);
        }
        
        if (__bezier_using)
        {
            _shader_set_to_use_bezier = true;
            shader_set_uniform_f_array(_u_aBezier, __bezier_array);
        }
        else if (_shader_set_to_use_bezier)
        {
            _shader_set_to_use_bezier = false;
            shader_set_uniform_f_array(_u_aBezier, _null_array);
        }
        
        if (argument0 != undefined)
        {
            with (argument0)
            {
                __tick(other, argument1);
                __set_shader_uniforms();
            }
        }
        else if (__tw_reveal != undefined)
        {
            shader_set_uniform_i(_u_iTypewriterUseLines, 0);
            shader_set_uniform_i(_u_iTypewriterMethod, (1 << 0));
            shader_set_uniform_i(_u_iTypewriterCharMax, 0);
            shader_set_uniform_f(_u_fTypewriterSmoothness, 0);
            shader_set_uniform_f(_u_vTypewriterStartPos, 0, 0);
            shader_set_uniform_f(_u_vTypewriterStartScale, 1, 1);
            shader_set_uniform_f(_u_fTypewriterStartRotation, 0);
            shader_set_uniform_f(_u_fTypewriterAlphaDuration, 1);
            shader_set_uniform_f_array(_u_fTypewriterWindowArray, __tw_reveal_window_array);
        }
        else
        {
            shader_set_uniform_i(_u_iTypewriterMethod, (0 << 0));
        }
        
        shader_reset();
    };
    
    static __set_msdf_uniforms = function(argument0, argument1)
    {
        static _msdf_u_fTime = shader_get_uniform(__shd_scribble_msdf, "u_fTime");
        static _msdf_u_vColourBlend = shader_get_uniform(__shd_scribble_msdf, "u_vColourBlend");
        static _msdf_u_fBlinkState = shader_get_uniform(__shd_scribble_msdf, "u_fBlinkState");
        static _msdf_u_vGradient = shader_get_uniform(__shd_scribble_msdf, "u_vGradient");
        static _msdf_u_vSkew = shader_get_uniform(__shd_scribble_msdf, "u_vSkew");
        static _msdf_u_vFlash = shader_get_uniform(__shd_scribble_msdf, "u_vFlash");
        static _msdf_u_vRegionActive = shader_get_uniform(__shd_scribble_msdf, "u_vRegionActive");
        static _msdf_u_vRegionColour = shader_get_uniform(__shd_scribble_msdf, "u_vRegionColour");
        static _msdf_u_aDataFields = shader_get_uniform(__shd_scribble_msdf, "u_aDataFields");
        static _msdf_u_aBezier = shader_get_uniform(__shd_scribble_msdf, "u_aBezier");
        static _msdf_u_iTypewriterUseLines = shader_get_uniform(__shd_scribble_msdf, "u_iTypewriterUseLines");
        static _msdf_u_iTypewriterMethod = shader_get_uniform(__shd_scribble_msdf, "u_iTypewriterMethod");
        static _msdf_u_iTypewriterCharMax = shader_get_uniform(__shd_scribble_msdf, "u_iTypewriterCharMax");
        static _msdf_u_fTypewriterWindowArray = shader_get_uniform(__shd_scribble_msdf, "u_fTypewriterWindowArray");
        static _msdf_u_fTypewriterSmoothness = shader_get_uniform(__shd_scribble_msdf, "u_fTypewriterSmoothness");
        static _msdf_u_vTypewriterStartPos = shader_get_uniform(__shd_scribble_msdf, "u_vTypewriterStartPos");
        static _msdf_u_vTypewriterStartScale = shader_get_uniform(__shd_scribble_msdf, "u_vTypewriterStartScale");
        static _msdf_u_fTypewriterStartRotation = shader_get_uniform(__shd_scribble_msdf, "u_fTypewriterStartRotation");
        static _msdf_u_fTypewriterAlphaDuration = shader_get_uniform(__shd_scribble_msdf, "u_fTypewriterAlphaDuration");
        static _msdf_u_vShadowOffsetAndSoftness = shader_get_uniform(__shd_scribble_msdf, "u_vShadowOffsetAndSoftness");
        static _msdf_u_vShadowColour = shader_get_uniform(__shd_scribble_msdf, "u_vShadowColour");
        static _msdf_u_vBorderColour = shader_get_uniform(__shd_scribble_msdf, "u_vBorderColour");
        static _msdf_u_fBorderThickness = shader_get_uniform(__shd_scribble_msdf, "u_fBorderThickness");
        static _msdf_u_vOutputSize = shader_get_uniform(__shd_scribble_msdf, "u_vOutputSize");
        static _scribble_state = __scribble_get_state();
        static _anim_properties_array = __scribble_get_anim_properties();
        static _shader_uniforms_dirty = true;
        static _shader_set_to_use_bezier = false;
        static _null_array = array_create(6, 0);
        
        shader_set(__shd_scribble_msdf);
        shader_set_uniform_f(_msdf_u_fTime, __animation_time);
        shader_set_uniform_f(_msdf_u_vColourBlend, colour_get_red(__blend_colour) / 255, colour_get_green(__blend_colour) / 255, colour_get_blue(__blend_colour) / 255, __blend_alpha);
        shader_set_uniform_f(_msdf_u_fBlinkState, __animation_blink_state);
        
        if (__gradient_alpha != 0 || __skew_x != 0 || __skew_y != 0 || __flash_alpha != 0 || __region_blend != 0)
        {
            _shader_uniforms_dirty = true;
            shader_set_uniform_f(_msdf_u_vGradient, colour_get_red(__gradient_colour) / 255, colour_get_green(__gradient_colour) / 255, colour_get_blue(__gradient_colour) / 255, __gradient_alpha);
            shader_set_uniform_f(_msdf_u_vSkew, __skew_x, __skew_y);
            shader_set_uniform_f(_msdf_u_vFlash, colour_get_red(__flash_colour) / 255, colour_get_green(__flash_colour) / 255, colour_get_blue(__flash_colour) / 255, __flash_alpha);
            shader_set_uniform_f(_msdf_u_vRegionActive, __region_glyph_start, __region_glyph_end);
            shader_set_uniform_f(_msdf_u_vRegionColour, colour_get_red(__region_colour) / 255, colour_get_green(__region_colour) / 255, colour_get_blue(__region_colour) / 255, __region_blend);
        }
        else if (_shader_uniforms_dirty)
        {
            _shader_uniforms_dirty = false;
            shader_set_uniform_f(_msdf_u_vGradient, 0, 0, 0, 0);
            shader_set_uniform_f(_msdf_u_vSkew, 0, 0);
            shader_set_uniform_f(_msdf_u_vFlash, 0, 0, 0, 0);
            shader_set_uniform_f(_msdf_u_vRegionActive, 0, 0);
            shader_set_uniform_f(_msdf_u_vRegionColour, 0, 0, 0, 0);
        }
        
        if (_scribble_state.__msdf_anim_desync)
        {
            with (_scribble_state)
            {
                __msdf_anim_desync = false;
                __msdf_anim_default = __msdf_anim_desync_to_default;
            }
            
            shader_set_uniform_f_array(_msdf_u_aDataFields, _anim_properties_array);
        }
        
        if (__bezier_using)
        {
            _shader_set_to_use_bezier = true;
            shader_set_uniform_f_array(_msdf_u_aBezier, __bezier_array);
        }
        else if (_shader_set_to_use_bezier)
        {
            _shader_set_to_use_bezier = false;
            shader_set_uniform_f_array(_msdf_u_aBezier, _null_array);
        }
        
        if (argument0 != undefined)
        {
            with (argument0)
            {
                __tick(other, argument1);
                __set_msdf_shader_uniforms();
            }
        }
        else if (__tw_reveal != undefined)
        {
            shader_set_uniform_i(_msdf_u_iTypewriterUseLines, 0);
            shader_set_uniform_i(_msdf_u_iTypewriterMethod, (1 << 0));
            shader_set_uniform_i(_msdf_u_iTypewriterCharMax, 0);
            shader_set_uniform_f(_msdf_u_fTypewriterSmoothness, 0);
            shader_set_uniform_f(_msdf_u_vTypewriterStartPos, 0, 0);
            shader_set_uniform_f(_msdf_u_vTypewriterStartScale, 1, 1);
            shader_set_uniform_f(_msdf_u_fTypewriterStartRotation, 0);
            shader_set_uniform_f(_msdf_u_fTypewriterAlphaDuration, 1);
            shader_set_uniform_f_array(_msdf_u_fTypewriterWindowArray, __tw_reveal_window_array);
        }
        else
        {
            shader_set_uniform_i(_msdf_u_iTypewriterMethod, (0 << 0));
        }
        
        shader_set_uniform_f(_msdf_u_vShadowOffsetAndSoftness, __msdf_shadow_xoffset, __msdf_shadow_yoffset, __msdf_shadow_softness);
        shader_set_uniform_f(_msdf_u_vShadowColour, colour_get_red(__msdf_shadow_colour) / 255, colour_get_green(__msdf_shadow_colour) / 255, colour_get_blue(__msdf_shadow_colour) / 255, __msdf_shadow_alpha);
        shader_set_uniform_f(_msdf_u_vBorderColour, colour_get_red(__msdf_border_colour) / 255, colour_get_green(__msdf_border_colour) / 255, colour_get_blue(__msdf_border_colour) / 255);
        shader_set_uniform_f(_msdf_u_fBorderThickness, __msdf_border_thickness);
        var _surface = surface_get_target();
        var _surface_width, _surface_height;
        
        if (_surface >= 0)
        {
            _surface_width = surface_get_width(_surface);
            _surface_height = surface_get_height(_surface);
        }
        else
        {
            _surface_width = window_get_width();
            _surface_height = window_get_height();
        }
        
        shader_set_uniform_f(_msdf_u_vOutputSize, _surface_width, _surface_height);
        shader_reset();
    };
    
    static __update_scale_to_box_scale = function()
    {
        if (!__scale_to_box_dirty)
            exit;
        
        __scale_to_box_dirty = false;
        var _model = __get_model(true);
        var _xscale = 1;
        var _yscale = 1;
        
        if (__scale_to_box_width > 0)
            _xscale = __scale_to_box_width / (_model.__get_width() + __padding_l + __padding_r);
        
        if (__scale_to_box_height > 0)
            _yscale = __scale_to_box_height / (_model.__get_height() + __padding_t + __padding_b);
        
        var _previous_scale_to_box_scale = __scale_to_box_scale;
        __scale_to_box_scale = min(_xscale, _yscale);
        
        if (!__scale_to_box_maximise)
            __scale_to_box_scale = min(1, __scale_to_box_scale);
        
        if (__scale_to_box_scale != _previous_scale_to_box_scale)
        {
            __matrix_dirty = true;
            __bbox_dirty = true;
        }
    };
    
    static __update_matrix = function(argument0, argument1, argument2)
    {
        __update_scale_to_box_scale();
        
        if (__matrix_dirty || __matrix_x != argument1 || __matrix_y != argument2)
        {
            __matrix_dirty = false;
            __matrix_inverse = undefined;
            __matrix_x = argument1;
            __matrix_y = argument2;
            var _x_offset = -__origin_x;
            var _y_offset = -__origin_y;
            var _xscale = __scale_to_box_scale * argument0.__fit_scale * __post_xscale;
            var _yscale = __scale_to_box_scale * argument0.__fit_scale * __post_yscale;
            var _angle = __post_angle;
            
            if (!argument0.__pad_bbox_l)
                _x_offset += __padding_l;
            
            if (!argument0.__pad_bbox_t)
                _y_offset += __padding_t;
            
            if (!argument0.__pad_bbox_r)
                _x_offset -= __padding_r;
            
            if (!argument0.__pad_bbox_b)
                _y_offset -= __padding_b;
            
            if (_xscale == 1 && _yscale == 1 && _angle == 0)
                __matrix = matrix_build(_x_offset + argument1, _y_offset + argument2, __z, 0, 0, 0, 1, 1, 1);
            else
                __matrix = matrix_multiply(matrix_build(_x_offset, _y_offset, 0, 0, 0, 0, 1, 1, 1), matrix_multiply(matrix_build(0, 0, 0, 0, 0, 0, _xscale, _yscale, 1), matrix_multiply(matrix_build(0, 0, 0, 0, 0, __post_angle, 1, 1, 1), matrix_build(argument1, argument2, __z, 0, 0, 0, 1, 1, 1))));
        }
        
        return __matrix;
    };
    
    static typewriter_off = function()
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        
        if (__tw_legacy_typist_use)
            __tw_legacy_typist.reset();
        
        __tw_legacy_typist_use = false;
        return self;
    };
    
    static typewriter_reset = function()
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        __tw_legacy_typist = scribble_typist();
        __tw_legacy_typist.__associate(self);
        return self;
    };
    
    static typewriter_in = function(argument0, argument1)
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        __tw_legacy_typist_use = true;
        __tw_legacy_typist.in(argument0, argument1);
        return self;
    };
    
    static typewriter_out = function(argument0, argument1, argument2 = false)
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        __tw_legacy_typist_use = true;
        __tw_legacy_typist.out(argument0, argument1, argument2);
        return self;
    };
    
    static typewriter_skip = function()
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        __tw_legacy_typist.skip();
        return self;
    };
    
    static typewriter_sound = function(argument0, argument1, argument2, argument3)
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        __tw_legacy_typist.sound(argument0, argument1, argument2, argument3);
        return self;
    };
    
    static typewriter_sound_per_char = function(argument0, argument1, argument2)
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        __tw_legacy_typist.sound_per_char(argument0, argument1, argument2);
        return self;
    };
    
    static typewriter_function = function(argument0)
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        __tw_legacy_typist.function_per_char(argument0);
        return self;
    };
    
    static typewriter_pause = function()
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        __tw_legacy_typist.pause();
        return self;
    };
    
    static typewriter_unpause = function()
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        __tw_legacy_typist.unpause();
        return self;
    };
    
    static typewriter_ease = function(argument0, argument1, argument2, argument3, argument4, argument5, argument6)
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        __tw_legacy_typist.ease(argument0, argument1, argument2, argument3, argument4, argument5, argument6);
        return self;
    };
    
    static get_typewriter_state = function()
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        
        if (!__tw_legacy_typist_use)
            return 1;
        
        return __tw_legacy_typist.get_state();
    };
    
    static get_typewriter_paused = function()
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        
        if (!__tw_legacy_typist_use)
            return false;
        
        return __tw_legacy_typist.get_paused();
    };
    
    static get_typewriter_pos = function()
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        
        if (!__tw_legacy_typist_use)
            return 0;
        
        return __tw_legacy_typist.get_position();
    };
    
    __text = argument0;
    __unique_id = argument1;
    __cache_name = argument0 + ((argument1 == undefined) ? ":default" : (":" + string(argument1)));
    var _weak = variable_struct_get(__ecache_dict, __cache_name);
    
    if (_weak != undefined && weak_ref_alive(_weak) && !_weak.ref.__flushed)
    {
        __scribble_trace("Warning! Flushing element \"", __cache_name, "\" due to cache name collision");
        _weak.ref.flush();
    }
    
    variable_struct_set(__ecache_dict, __cache_name, weak_ref_create(self));
    array_push(__ecache_array, self);
    array_push(__ecache_name_array, __cache_name);
    __flushed = false;
    __model_cache_name_dirty = true;
    __model_cache_name = undefined;
    __model = undefined;
    __last_drawn = __scribble_state.__frames;
    __freeze = false;
    __starting_font = __scribble_state.__default_font;
    __starting_colour = __scribble_process_colour(16777215);
    __starting_halign = 0;
    __starting_valign = 0;
    __blend_colour = 16777215;
    __blend_alpha = 1;
    __skew_x = 0;
    __skew_y = 0;
    __gradient_colour = 0;
    __gradient_alpha = 0;
    __flash_colour = 16777215;
    __flash_alpha = 0;
    __randomize_animation = false;
    __origin_x = 0;
    __origin_y = 0;
    __pre_scale = 1;
    __post_xscale = 1;
    __post_yscale = 1;
    __post_angle = 0;
    __matrix_dirty = true;
    __matrix = undefined;
    __matrix_inverse = undefined;
    __matrix_x = undefined;
    __matrix_y = undefined;
    __wrap_apply = false;
    __wrap_max_width = -1;
    __wrap_max_height = -1;
    __wrap_per_char = false;
    __wrap_no_pages = false;
    __wrap_max_scale = 1;
    __scale_to_box_dirty = true;
    __scale_to_box_width = 0;
    __scale_to_box_height = 0;
    __scale_to_box_maximise = false;
    __scale_to_box_scale = undefined;
    __line_height_min = -1;
    __line_height_max = -1;
    __line_spacing = "100%";
    __page = 0;
    __ignore_command_tags = false;
    __template = undefined;
    __bezier_array = array_create(6, 0);
    __bezier_using = false;
    __tw_reveal = undefined;
    __tw_reveal_window_array = array_create(6, 0);
    __animation_time = current_time;
    __animation_speed = 1;
    __animation_blink_state = true;
    __padding_l = 0;
    __padding_t = 0;
    __padding_r = 0;
    __padding_b = 0;
    __msdf_shadow_colour = 0;
    __msdf_shadow_alpha = 0;
    __msdf_shadow_xoffset = 0;
    __msdf_shadow_yoffset = 0;
    __msdf_shadow_softness = 0;
    __msdf_border_colour = 0;
    __msdf_border_thickness = 0;
    __msdf_feather_thickness = 1;
    __bidi_hint = undefined;
    __z = 0;
    __region_active = undefined;
    __region_glyph_start = 0;
    __region_glyph_end = 0;
    __region_colour = 0;
    __region_blend = 0;
    __bbox_dirty = true;
    __bbox_matrix = undefined;
    __bbox_raw_width = 1;
    __bbox_raw_height = 1;
    __bbox_aabb_left = 0;
    __bbox_aabb_top = 0;
    __bbox_aabb_right = 0;
    __bbox_aabb_bottom = 0;
    __bbox_aabb_width = 1;
    __bbox_aabb_height = 1;
    __bbox_obb_x0 = 0;
    __bbox_obb_y0 = 0;
    __bbox_obb_x1 = 0;
    __bbox_obb_y1 = 0;
    __bbox_obb_x2 = 0;
    __bbox_obb_y2 = 0;
    __bbox_obb_x3 = 0;
    __bbox_obb_y3 = 0;
}
