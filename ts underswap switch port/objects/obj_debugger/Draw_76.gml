if (fullRoomView)
{
    var ww = room_width;
    var wh = room_height;
    view_set_visible(0, false);
    view_set_visible(1, false);
    view_set_visible(2, true);
    var cam = view_get_camera(2);
    camera_set_view_pos(cam, 0, 0);
    camera_set_view_size(cam, ww, wh);
    view_set_wport(2, ww);
    view_set_hport(2, wh);
    global.border = 0;
    
    if (ww != window_get_width() || wh != window_get_height())
    {
        window_set_size(ww, wh);
        surface_resize(application_surface, ww, wh);
        obj_gamemanager.alarm[1] = 2;
    }
}
else if (lockCamera)
{
    camera_set_view_target(view_get_camera(0), obj_player);
}
