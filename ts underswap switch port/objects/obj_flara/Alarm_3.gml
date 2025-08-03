if (moving != -1 && moving != 3)
{
    alarm[3] = 1;
    exit;
}

moving = 3;
y -= 1;

if (y > 40)
{
    lookDirection = 1;
    image_speed = 0.2;
    alarm[3] = 1;
}
else
{
    y = 40;
    image_speed = 0;
    moving = -1;
}
