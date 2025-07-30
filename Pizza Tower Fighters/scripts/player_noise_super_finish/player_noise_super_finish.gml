function player_noise_super_finish()
{
    hsp = 0;
    vsp = 0;
    
    if (sprite_index != s_noise_super_crusherfinish)
    {
        if (object_index == o_player_noise)
        {
            with (instance_create_layer(x + 60, y, "part", o_player_noise_shockwave))
            {
                facing = 1;
                player = 1;
            }
            
            with (instance_create_layer(x - 60, y, "part", o_player_noise_shockwave))
            {
                facing = -1;
                player = 1;
            }
        }
        
        if (object_index == o_player_noise2)
        {
            with (instance_create_layer(x + 60, y, "part", o_player_noise_shockwave))
            {
                facing = 1;
                player = 2;
            }
            
            with (instance_create_layer(x - 60, y, "part", o_player_noise_shockwave))
            {
                facing = -1;
                player = 2;
            }
        }
        
        audio_play_sound(su_fakepep_bodyslam_fn, 50, false);
        sprite_index = s_noise_super_crusherfinish;
        image_index = 0;
        image_speed = 1;
        ScreenShake(10, 25);
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        grv = 0.5;
        sprite_index = s_noise_idle;
        state = (0 << 0);
        
        with (instance_create_layer(x, y, "part", o_fireflameffect))
            sprite_index = s_poofeffect;
    }
}
