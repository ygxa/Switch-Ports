function player_intro_noise()
{
    vsp += grv;
    player_col();
    
    if (sprite_index != s_noise_intro && introanim == false)
    {
        image_index = 0;
        sprite_index = s_noise_intro;
    }
    
    if (floor(image_index) == 24 && !audio_is_playing(su_noise_intro))
        audio_play_sound(su_noise_intro, 50, false);
    
    if (floor(image_index) == (image_number - 1) && sprite_index == s_noise_intro)
    {
        sprite_index = s_noise_idle;
        introanim = true;
        
        if (object_index == o_player_noise)
            global.player1intro = false;
        else
            global.player2intro = false;
    }
    
    if (global.player1intro == false && global.player2intro == false)
        state = (0 << 0);
}
