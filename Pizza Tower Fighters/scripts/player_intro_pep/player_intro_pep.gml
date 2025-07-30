function player_intro_pep()
{
    vsp += grv;
    player_col();
    
    if (sprite_index != s_test_intro && introanim == false)
    {
        image_index = 0;
        sprite_index = s_test_intro;
    }
    
    if (floor(image_index) == 24 && !audio_is_playing(su_pep_taunt2))
        audio_play_sound(su_pep_taunt2, 50, false);
    
    if (floor(image_index) == (image_number - 1) && sprite_index == s_test_intro)
    {
        sprite_index = s_test_idl;
        introanim = true;
        
        if (object_index == o_player_default)
            global.player1intro = false;
        else
            global.player2intro = false;
    }
    
    if (global.player1intro == false && global.player2intro == false)
    {
        if (object_index == o_player_default2 && global.P2Cpu == true)
            state = (0 << 0);
        else
            state = (0 << 0);
    }
}
