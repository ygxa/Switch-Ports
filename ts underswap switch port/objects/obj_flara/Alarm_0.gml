if (moving != -1 && moving != 0)
{
    alarm[0] = 1;
    exit;
}

moving = 0;
lookDirection = 3;
image_speed = 0.4;
x += 1;

if (x < 107)
{
    alarm[0] = 1;
}
else
{
    x = 107;
    alarm[1] = 1;
}
