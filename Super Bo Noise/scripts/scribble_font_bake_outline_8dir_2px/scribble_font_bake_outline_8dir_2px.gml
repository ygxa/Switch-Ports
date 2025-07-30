function scribble_font_bake_outline_8dir_2px(argument0, argument1, argument2, argument3, argument4 = undefined)
{
    static _colors_struct = __scribble_config_colours();
    
    if (is_string(argument2))
    {
        var _found = variable_struct_get(_colors_struct, argument2);
        
        if (argument2 == undefined)
        {
            __scribble_error("Colour \"", argument2, "\" not recognised");
            exit;
        }
        
        argument2 = _found & 16777215;
    }
    
    shader_set(__shd_scribble_bake_outline_8dir_2px);
    shader_set_uniform_f(shader_get_uniform(shader_current(), "u_vOutlineColor"), color_get_red(argument2) / 255, color_get_green(argument2) / 255, color_get_blue(argument2) / 255);
    shader_reset();
    scribble_font_bake_shader(argument0, argument1, __shd_scribble_bake_outline_8dir_2px, 2, 2, 2, 2, 2, 2, argument3, argument4);
}
