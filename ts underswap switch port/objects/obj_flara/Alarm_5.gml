x += 2;

if (x < 190)
{
    lookDirection = 3;
    image_speed = 0.4;
    alarm[4] = 1;
}
else
{
    x = 190;
    lookDirection = 0;
    image_speed = 0;
    moving = -1;
}
