if (surf == -1 || !surface_exists(surf))
    surf = surface_create(512, 256);

surface_set_target(surf);
draw_clear_alpha(c_black, 1);

if (state >= 1)
{
    gpu_set_blendmode(bm_subtract);
    draw_ellipse(110, 90, 130, 100, false);
    
    if (state >= 2)
    {
        draw_ellipse(190, 90, 210, 100, false);
        
        if (state >= 3)
        {
            draw_ellipse(150, 95, 170, 105, false);
            
            if (state >= 4)
                draw_ellipse(150, 80, 170, 90, false);
        }
    }
    
    gpu_set_blendmode(bm_normal);
}

surface_reset_target();
draw_surface(surf, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));
