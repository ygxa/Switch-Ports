if (leversPulled == 1)
{
    x -= 3;
    lookDirection = 2;
    
    if (x > 150)
    {
        image_speed = 0.2;
        event_user(15);
        alarm[2] = 1;
    }
    else
    {
        x = 150;
        lookDirection = defaultDirection;
        image_speed = 0;
        image_index = 0;
        event_user(15);
        alarm[1] = 6;
    }
}
else if (leversPulled == 2)
{
    x += 3;
    lookDirection = 3;
    
    if (x < 190)
    {
        alarm[2] = 1;
        image_speed = 0.2;
        event_user(15);
    }
    else
    {
        x = 190;
        lookDirection = defaultDirection;
        image_speed = 0;
        image_index = 0;
        event_user(15);
        alarm[1] = 6;
    }
}
else
{
    if (defaultDirection == 0)
    {
        pathToRun = pth_asg_ruin2_2_2_2;
        defaultDirection = 1;
    }
    else
    {
        pathToRun = pth_asg_ruin2_2_1_2;
    }
    
    event_user(2);
}
