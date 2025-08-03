x += horzSpeed;

if (instance_exists(obj_ff_asg) && fade == -1)
{
    if (obj_ff_asg.x <= 480)
    {
        if (image_alpha > 0.5)
            image_alpha -= 0.1;
    }
}
else if (fade == 1)
{
    if (image_alpha < 1)
        image_alpha += 0.05;
}
