if (!fadedIn)
{
    if (image_alpha < 1)
        image_alpha += 0.2;
    else
        fadedIn = true;
}

if (x < -55 || x > 650 || y < -30 || y > 490)
    instance_destroy();
