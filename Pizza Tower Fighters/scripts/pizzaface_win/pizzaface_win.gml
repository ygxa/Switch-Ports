function pizzaface_win()
{
    if (winvarrr == 0)
    {
        if (sprite_index != s_pizzaface_intro2)
        {
            sprite_index = s_pizzaface_intro2;
            image_index = 0;
            audio_play_sound(su_pizzaface_laugh, 50, false);
            audio_stop_sound(mu_top);
        }
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        winvarrr = 1;
        sprite_index = s_pizzaface_idle;
        
        if (!audio_is_playing(mu_results))
        {
            o_youwon.alarm[1] = 30;
            o_youwon.alarm[0] = 120;
            audio_play_sound(mu_results, 0, true, global.gameselect != "Arcade");
        }
    }
}
