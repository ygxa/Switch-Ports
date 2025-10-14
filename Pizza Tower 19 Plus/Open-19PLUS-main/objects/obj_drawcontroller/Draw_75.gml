shader_set(shd_premultiply);

with (obj_savesystem)
{
    if (saveiconalpha > 0)
        draw_sprite_ext(saveiconspr, saveiconind, get_game_width() - 45, get_game_height() - 40, 1, 1, 0, c_white, saveiconalpha);
}

surface_reset_target();
shader_reset();
surface_set_target(finalsurf);

if (surface_exists(guisurf))
    draw_surface_stretched(guisurf, 0, 0, global.currentres[0], global.currentres[1]);

surface_reset_target();
gpu_set_blendmode(bm_normal);
draw_sprite_stretched_ext(spr_1x1, 0, -100, -100, windowwidth + 100, windowheight + 100, c_black, 1);
var _viewx = (windowwidth / 2) - ((global.currentres[0] * appscalex) / 2);
var _viewy = (windowheight / 2) - ((global.currentres[1] * appscaley) / 2);
var _vieww = surface_get_width(finalsurf) * appscalex;
var _viewh = surface_get_height(finalsurf) * appscaley;

if ((frac(appscalex) > 0 || frac(appscaley) > 0) && global.antialiasing)
    gpu_set_texfilter(true);
else
    gpu_set_texfilter(false);

gpu_set_blendenable(false);

with (obj_sonicfadeout)
{
    shader_set(shd_sonicfade);
    shader_set_uniform_f(shader_get_uniform(shd_sonicfade, "u_step"), fadealpha);
}

draw_surface_ext(finalsurf, _viewx, _viewy, appscalex, appscaley, 0, c_white, 1);

if (shader_current() == shd_sonicfade)
    shader_reset();

gpu_set_blendenable(true);
gpu_set_texfilter(false);

