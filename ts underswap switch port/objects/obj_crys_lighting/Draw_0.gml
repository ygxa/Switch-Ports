if (followX == undefined)
{
    with (obj_player)
    {
        other.followX = x;
        other.followY = y;
    }
}

var alpha = vignetteAlpha;

with (obj_dodgemode_handler)
    alpha *= (1 - self.alpha);

if (global.use_shaders && alpha > 0)
{
    shader_set(shd_vignette);
    
    if (vignetteFollow)
    {
        shader_set_uniform_f(shader_get_uniform(shd_vignette, "xmult"), 0.7);
        shader_set_uniform_f(shader_get_uniform(shd_vignette, "ymult"), 1);
        shader_set_uniform_f(shader_get_uniform(shd_vignette, "amult"), 0.006 + (0.001 * sin(vignetteSiner)));
        shader_set_uniform_f_array(shader_get_uniform(shd_vignette, "center"), [followX, followY]);
    }
    else
    {
        shader_set_uniform_f(shader_get_uniform(shd_vignette, "xmult"), 0.7);
        shader_set_uniform_f(shader_get_uniform(shd_vignette, "ymult"), 1);
        shader_set_uniform_f(shader_get_uniform(shd_vignette, "amult"), 0.006 + (0.001 * sin(vignetteSiner)));
        shader_set_uniform_f_array(shader_get_uniform(shd_vignette, "center"), [camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) * 0.5), camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) * 0.5)]);
    }
    
    draw_rectangle_pix(camera_get_view_x(view_camera[0]) - 4, camera_get_view_y(view_camera[0]) - 4, camera_get_view_width(view_camera[0]) + 8, camera_get_view_height(view_camera[0]) + 8, 0, alpha);
    shader_reset();
}
