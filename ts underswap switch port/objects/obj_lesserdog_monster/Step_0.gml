if (helicopter)
{
    if (y < -200)
        vspeed = 0;
    else if (vspeed > -7)
        vspeed -= 0.1;
    
    if (!is_undefined(global.soundstore) && audio_is_playing(global.soundstore))
    {
        if (y > 0)
            audio_sound_gain(global.soundstore, clamp(vspeed / -10, 0, 0.8), 0);
        else
            audio_sound_gain(global.soundstore, clamp((y + 200) / 200, 0, 0.8), 0);
    }
}

if (addNeckCount == 0)
    depth = 1;
else
    depth = -100;
