y -= 3;

if (y > 410)
{
    lookDirection = 0;
    image_speed = 0.3;
    alarm[2] = 1;
}
else
{
    obj_mettalot.lookDirection = 3;
    y = 410;
    alarm[3] = 1;
}
