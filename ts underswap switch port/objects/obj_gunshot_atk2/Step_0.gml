if (type == 0)
    size += 0.5;

if (size > 3.5)
    type = 1;

if (type == 1)
{
    image_alpha -= 0.2;
    size -= 0.3;
    
    if (image_alpha < 0.1)
        instance_destroy();
}

image_xscale = size;
image_yscale = size;
