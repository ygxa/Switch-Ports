image_alpha -= 0.08;

if (image_alpha > 0)
{
    alarm[0] = 1;
}
else
{
    image_alpha = 0;
    instance_destroy();
}
