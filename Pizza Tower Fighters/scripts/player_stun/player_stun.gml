function player_stun()
{
    if (object_index == o_player_default || object_index == o_player_default2)
    {
        sprite_index = s_test_stun;
        mask_index = s_test_idl;
        audio_stop_sound(su_pep_dash);
    }
    
    if (object_index == o_player_noise || object_index == o_player_noise2)
    {
        sprite_index = s_noise_stun;
        mask_index = s_noise_idle;
        audio_stop_sound(su_noise_tornado);
        audio_stop_sound(su_noise_dash);
    }
    
    if (object_index == o_player_vigilante || object_index == o_player_vigilante2)
    {
        sprite_index = s_vigilante_stunned;
        audio_stop_sound(su_vigi_smg);
        mask_index = s_vigilante_idle;
    }
    
    if (object_index == o_player_fakepep || object_index == o_player_fakepep2)
    {
        sprite_index = s_fakepep_stun;
        mask_index = s_fakepep_idle;
        audio_stop_sound(su_fakepep_bodyslam);
    }
    
    if (object_index == o_player_doise || object_index == o_player_doise2)
    {
        sprite_index = s_noise_stun;
        mask_index = s_noise_idle;
        audio_stop_sound(su_doise_dash);
    }
    
    if (stun != 0)
        stun -= 1;
    
    hsp = 0;
    vsp += grv;
    player_col();
    inv = false;
    
    if (stun == 0)
    {
        state = (0 << 0);
        accel_final = 0;
        last_h = 0;
    }
}
