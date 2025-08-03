if (floor(image_index) >= 2)
{
    with (instance_create_xy(218, 64, obj_asgore_ow))
    {
        pathToRun = pth_asg_home_inside_2;
        event_user(2);
    }
    
    alarm[1] = 1;
    image_speed = 0;
    image_index = 0;
    
    with (obj_player)
    {
        dummyOverride = false;
        image_index = 0;
    }
    
    alarm[0] = 40;
}
else if (visible)
{
    with (obj_player)
    {
        if (x >= 235 && x <= 270)
        {
            dummyOverride = true;
            lookDirection = 2;
            image_index = 1;
            x += 3;
        }
    }
}
