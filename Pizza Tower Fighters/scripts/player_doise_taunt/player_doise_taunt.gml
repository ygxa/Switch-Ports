function player_doise_taunt()
{
    if (sprite_index != s_doise_taunt)
    {
        image_index = 0;
        hsp = 0;
        image_speed = 1;
        sprite_index = s_doise_taunt;
        audio_play_sound(su_doise_taunt, 50, false);
    }
    
    vsp += grv;
    player_col();
    
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = s_noise_idle;
        state = (0 << 0);
        accel_final = 0;
        last_h = 0;
    }
}
