application_surface_draw_enable(false);
var appa = 1;

if (global.screenmelt && global.panic)
    appa = lerp(1, 0.45, global.wave / global.maxwave);

if (!surface_exists(final_application_surface))
    final_application_surface = surface_create(960, 540);

var shader = -4;

if (global.panic && global.minutes <= 1)
    shader = 5;
else
    shader = -4;

surface_set_target(final_application_surface);
shader_set(shd_premulti);
gpu_set_blendmode_ext(bm_max, bm_inv_src_alpha);
draw_surface_stretched_ext(application_surface, 0, 0, 960, 540, c_white, appa);
gpu_set_blendmode(bm_normal);
shader_reset();
surface_reset_target();

if (shader != -4)
{
    shader_set(shader);
    var fade = shader_get_uniform(shader, "fade");
    shader_set_uniform_f(fade, greyscalefade);
    draw_surface_stretched_ext(final_application_surface, 0, 0, 960, 540, c_white, 1);
    shader_reset();
}
else
{
    draw_surface_stretched_ext(final_application_surface, 0, 0, 960, 540, c_white, 1);
}
