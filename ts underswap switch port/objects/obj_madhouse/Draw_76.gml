if (follow && !revealed && obj_player.x > (x + 90))
{
    x += (camera_get_view_x(view_camera[0]) - lastvx);
    s.x = bbox_left;
    
    if (funnylag == funnycounter)
        funnycounter++;
}

if (!chasing)
    lastvx = camera_get_view_x(view_camera[0]);
