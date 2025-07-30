function __scribble_class_font(argument0, argument1, argument2) constructor
{
    static _font_data_map = __scribble_get_font_data_map();
    
    static __copy_to = function(argument0, argument1)
    {
        var _names = variable_struct_get_names(self);
        var _i = 0;
        
        repeat (array_length(_names))
        {
            var _name = _names[_i];
            
            if (_name == "__glyphs_map")
                ds_map_copy(argument0.__glyphs_map, __glyphs_map);
            else if (_name == "__glyph_data_grid")
                ds_grid_copy(argument0.__glyph_data_grid, __glyph_data_grid);
            else if (_name != "__name" && (argument1 || (_name != "__style_regular" && _name != "__style_bold" && _name != "__style_italic" && _name != "__style_bold_italic")))
                variable_struct_set(argument0, _name, variable_struct_get(self, _name));
            
            _i++;
        }
    };
    
    static __calculate_font_height = function()
    {
        __height = ds_grid_get(__glyph_data_grid, ds_map_find_value(__glyphs_map, 32), (6 << 0));
        return __height;
    };
    
    static __clear = function()
    {
        if (!__superfont)
            __scribble_error("Cannot clear non-superfont fonts");
        
        ds_map_clear(__glyphs_map);
        __msdf_pxrange = undefined;
        __msdf = undefined;
        __height = 0;
    };
    
    static __destroy = function()
    {
        static _font_data_map = __scribble_get_font_data_map();
        
        ds_map_destroy(__glyphs_map);
        ds_grid_destroy(__glyph_data_grid);
        ds_map_delete(_font_data_map, __name);
        
        if (__source_sprite != undefined)
        {
            sprite_delete(__source_sprite);
            __source_sprite = undefined;
        }
    };
    
    __name = argument0;
    ds_map_set(_font_data_map, argument0, self);
    __glyph_data_grid = ds_grid_create(argument1, (19 << 0));
    __glyphs_map = ds_map_create();
    __kerning_map = ds_map_create();
    __is_krutidev = false;
    __msdf = argument2;
    __msdf_pxrange = undefined;
    __superfont = false;
    __runtime = false;
    __source_sprite = undefined;
    __scale = 1;
    __height = 0;
    __style_regular = undefined;
    __style_bold = undefined;
    __style_italic = undefined;
    __style_bold_italic = undefined;
}
