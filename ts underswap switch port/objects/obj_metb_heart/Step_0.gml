siner++;

if (size < 1)
    size += 0.1;

image_angle = sin(siner / 4) * 12;
image_xscale = (size + (sin(siner / 2) * 0.1)) * 2;
image_yscale = (size + (sin(siner / 2) * 0.1)) * 2;

if (y > battleBoxMid)
{
    image_alpha -= 0.05;
    
    if (image_alpha <= 0)
        instance_destroy();
}
