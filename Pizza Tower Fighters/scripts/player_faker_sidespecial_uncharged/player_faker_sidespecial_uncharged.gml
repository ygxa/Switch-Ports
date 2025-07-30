function player_faker_sidespecial_uncharged()
{
    if (sprite_index != s_fakepep_sidespecial_head)
    {
        sprite_index = s_fakepep_sidespecial_head;
        image_index = 0;
        image_speed = 1.6;
    }
    
    if (floor(image_index) == 18)
        image_speed = 1;
    
    vsp += grv;
    hsp = 0;
    player_col();
    
    if (punchcooldown > 0)
    {
        punchcooldown--;
    }
    else if (object_index == o_player_fakepep)
    {
        if (floor(image_index) == 18)
        {
            punchcooldown = 10;
            audio_play_sound(su_fakepep_superjump, 50, false);
            
            with (instance_create_layer(x + 10, y - 5, layer, o_fakepep_head))
            {
                hsp = 9.5 * other.facing;
                vsp = other.facing;
                player = 1;
                firstplayer = 1;
            }
        }
    }
    else if (floor(image_index) == 18)
    {
        punchcooldown = 10;
        audio_play_sound(su_fakepep_superjump, 50, false);
        
        with (instance_create_layer(x + 10, y - 5, layer, o_fakepep_head))
        {
            hsp = 9.5 * other.facing;
            vsp = other.facing;
            player = 2;
            firstplayer = 2;
        }
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        accel_final = 0;
        last_h = 0;
        sprite_index = s_fakepep_idle;
        state = (0 << 0);
    }
}
