function player_faker_taunt()
{
    if (sprite_index != s_fakepep_taunt)
    {
        image_speed = 1;
        image_index = 0;
        hsp = 0;
        audio_play_sound(su_fakepep_taunt, 50, false);
        sprite_index = s_fakepep_taunt;
    }
    
    vsp += grv;
    player_col();
    
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = s_fakepep_idle;
        state = (0 << 0);
        accel_final = 0;
        last_h = 0;
    }
}
