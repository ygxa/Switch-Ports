image_alpha -= 0.05;

if (image_alpha <= 0)
{
    instance_destroy();
}
else if (image_xscale < 2)
{
    image_xscale += (1/3);
    image_yscale += (1/3);
}
