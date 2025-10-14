windowwidth = window_get_width();
windowheight = window_get_height();

//scaletype.exact code
appscalex = 1;
appscaley = 1;

if (copyapp)
{
    with (obj_pause)
    {
        if (!surface_exists(surf))
            surf = surface_create(global.maxscreenwidth, global.maxscreenheight);
        
        surface_set_target(surf);
        draw_sprite_stretched_ext(spr_1x1, 0, 0, 0, global.maxscreenwidth, global.maxscreenheight, c_black, 1);
        surface_reset_target();
        view_visible[1] = true;
        view_surface_id[1] = surf;
    }
}
