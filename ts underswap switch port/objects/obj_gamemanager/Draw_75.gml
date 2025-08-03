if (guiSurface != -1 && surface_exists(guiSurface))
{
    draw_surface_part(guiSurface, 0, 0, 640, 480, 0, 0);
    
    if (global.name_vhs)
    {
        gpu_set_blendmode_ext(bm_one, bm_inv_src_color);
        draw_surface_part_ext(guiSurface, 0, 0, 640, 480, -1, 0, 1, 1, 255, 1);
        draw_surface_part_ext(guiSurface, 0, 0, 640, 480, 1, 0, 1, 1, 65280, 1);
        draw_surface_part_ext(guiSurface, 0, 0, 640, 480, 0, -1, 1, 1, 16711680, 1);
        gpu_set_blendmode(bm_normal);
    }
}
