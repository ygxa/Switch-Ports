image_alpha -= fadeSpeed;

if (image_alpha <= 0)
{
    instance_destroy();
}
else
{
    image_xscale += scaleSpeed;
    image_yscale += scaleSpeed;
}
