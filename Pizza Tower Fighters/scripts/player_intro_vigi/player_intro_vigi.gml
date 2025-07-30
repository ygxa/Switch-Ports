function player_intro_vigi()
{
    vsp += grv;
    player_col();
    
    if (sprite_index != s_vigilante_intro && introanim == false)
    {
        image_index = 0;
        sprite_index = s_vigilante_intro;
    }
    
    if (floor(image_index) == 21 && !audio_is_playing(su_vigi_intro))
        audio_play_sound(su_vigi_intro, 50, false);
    
    if (floor(image_index) == (image_number - 1) && sprite_index == s_vigilante_intro)
    {
        sprite_index = s_vigilante_idle;
        introanim = true;
        
        if (object_index == o_player_vigilante)
            global.player1intro = false;
        else
            global.player2intro = false;
    }
    
    if (global.player1intro == false && global.player2intro == false)
        state = (0 << 0);
}
