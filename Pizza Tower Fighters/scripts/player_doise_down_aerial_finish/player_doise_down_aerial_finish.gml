function player_doise_down_aerial_finish()
{
    hsp = 0;
    vsp = 0;
    
    if (sprite_index != s_doise_down_aerial_finish)
    {
        instance_create_layer(x, y + 5, "part", o_slameffect);
        audio_play_sound(su_fakepep_bodyslam_fn, 50, false);
        sprite_index = s_doise_down_aerial_finish;
        image_index = 0;
        image_speed = 1;
        ScreenShake(3, 25);
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        grv = 0.5;
        sprite_index = s_noise_idle;
        inv = false;
        
        if (hurt == false)
        {
            state = (0 << 0);
        }
        else
        {
            state = (17 << 0);
            player_hurt(10, 7, facing, 7);
            blastdamaged = true;
            instance_create_layer(x, y, layer, o_player_doise_explosion);
        }
    }
}
