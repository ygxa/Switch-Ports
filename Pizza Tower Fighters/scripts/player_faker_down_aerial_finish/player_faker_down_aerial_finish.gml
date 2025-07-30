function player_faker_down_aerial_finish()
{
    hsp = 0;
    vsp = 0;
    
    if (sprite_index != s_fakepep_down_aerial_finish)
    {
        instance_create_layer(x, y + 3, "part", o_slameffect);
        audio_play_sound(su_fakepep_bodyslam_fn, 50, false);
        sprite_index = s_fakepep_down_aerial_finish;
        image_index = 0;
        ScreenShake(3, 25);
        image_speed = 1;
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        grv = 0.5;
        sprite_index = s_fakepep_idle;
        state = (0 << 0);
    }
}
