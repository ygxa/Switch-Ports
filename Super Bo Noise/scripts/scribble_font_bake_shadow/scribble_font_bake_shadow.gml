function scribble_font_bake_shadow(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7)
{
    if (is_string(argument4))
    {
        var _colors_struct = __scribble_config_colours();
        var _found = variable_struct_get(_colors_struct, argument4);
        
        if (argument4 == undefined)
        {
            __scribble_error("Colour \"", argument4, "\" not recognised");
            exit;
        }
        
        argument4 = _found & 16777215;
    }
    
    shader_set(__shd_scribble_bake_shadow);
    shader_set_uniform_f(shader_get_uniform(shader_current(), "u_vShadowDelta"), argument2, argument3);
    shader_set_uniform_f(shader_get_uniform(shader_current(), "u_vShadowColor"), color_get_red(argument4) / 255, color_get_green(argument4) / 255, color_get_blue(argument4) / 255, argument5);
    shader_reset();
    scribble_font_bake_shader(argument0, argument1, __shd_scribble_bake_shadow, 2, max(0, -argument2), max(0, -argument2), max(0, argument2), max(0, argument3), argument6, argument7);
}
