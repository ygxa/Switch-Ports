function __scribble_class_page() constructor
{
    static __scribble_state = __scribble_get_state();
    static __gc_vbuff_refs = __scribble_get_cache_state().__gc_vbuff_refs;
    static __gc_vbuff_ids = __scribble_get_cache_state().__gc_vbuff_ids;
    
    static __submit = function(argument0)
    {
        static _u_vTexel = shader_get_uniform(__shd_scribble, "u_vTexel");
        static _u_fSDFRange = shader_get_uniform(__shd_scribble, "u_fSDFRange");
        static _u_fSDFThicknessOffset = shader_get_uniform(__shd_scribble, "u_fSDFThicknessOffset");
        static _u_fSecondDraw = shader_get_uniform(__shd_scribble, "u_fSecondDraw");
        static _u_fSDF = shader_get_uniform(__shd_scribble, "u_fSDF");
        
        if (true && !__frozen && __created_frame < __scribble_state.__frames)
            __freeze();
        
        var _i = 0;
        
        repeat (array_length(__vertex_buffer_array))
        {
            var _data = __vertex_buffer_array[_i];
            var _bilinear = _data[8];
            var _old_tex_filter;
            
            if (_bilinear != undefined)
            {
                _old_tex_filter = gpu_get_tex_filter();
                gpu_set_tex_filter(_bilinear);
            }
            
            if (_data[6])
            {
                shader_set_uniform_f(_u_fSDF, 1);
                shader_set_uniform_f(_u_vTexel, _data[4], _data[5]);
                shader_set_uniform_f(_u_fSDFRange, _data[2] ?? 0);
                shader_set_uniform_f(_u_fSDFThicknessOffset, __scribble_state.__sdf_thickness_offset + (_data[3] ?? 0));
                vertex_submit(_data[0], pr_trianglelist, _data[1]);
                
                if (argument0)
                {
                    shader_set_uniform_f(_u_fSecondDraw, 1);
                    vertex_submit(_data[0], pr_trianglelist, _data[1]);
                    shader_set_uniform_f(_u_fSecondDraw, 0);
                }
            }
            else
            {
                shader_set_uniform_f(_u_fSDF, 0);
                vertex_submit(_data[0], pr_trianglelist, _data[1]);
            }
            
            if (_bilinear != undefined)
                gpu_set_tex_filter(_old_tex_filter);
            
            _i++;
        }
    };
    
    static __freeze = function()
    {
        if (!__frozen)
        {
            var _i = 0;
            
            repeat (array_length(__vertex_buffer_array))
            {
                vertex_freeze(__vertex_buffer_array[_i][0]);
                _i++;
            }
            
            __frozen = true;
        }
    };
    
    static __get_glyph_data = function(argument0)
    {
        __scribble_error("Cannot get glyph data, SCRIBBLE_ALLOW_GLYPH_DATA_GETTER = <false>\nPlease set SCRIBBLE_ALLOW_GLYPH_DATA_GETTER to <true> to get glyph data");
        
        if (argument0 < 0)
        {
            return 
            {
                unicode: 0,
                left: ds_grid_get(__glyph_grid, 0, 1),
                top: ds_grid_get(__glyph_grid, 0, 2),
                right: ds_grid_get(__glyph_grid, 0, 1),
                bottom: ds_grid_get(__glyph_grid, 0, 4)
            };
        }
        else
        {
            argument0 = min(argument0, __glyph_count - 1);
            return 
            {
                unicode: ds_grid_get(__glyph_grid, argument0, 0),
                left: ds_grid_get(__glyph_grid, argument0, 1),
                top: ds_grid_get(__glyph_grid, argument0, 2),
                right: ds_grid_get(__glyph_grid, argument0, 3),
                bottom: ds_grid_get(__glyph_grid, argument0, 4)
            };
        }
    };
    
    static __get_vertex_buffer = function(argument0, argument1, argument2, argument3, argument4)
    {
        static _vertex_format = undefined;
        
        var _pointer_string = string(argument0);
        var _data = variable_struct_get(__texture_to_vertex_buffer_dict, _pointer_string);
        
        if (_data == undefined)
        {
            if (_vertex_format == undefined)
            {
                vertex_format_begin();
                vertex_format_add_position_3d();
                vertex_format_add_normal();
                vertex_format_add_colour();
                vertex_format_add_texcoord();
                vertex_format_add_custom(vertex_type_float2, vertex_usage_color);
                _vertex_format = vertex_format_end();
            }
            
            var _vbuff = vertex_create_buffer();
            vertex_begin(_vbuff, _vertex_format);
            array_push(__gc_vbuff_refs, weak_ref_create(self));
            array_push(__gc_vbuff_ids, _vbuff);
            _data = array_create(9);
            _data[0] = _vbuff;
            _data[1] = argument0;
            _data[2] = argument1;
            _data[3] = argument2;
            _data[4] = texture_get_texel_width(argument0);
            _data[5] = texture_get_texel_height(argument0);
            _data[6] = argument1 != undefined;
            _data[8] = argument3;
            __vertex_buffer_array[array_length(__vertex_buffer_array)] = _data;
            variable_struct_set(__texture_to_vertex_buffer_dict, _pointer_string, _data);
            return _vbuff;
        }
        else
        {
            return _data[0];
        }
    };
    
    static __finalize_vertex_buffers = function(argument0)
    {
        var _i = 0;
        
        repeat (array_length(__vertex_buffer_array))
        {
            var _vbuff = __vertex_buffer_array[_i][0];
            vertex_end(_vbuff);
            
            if (argument0)
                vertex_freeze(_vbuff);
            
            _i++;
        }
        
        __frozen = argument0;
    };
    
    static __flush = function()
    {
        var _i = 0;
        
        repeat (array_length(__vertex_buffer_array))
        {
            var _vbuff = __vertex_buffer_array[_i][0];
            vertex_delete_buffer(_vbuff);
            var _index = __scribble_array_find_index(__gc_vbuff_ids, _vbuff);
            
            if (_index >= 0)
            {
                array_delete(__gc_vbuff_refs, _index, 1);
                array_delete(__gc_vbuff_ids, _index, 1);
            }
            
            _i++;
        }
        
        __texture_to_vertex_buffer_dict = {};
        array_resize(__vertex_buffer_array, 0);
    };
    
    __text = "";
    __glyph_grid = undefined;
    __created_frame = __scribble_state.__frames;
    __frozen = undefined;
    __character_count = 0;
    __glyph_start = undefined;
    __glyph_end = undefined;
    __glyph_count = 0;
    __line_start = undefined;
    __line_end = undefined;
    __line_count = 0;
    __width = 0;
    __height = 0;
    __min_x = 0;
    __min_y = 0;
    __max_x = 0;
    __max_y = 0;
    __vertex_buffer_array = [];
    __texture_to_vertex_buffer_dict = {};
    __char_events = {};
    __line_events = {};
    __region_array = [];
}
