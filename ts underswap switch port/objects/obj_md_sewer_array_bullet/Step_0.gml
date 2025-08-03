if (began)
{
    if (dir == 1)
        vspeed += 0.2;
    else if (dir == 0)
        vspeed -= 0.2;
    else if (dir == 2)
        hspeed -= 0.2;
    else
        hspeed += 0.2;
    
    var _xv = camera_get_view_x(view_camera[0]);
    var _yv = camera_get_view_y(view_camera[0]);
    
    if (x < (_xv - 40) || x > (_xv + camera_get_view_width(view_camera[0]) + 40) || y < (_yv - 40) || y > (_yv + camera_get_view_height(view_camera[0]) + 40))
        instance_destroy();
}
