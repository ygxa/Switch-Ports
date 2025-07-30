function player_test_draw()
{
    if (sprite_index != s_test_draw)
    {
        image_speed = 1;
        image_index = 0;
        sprite_index = s_test_draw;
        inv = 1;
        audio_play_sound(su_pep_draw, 50, false);
        hsp = 0;
    }
    
    vsp += grv;
    player_col();
    
    if (floor(image_index) == (image_number - 1))
    {
        image_index = 29;
        image_speed = 0;
    }
}
