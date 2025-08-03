if (moving != -1 && moving != 4)
{
    alarm[4] = 1;
    exit;
}

moving = 4;
lookDirection = 1;
image_speed = 0.4;
y += 2;

if (y < 94)
{
    alarm[4] = 1;
}
else
{
    y = 94;
    alarm[5] = 1;
}
