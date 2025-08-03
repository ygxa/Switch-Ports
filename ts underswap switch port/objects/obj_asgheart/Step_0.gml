if ((step % 3) == 0)
{
    step = 3;
    x = (xstart + random(shake)) - random(shake);
    y = (ystart + random(shake)) - random(shake);
    
    if (image_alpha < 1)
        image_alpha += 0.01;
}

step++;
