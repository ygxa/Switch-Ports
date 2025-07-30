function player_faker_super_start()
{
    hsp = 0;
    player_col();
    
    if (sprite_index != s_fakepep_jump2)
    {
        inv = true;
        damagemeteract = 0;
        vsp = -7;
        ScrStun_OtherPlayer(30);
        noisebomb = 20;
        image_speed = 1;
        audio_play_sound(su_super_activate, 50, false);
        sprite_index = s_fakepep_jump2;
        image_index = 0;
        damagemeter = 0;
        
        if (object_index == o_player_fakepep)
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
    
    if (floor(image_index) == (image_number - 1))
    {
        image_index = 5;
        image_speed = 0;
    }
    
    if (noisebomb == 0)
    {
        state = (10 << 0);
        
        if (instance_exists(o_camera2))
            o_camera2.super = 0;
        
        if (instance_exists(o_camera1))
            o_camera1.super = 0;
    }
}
