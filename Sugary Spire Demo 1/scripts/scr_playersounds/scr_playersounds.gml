function scr_playersounds()
{
    if (!audio_is_playing(sfx_railgrind) && state == 98 && grounded)
        scr_sound(88);
    else if (state != 98 || !grounded)
        audio_stop_sound(sfx_railgrind);
    
    if (sprite_index == spr_mach2jump)
    {
        if (!audio_is_playing(sfx_flip))
            scr_sound(92);
    }
    
    if (audio_is_playing(sfx_flip) && sprite_index != spr_mach2jump)
        audio_stop_sound(sfx_flip);
    
    if (state == 65 && (!audio_is_playing(sound_dash1) && grounded))
        scr_sound(36);
    else if (state != 65 || (!grounded || move == -xscale))
        audio_stop_sound(sound_dash1);
    
    if (sprite_index == spr_mach && !audio_is_playing(sound_dash2))
        scr_sound(37);
    else if (sprite_index != spr_mach)
        audio_stop_sound(sound_dash2);
    
    if (((state == 67 && sprite_index != spr_player_crazyrun) || sprite_index == spr_player_machslideboost3) && !audio_is_playing(sound_maxspeed))
        scr_sound(53);
    else if ((state != 67 && sprite_index != spr_player_machslideboost3) || sprite_index == spr_player_crazyrun)
        audio_stop_sound(sound_maxspeed);
    
    if (sprite_index == spr_player_crazyrun && !audio_is_playing(sound_dash3))
        scr_sound(90);
    else if (sprite_index != spr_player_crazyrun)
        audio_stop_sound(sound_dash3);
}
