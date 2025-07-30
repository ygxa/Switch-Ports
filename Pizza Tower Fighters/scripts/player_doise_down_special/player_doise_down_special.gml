function player_doise_down_special()
{
    hsp = 0;
    vsp += grv;
    player_col();
    
    if (sprite_index != s_noise_downSpecial)
    {
        noisebomb = 30;
        image_speed = 1;
        sprite_index = s_noise_downSpecial;
        image_index = 0;
        ds_list_clear(HitByAttack);
    }
    
    if (punchcooldown > 0)
    {
        punchcooldown--;
    }
    else if (object_index == o_player_doise)
    {
        if (floor(image_index) == 5)
        {
            with (instance_create_layer(x, y - 5, layer, o_doise_rock))
            {
                hsp = 2 * other.facing;
                vsp = -11;
                player = 1;
                firstplayer = player;
                punchcooldown = 10;
            }
            
            punchcooldown = 10;
        }
    }
    else if (floor(image_index) == 5)
    {
        with (instance_create_layer(x, y - 5, layer, o_doise_rock))
        {
            hsp = 2 * other.facing;
            vsp = -11;
            player = 2;
            firstplayer = player;
        }
        
        punchcooldown = 10;
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = s_noise_idle;
        state = (0 << 0);
        accel_final = 0;
        last_h = 0;
    }
}
