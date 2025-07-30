function eye_state_appear_spawn()
{
    if (sprite_index != s_secreteye_spawn)
    {
        sprite_index = s_secreteye_spawn;
        image_alpha = 1;
        image_index = 0;
        audio_stop_sound(su_fakepep_bodyslam);
        audio_stop_sound(su_vigi_smg);
        audio_stop_sound(su_noise_tornado);
        audio_play_sound(su_eye_enter, 50, false);
        
        with (O_Player_2)
        {
            state = 0;
            visible = true;
            inv = false;
        }
        
        with (O_Player_1)
        {
            state = 0;
            visible = true;
            inv = false;
        }
    }
    
    if (floor(image_index) == (image_number - 1))
        state = (5 << 0);
}
