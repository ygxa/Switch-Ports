event_inherited();
hspeed = 5;
vspeed = random_range(-3.5, 3.5);
image_speed = 0;
image_xscale = 2;
image_yscale = 2;

if (irandom(3) == 0)
{
    bulletType = (1 << 0);
    image_blend = #14A9FF;
}

siner = 0;
sfx_play(snd_bark);
