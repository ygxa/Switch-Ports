if (fullRoomView)
{
    display_set_gui_size(640, 480);
    display_set_gui_maximize(camera_get_view_width(view_camera[0]) / 640, camera_get_view_height(view_camera[0]) / 480, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));
}
