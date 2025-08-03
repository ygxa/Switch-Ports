if (type == 1)
{
    instance_destroy();
    exit;
}

horzSpeed = random(4) - 2;
baseAccel = random(0.5) + 0.2;
alarm[1] = freeze;
