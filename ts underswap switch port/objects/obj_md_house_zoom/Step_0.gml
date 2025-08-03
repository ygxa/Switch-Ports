if (room == rm_star22_chase1)
{
    if (reappear)
    {
        x += 4;
        
        if (abs(x - obj_madhouse.x) <= 4)
        {
            obj_madhouse.visible = true;
            instance_destroy();
        }
    }
    else
    {
        y = number_approach_smooth(y, target, 0.2, 0.5);
        
        if (hspeed >= 3)
            hspeed += 0.3;
        
        if (x > (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])))
        {
            reappear = true;
            x = camera_get_view_x(view_camera[0]) - 40;
            y = obj_madhouse.y;
            hspeed = 0;
        }
        else
        {
            with (instance_create_xy(x, y, obj_afterimage))
            {
                depth = other.depth + 1;
                drawEnd = true;
                sprite_index = other.sprite_index;
                image_index = floor(obj_madhouse.faceIndex);
                image_speed = 0;
                scaleSpeed = 0;
                image_alpha = 0.8;
                fadeSpeed = 0.2;
            }
        }
    }
}
else if (reappear)
{
    y -= 4;
    
    if (abs(y - obj_madhouse.y) <= 4)
    {
        obj_madhouse.visible = true;
        instance_destroy();
    }
}
else
{
    x = number_approach_smooth(x, target, 0.2, 0.5);
    
    if (y < (camera_get_view_y(view_camera[0]) - 40))
    {
        reappear = true;
        y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 40;
        x = obj_madhouse.x;
        vspeed = 0;
    }
    else if (vspeed <= -3)
    {
        vspeed -= 0.3;
        
        with (instance_create_xy(x, y, obj_afterimage))
        {
            depth = other.depth - 1;
            drawEnd = true;
            sprite_index = other.sprite_index;
            image_index = floor(obj_madhouse.faceIndex);
            image_speed = 0;
            scaleSpeed = 0;
            image_alpha = 0.8;
            fadeSpeed = 0.2;
        }
    }
}
