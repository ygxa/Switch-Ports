if (step >= 30)
{
    image_alpha -= fadeSpeed;
    
    if (image_alpha <= 0)
        instance_destroy();
}

image_xscale += 0.025;
image_yscale += 0.025;
step++;
