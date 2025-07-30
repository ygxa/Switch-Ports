function player_test_taunt()
{
    if (sprite_index != s_test_taunt)
    {
        image_index = 0;
        hsp = 0;
        image_speed = 1;
        audio_play_sound(su_pep_taunt, 50, false);
        sprite_index = s_test_taunt;
    }
    
    vsp += grv;
    player_col();
    
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = s_test_idl;
        state = (0 << 0);
        accel_final = 0;
        last_h = 0;
    }
}
