sfx_play_ext(snd_bark, vol, pitch);
sfx_play_ext(snd_bark2, vol, pitch);
pitch += 0.025;

if (vol > 0.2)
{
    vol -= 0.15;
    alarm[2] = 4;
}
else if (vol > 0.05)
{
    vol /= 2;
    alarm[2] = 4;
}
