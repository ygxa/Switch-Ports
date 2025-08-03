if (shaking)
{
    x = xstart + (irandom(1 + tension) * choose(1, -1));
    y = ystart + (irandom(1 + tension) * choose(1, -1));
    tension += 0.05;
}
else
{
    x = xstart;
    y = ystart;
}

time++;

if (time == 30)
{
    origVolume = music_get_gain();
    music_gain(0, 1000);
}

if (time == 60)
    obj_mettalot_monster.face = spr_metfaceb_sassy;

if (time == 90)
    sfx_play(snd_drumroll, 80, false);

if (time == 120)
    sfx_play(snd_win, 80, false);
