function player_noise_side_special()
{
    vsp += grv;
    player_col();
    
    if (sprite_index != s_noise_sideSpecial)
    {
        vsp = 0;
        hsp = 0;
        
        if (global.P2Cpu && object_index == o_player_noise2)
            noisebomb = 50;
        else
            noisebomb = 40;
        
        sprite_index = s_noise_sideSpecial;
        image_index = 0;
        image_speed = 1;
        ds_list_clear(HitByAttack);
    }
    
    if (punchcooldown > 0)
    {
        punchcooldown--;
    }
    else if (object_index == o_player_noise)
    {
        if (floor(image_index) == 5)
        {
            punchcooldown = 10;
            
            with (instance_create_layer(x, y, layer, o_noise_bomb))
            {
                hsp = 8 * other.facing;
                vsp = -4;
                player = 1;
                firstplayer = player;
                
                with (instance_create_layer(x + (30 * o_player_noise.facing), y + 20, "part", o_bombhit))
                    player = 1;
            }
        }
    }
    else if (floor(image_index) == 5)
    {
        punchcooldown = 10;
        
        with (instance_create_layer(x, y, layer, o_noise_bomb))
        {
            hsp = 7 * other.facing;
            vsp = -4;
            player = 2;
            firstplayer = player;
        }
        
        with (instance_create_layer(x + (30 * o_player_noise2.facing), y + 20, "part", o_bombhit))
            player = 2;
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = s_noise_idle;
        state = (0 << 0);
    }
}
