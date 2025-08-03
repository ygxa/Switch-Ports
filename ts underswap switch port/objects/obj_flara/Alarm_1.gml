y -= 1;

if (y > 51)
{
    lookDirection = 0;
    image_speed = 0.4;
    alarm[1] = 1;
}
else
{
    y = 51;
    lookDirection = 1;
    image_speed = 0;
    moving = -1;
}
