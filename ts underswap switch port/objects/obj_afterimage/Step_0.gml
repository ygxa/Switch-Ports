image_alpha -= fadeSpeed;

if (image_alpha <= 0)
{
    instance_destroy();
}
else if (topLeftOrigin)
{
    var prevWidth = sprite_width;
    var prevHeight = sprite_height;
    image_xscale += scaleSpeed;
    image_yscale += scaleSpeed;
    x -= ((sprite_width - prevWidth) / 2);
    y -= ((sprite_height - prevHeight) / 2);
}
else
{
    image_xscale += scaleSpeed;
    image_yscale += scaleSpeed;
}
