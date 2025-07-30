function player_test_super_start()
{
    hsp = 0;
    player_col();
    
    if (sprite_index != s_test_super_start)
    {
        inv = true;
        damagemeteract = 0;
        vsp = 0;
        ScrStun_OtherPlayer(30);
        noisebomb = 30;
        image_speed = 1;
        audio_play_sound(su_super_activate, 50, false);
        sprite_index = s_test_super_start;
        image_index = 0;
        damagemeter = 0;
        
        if (instance_exists(o_camera2))
            o_camera2.super = 1;
        
        if (instance_exists(o_camera1))
            o_camera1.super = 1;
    }
    
    noisebomb--;
    
    if (floor(image_index) == (image_number - 1))
    {
        image_speed = 0;
        image_index = 7;
    }
    
    if (noisebomb == 0)
    {
        state = (24 << 0);
        
        if (instance_exists(o_camera2))
            o_camera2.super = 0;
        
        if (instance_exists(o_camera1))
            o_camera1.super = 0;
    }
}
