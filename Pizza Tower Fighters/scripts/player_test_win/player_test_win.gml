function player_test_win()
{
    var winspr = s_test_finish;
    var winmus = mu_victoryPep;
    var squidward = 350;
    
    if (sprite_index != winspr)
    {
        sprite_index = winspr;
        image_speed = 1;
        image_index = 0;
        hsp = 0;
        hi_squidward = -1;
        audio_play_sound(winmus, 50, false);
    }
    
    vsp += grv;
    player_col();
    
    if (floor(image_index) == (image_number - 1) && hi_squidward == -1)
    {
        image_speed = 0;
        image_index = 38;
        hi_squidward = squidward;
    }
    
    if (hi_squidward > 0 && hi_squidward != -1)
    {
        hi_squidward--;
    }
    else if (hi_squidward != -1)
    {
        if (!audio_is_playing(mu_results))
        {
            o_youwon.alarm[1] = 30;
            o_youwon.alarm[0] = 120;
            audio_play_sound(mu_results, 0, true, global.gameselect != "Arcade");
        }
    }
}
