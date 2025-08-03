if (timer == 1)
{
    if (!silent)
        breakSfxLoop = sfx_play_pitch(snd_spikelower, 0.6, 80, true);
}
else if (timer == 45)
{
    if (!silent)
    {
        audio_stop_sound(breakSfxLoop);
        sfx_play_pitch(snd_slice, 0.5, 80, false);
    }
}

if (timer < 45)
    alarm[0] = 1;
