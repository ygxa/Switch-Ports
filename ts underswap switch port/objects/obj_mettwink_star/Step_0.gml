time++;
image_angle += 5;

if (time > 30)
{
    image_alpha -= 0.05;
    
    if (image_alpha <= 0)
        instance_destroy();
}

if (speed > 0)
    speed -= 0.075;
else
    speed = 0;
