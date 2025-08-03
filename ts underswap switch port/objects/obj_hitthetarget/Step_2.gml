if (soul != -4)
{
    with (soul)
    {
        var cam = view_get_camera(0);
        
        if (!instance_exists(obj_viewshaker))
            camera_set_view_pos(cam, 0, min(y - 248, 480));
        else
            camera_set_view_pos(cam, camera_get_view_x(cam), min(y - 248, 480));
    }
}
