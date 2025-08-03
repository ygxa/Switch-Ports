x -= 3;

if (x > 554)
{
    lookDirection = 2;
    image_speed = 0.3;
    
    if (x < 600 && x > 570)
        y = 410 + (sin(0.1 * (x - 600)) * 12);
    else
        y = 410;
    
    obj_mettalot.x -= 1;
    alarm[3] = 1;
}
else
{
    x = 554;
    image_speed = 0;
    image_index = 0;
    scene_resume();
}
