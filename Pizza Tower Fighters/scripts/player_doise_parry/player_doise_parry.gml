function player_doise_parry()
{
    if (sprite_index != s_doise_parry)
    {
        sprite_index = s_doise_parry;
        audio_play_sound(su_pep_parry, 50, false);
        audio_stop_sound(su_doise_taunt);
        flash = 3;
        hsp = 0;
        image_index = 0;
        image_speed = 1;
        instance_create_layer(x, y, "part", o_massivehit);
    }
    
    vsp += grv;
    player_col();
    
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = s_noise_idle;
        state = (0 << 0);
        accel_final = 0;
        last_h = 0;
        projectilehit = 0;
    }
}
