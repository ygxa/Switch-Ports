function __scribble_class_model(argument0, argument1) constructor
{
    static __scribble_state = __scribble_get_state();
    static __mcache_dict = __scribble_get_cache_state().__mcache_dict;
    static __mcache_name_array = __scribble_get_cache_state().__mcache_name_array;
    
    static __submit = function(argument0, argument1)
    {
        if (__flushed)
            return undefined;
        
        __last_drawn = __scribble_state.__frames;
        __pages_array[argument0].__submit((false || __has_arabic || __has_thai) && argument1);
    };
    
    static __freeze = function()
    {
        if (!__frozen)
        {
            var _i = 0;
            
            repeat (__pages)
            {
                __pages_array[_i].__freeze();
                _i++;
            }
            
            __frozen = true;
        }
    };
    
    static __flush = function()
    {
        if (__flushed)
            return undefined;
        
        __reset();
        variable_struct_remove(__mcache_dict, __cache_name);
        __flushed = true;
    };
    
    static __reset = function()
    {
        var _i = 0;
        
        repeat (__pages)
        {
            __pages_array[_i].__flush();
            _i++;
        }
        
        __pages = 0;
        __width = 0;
        __height = 0;
        __min_x = 0;
        __min_y = 0;
        __max_x = 0;
        __max_y = 0;
        __valign = undefined;
        __fit_scale = 1;
        __pages_array = [];
    };
    
    static __get_bbox = function(argument0, argument1, argument2, argument3, argument4)
    {
        var _left, _right, _top, _bottom;
        
        if (argument0 != undefined)
        {
            if (argument0 < 0)
                __scribble_error("Page index ", argument0, " doesn't exist. Minimum page index is 0");
            
            if (argument0 >= __pages)
                __scribble_error("Page index ", argument0, " doesn't exist. Maximum page index is ", __pages - 1);
            
            var _page_data = __pages_array[argument0];
            _left = _page_data.__min_x;
            _top = _page_data.__min_y;
            _right = _page_data.__max_x;
            _bottom = _page_data.__max_y;
        }
        else
        {
            _left = __min_x;
            _top = __min_y;
            _right = __max_x;
            _bottom = __max_y;
        }
        
        if (__pad_bbox_l)
            _left -= argument1;
        else
            _right += argument1;
        
        if (__pad_bbox_t)
            _top -= argument2;
        else
            _bottom += argument2;
        
        if (__pad_bbox_r)
            _right += argument3;
        else
            _left -= argument3;
        
        if (__pad_bbox_b)
            _bottom += argument4;
        else
            _top -= argument4;
        
        return 
        {
            left: _left,
            top: _top,
            right: _right,
            bottom: _bottom
        };
    };
    
    static __get_bbox_revealed = function(argument0, argument1, argument2, argument3, argument4, argument5, argument6)
    {
        __scribble_error("Getting the revealed glyph bounding box requires SCRIBBLE_ALLOW_GLYPH_DATA_GETTER to be set to <true>");
        var _glyph_grid = __get_glyph_data_grid(argument0);
        var _start = argument1 - 1;
        var _end = argument2 - 1;
        var _left, _right, _top, _bottom;
        
        if (_end < 0)
        {
            _left = ds_grid_get(_glyph_grid, 0, 1);
            _top = ds_grid_get(_glyph_grid, 0, 2);
            _right = ds_grid_get(_glyph_grid, 0, 1);
            _bottom = ds_grid_get(_glyph_grid, 0, 4);
        }
        else
        {
            _left = ds_grid_get_min(_glyph_grid, _start, 1, _end, 1);
            _top = ds_grid_get_min(_glyph_grid, _start, 2, _end, 2);
            _right = ds_grid_get_max(_glyph_grid, _start, 3, _end, 3);
            _bottom = ds_grid_get_max(_glyph_grid, _start, 4, _end, 4);
        }
        
        if (__pad_bbox_l)
            _left -= argument3;
        else
            _right += argument3;
        
        if (__pad_bbox_t)
            _top -= argument4;
        else
            _bottom += argument4;
        
        if (__pad_bbox_r)
            _right += argument5;
        else
            _left -= argument5;
        
        if (__pad_bbox_b)
            _bottom += argument6;
        else
            _bottom -= argument6;
        
        return 
        {
            left: _left,
            top: _top,
            right: _right,
            bottom: _bottom
        };
    };
    
    static __get_width = function(argument0)
    {
        return __fit_scale * __width;
    };
    
    static __get_height = function(argument0)
    {
        return __fit_scale * __height;
    };
    
    static __get_page_array = function()
    {
        return __pages_array;
    };
    
    static __get_page_count = function()
    {
        return __pages;
    };
    
    static __get_text = function(argument0)
    {
        if (argument0 < 0)
            __scribble_error("Page index ", argument0, " doesn't exist. Minimum page index is 0");
        
        if (argument0 >= __pages)
            __scribble_error("Page index ", argument0, " doesn't exist. Maximum page index is ", __pages - 1);
        
        __scribble_error("Cannot get text, SCRIBBLE_ALLOW_TEXT_GETTER = <false>\nPlease set SCRIBBLE_ALLOW_TEXT_GETTER to <true> to get text");
        return __pages_array[argument0].__text;
    };
    
    static __get_glyph_data = function(argument0, argument1)
    {
        if (argument1 < 0)
            __scribble_error("Page index ", argument1, " doesn't exist. Minimum page index is 0");
        
        if (argument1 >= __pages)
            __scribble_error("Page index ", argument1, " doesn't exist. Maximum page index is ", __pages - 1);
        
        return __pages_array[argument1].__get_glyph_data(argument0);
    };
    
    static __get_wrapped = function()
    {
        return __wrapped;
    };
    
    static __get_line_count = function(argument0)
    {
        if (argument0 < 0)
            __scribble_error("Page index ", argument0, " doesn't exist. Minimum page index is 0");
        
        if (argument0 >= __pages)
            __scribble_error("Page index ", argument0, " doesn't exist. Maximum page index is ", __pages - 1);
        
        return __pages_array[argument0].__line_count;
    };
    
    static __get_glyph_count = function(argument0)
    {
        if (argument0 < 0)
            __scribble_error("Page index ", argument0, " doesn't exist. Minimum page index is 0");
        
        if (argument0 >= __pages)
            __scribble_error("Page index ", argument0, " doesn't exist. Maximum page index is ", __pages - 1);
        
        return __pages_array[argument0].__glyph_count - 1;
    };
    
    static __get_glyph_data_grid = function(argument0)
    {
        if (argument0 < 0)
            __scribble_error("Page index ", argument0, " doesn't exist. Minimum page index is 0");
        
        if (argument0 >= __pages)
            __scribble_error("Page index ", argument0, " doesn't exist. Maximum page index is ", __pages - 1);
        
        __scribble_error("Getting glyph data requires SCRIBBLE_ALLOW_GLYPH_DATA_GETTER to be set to <true>");
        return __pages_array[argument0].__glyph_grid;
    };
    
    static __new_page = function()
    {
        var _page_data = new __scribble_class_page();
        array_push(__pages_array, _page_data);
        __pages++;
        return _page_data;
    };
    
    static __finalize_vertex_buffers = function(argument0)
    {
        var _i = 0;
        
        repeat (array_length(__pages_array))
        {
            __pages_array[_i].__finalize_vertex_buffers(argument0);
            _i++;
        }
    };
    
    static _generator_state = __scribble_get_generator_state();
    
    __cache_name = argument1;
    var _weak = variable_struct_get(__mcache_dict, __cache_name);
    
    if (_weak != undefined && weak_ref_alive(_weak) && !_weak.ref.__flushed)
    {
        __scribble_trace("Warning! Rebuilding model \"", __cache_name, "\"");
        _weak.ref.__flush();
    }
    
    variable_struct_set(__mcache_dict, __cache_name, weak_ref_create(self));
    array_push(__mcache_name_array, __cache_name);
    __last_drawn = __scribble_state.__frames;
    __frozen = undefined;
    __flushed = false;
    __pages = 0;
    __width = 0;
    __height = 0;
    __min_x = 0;
    __min_y = 0;
    __max_x = 0;
    __max_y = 0;
    __valign = undefined;
    __fit_scale = 1;
    __wrapped = false;
    __pad_bbox_l = false;
    __pad_bbox_t = false;
    __pad_bbox_r = false;
    __pad_bbox_b = false;
    __has_r2l = false;
    __has_arabic = false;
    __has_thai = false;
    __has_hebrew = false;
    __has_devanagari = false;
    __has_animation = false;
    __pages_array = [];
    
    with (_generator_state)
    {
        __Reset();
        __element = argument0;
        __overall_bidi = argument0.__bidi_hint;
    }
    
    __scribble_gen_1_model_limits_and_bezier_curves();
    __scribble_gen_2_parser();
    __scribble_gen_3_devanagari();
    __scribble_gen_4_build_words();
    __scribble_gen_5_finalize_bidi();
    __scribble_gen_6_build_lines();
    __scribble_gen_7_build_pages();
    __scribble_gen_8_position_glyphs();
    __scribble_gen_9_write_vbuffs();
    __scribble_gen_10_set_padding_flags();
}
