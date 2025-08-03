if (moving != -1 && moving != 2)
{
    alarm[2] = 1;
    exit;
}

y += 1;

if (y < 61)
{
    moving = 2;
    lookDirection = 1;
    image_speed = 0.4;
    alarm[2] = 1;
}
else
{
    y = 61;
    image_speed = 0;
    moving = -1;
}
