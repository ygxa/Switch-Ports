function player_noise_super_start()
{
    hsp = 0;
    player_col();
    
    if (sprite_index != s_noise_super_start)
    {
        damagemeteract = 0;
        vsp = 0;
        ScrStun_OtherPlayer(30);
        noisebomb = 30;
        image_speed = 1;
        inv = true;
        audio_play_sound(su_super_activate, 50, false);
        sprite_index = s_noise_super_start;
        image_index = 0;
        damagemeter = 0;
        
        if (object_index == o_player_noise)
        {
            if (instance_exists(o_camera2))
                o_camera2.super = 1;
            
            if (instance_exists(o_camera1))
                o_camera1.super = 1;
        }
        else
        {
            if (instance_exists(o_camera2))
                o_camera2.super = 2;
            
            if (instance_exists(o_camera1))
                o_camera1.super = 2;
        }
    }
    
    noisebomb--;
    
    if (noisebomb == 0)
    {
        state = (23 << 0);
        
        if (instance_exists(o_camera2))
            o_camera2.super = 0;
        
        if (instance_exists(o_camera1))
            o_camera1.super = 0;
    }
}
