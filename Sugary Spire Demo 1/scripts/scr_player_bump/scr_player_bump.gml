function scr_player_bump()
{
    if (character == "P")
        movespeed = 0;
    
    if (character == "N")
        hsp = xscale * movespeed;
    
    mach2 = 0;
    start_running = 1;
    alarm[4] = 14;
    
    if ((grounded && vsp > 0) && character == "P")
        hsp = 0;
    
    if (floor(image_index) == (image_number - 1) && character == "P")
        state = 0;
    
    if (grounded && character == "N")
        state = 0;
    
    if ((sprite_index != spr_player_catched && (sprite_index != spr_tumbleend && sprite_index != spr_player_mach3hitwall)) && sprite_index != spr_pizzano_shoulderbash)
        sprite_index = spr_bump;
    
    if (audio_is_playing(sound_tumble))
        audio_stop_sound(sound_tumble);
    
    image_speed = 0.35;
}
