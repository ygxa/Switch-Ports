if (!surface_exists(guisurf))
    guisurf = surface_create(global.currentinternalres[0], global.currentinternalres[1]);

surface_set_target(guisurf);
draw_clear_alpha(c_black, 0);
gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
shader_set(shd_premultiply);
