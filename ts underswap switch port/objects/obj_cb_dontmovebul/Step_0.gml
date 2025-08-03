if (abs(image_xscale) > 3 && fadingState == 0)
{
    image_index = 1;
    fadingState = 1;
    alarm[0] = 20;
    scaleSpeed = 0;
    vspeed = 0;
    sfx_play(snd_create, 80, false);
}
else
{
    image_xscale += (scaleSpeed * sign(image_xscale));
    image_yscale += (scaleSpeed * sign(image_yscale));
}
