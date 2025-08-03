if (x < 300)
{
    alarm[6] = 1;
}
else
{
    x = 300;
    hspeed = 0;
    lookDirection = 1;
    image_speed = 0;
    scene_resume();
}
