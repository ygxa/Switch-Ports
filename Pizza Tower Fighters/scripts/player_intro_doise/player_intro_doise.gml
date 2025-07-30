function player_intro_doise()
{
    vsp += grv;
    player_col();
    
    if (sprite_index != s_doise_intro && introanim == false)
    {
        image_speed = 1;
        image_index = 0;
        sprite_index = s_doise_intro;
    }
    
    if (floor(image_index) == 12 && !audio_is_playing(su_doise_intro))
        audio_play_sound(su_doise_intro, 50, false);
    
    if (floor(image_index) == (image_number - 1) && sprite_index == s_doise_intro)
    {
        sprite_index = s_noise_idle;
        introanim = true;
        
        if (object_index == o_player_doise)
            global.player1intro = false;
        else
            global.player2intro = false;
    }
    
    if (global.player1intro == false && global.player2intro == false)
        state = (0 << 0);
}
