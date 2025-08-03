if (timer < 45)
{
    if (timer == 0)
        sfxRumble = sfx_loop(snd_rumble, 80, false);
    
    x = xstart + xShake;
    y = ystart + yShake;
}
else if (timer == 45)
{
    if (sprite_index == spr_kk_armshaker)
        image_index = 1;
    else
        image_index = 0;
    
    sprite_index = spr_kk_armspew;
    yShake = 3;
    obj_koffink_monster.spewXStart = obj_koffink_monster.x;
}
else if (timer <= 105)
{
    y = ystart + (yShake * -1);
    
    if (timer > 95)
    {
        if (audioGain > 0)
            audioGain -= 0.1;
        
        if (sfxRumble != -1)
            audio_sound_gain(sfxRumble, audioGain, (1 / game_get_speed(gamespeed_fps)) * 1000);
    }
    else
    {
        if ((timer % 7) == 0)
            sfx_play(snd_rise, 80, false);
        
        var spawnSpeed = (forTransition == true) ? 3 : 5;
        
        if ((timer % spawnSpeed) == 0)
            makeBats();
    }
}

timer++;
xShake *= -1;
yShake *= -1;
