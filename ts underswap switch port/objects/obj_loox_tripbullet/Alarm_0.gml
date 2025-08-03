x = number_approach_smooth(x, targetX, 0.6, 0.5);

if (floor(image_index) >= 7)
{
    sprite_index = spr_looxroll;
    sfx_play(snd_throw);
    vspeed = 18;
    alarm[1] = 1;
}
else
{
    alarm[0] = 1;
}
