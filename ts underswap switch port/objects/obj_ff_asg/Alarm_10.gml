if (xstart == -1)
    xstart = x;

x = xstart + shakeValue;
shakeValue = -(shakeValue - sign(shakeValue));

if (shakeValue != 0)
{
    alarm[10] = shakeSpeed;
    sprite_index = spr_asgface_surprise_still;
}
else
{
    x = xstart;
}
