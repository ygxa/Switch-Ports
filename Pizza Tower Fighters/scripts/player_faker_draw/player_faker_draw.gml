function player_faker_draw()
{
    if (sprite_index != s_fakepep_downspecial)
    {
        image_speed = 1;
        image_index = 0;
        sprite_index = s_fakepep_downspecial;
        audio_play_sound(su_fakepep_deform, 50, false);
        hsp = 0;
        inv = 1;
    }
    
    vsp += grv;
    player_col();
    
    if (floor(image_index) == (image_number - 1))
        image_alpha = 0;
}
