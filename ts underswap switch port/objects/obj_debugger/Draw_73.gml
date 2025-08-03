if (fullRoomView && fullRoomRects)
{
    for (var i = 0; i < 2; i++)
    {
        var cam = view_get_camera(i);
        
        if (camera_get_view_width(cam) != 1024 && (i == 0 || camera_get_view_x(cam) != 0))
        {
            draw_set_color((i == 0) ? c_red : c_blue);
            var _x = camera_get_view_x(cam);
            var _y = camera_get_view_y(cam);
            var _w = camera_get_view_width(cam);
            var _h = camera_get_view_height(cam);
            draw_rectangle(_x, _y, _x + _w, _y + _h, true);
        }
    }
}
