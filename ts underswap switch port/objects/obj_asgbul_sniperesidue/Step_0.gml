siner++;

if (animState == 0)
{
    image_xscale += 0.15;
    
    if (image_index == 3)
        animState = 1;
}
else if (animState == 1)
{
    if (!alarmSet)
    {
        alarm[0] = 60;
        alarmSet = true;
    }
    
    image_speed = 0;
    image_xscale += 0.01;
    
    if ((siner % 2) == 0)
    {
        if (image_index == 2)
            image_index = 3;
        else
            image_index = 2;
    }
}
else if (animState == 2)
{
    image_xscale -= 0.05;
}
