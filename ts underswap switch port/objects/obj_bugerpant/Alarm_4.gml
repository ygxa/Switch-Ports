x += 3;

if (x < 750)
{
    lookDirection = 3;
    image_speed = 0.3;
    
    if (x < 600 && x > 570)
        y = 410 + (sin(0.1 * (x - 600)) * 12);
    else
        y = 410;
    
    alarm[4] = 1;
}
else
{
    scene_resume();
    instance_destroy();
}
