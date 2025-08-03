if (!global.use_shaders && alpha != 0)
{
    draw_rectangle_pix(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), 0, alpha * 0.709803922);
    
    with (obj_player)
        event_perform(ev_draw, ev_draw_normal);
    
    with (obj_md_sewer)
        event_perform(ev_draw, ev_draw_normal);
    
    with (obj_bullet_parent)
        event_perform(ev_draw, ev_draw_normal);
    
    with (obj_ruins_bandage)
        event_perform(ev_draw, ev_draw_normal);
}
