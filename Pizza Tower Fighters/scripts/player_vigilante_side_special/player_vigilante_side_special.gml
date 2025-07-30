function player_vigilante_side_special()
{
    if (noisebomb == 0)
    {
        if (vsp == 0 && sprite_index != s_vigilante_side_special_air)
        {
            if (sprite_index != s_vigilante_side_special)
            {
                audio_play_sound(su_vigi_shoot, 50, false);
                noisebomb = 10;
                sprite_index = s_vigilante_side_special;
                image_index = 0;
                image_speed = 1;
                ds_list_clear(HitByAttack);
            }
        }
    }
    
    if (vsp != 0 && sprite_index != s_vigilante_side_special)
    {
        if (sprite_index != s_vigilante_side_special_air)
        {
            audio_play_sound(su_vigi_shoot, 50, false);
            vsp = -6;
            noisebomb = 17;
            sprite_index = s_vigilante_side_special_air;
            image_index = 0;
            image_speed = 1;
            ds_list_clear(HitByAttack);
        }
    }
    
    vsp += grv;
    
    if (sprite_index == s_vigilante_side_special)
    {
        if (accel_final > 0)
            accel_final -= 0.1;
        
        hsp = accel_final * facing;
    }
    
    player_col();
    
    if (punchcooldown > 0)
    {
        punchcooldown--;
    }
    else if (object_index == o_player_vigilante)
    {
        if (floor(image_index) == 2 || floor(image_index) == 3)
        {
            punchcooldown = 10;
            
            with (instance_create_layer(x + 10, y, layer, o_vigilante_bullet))
            {
                if (!other.sprint)
                    hsp = 6.5 * other.facing;
                else
                    hsp = 8.5 * other.facing;
                
                vsp = other.facing;
                player = 1;
            }
        }
    }
    else if (floor(image_index) == 2 || floor(image_index) == 3)
    {
        punchcooldown = 10;
        
        with (instance_create_layer(x + 10, y, layer, o_vigilante_bullet))
        {
            if (!other.sprint)
                hsp = 6.5 * other.facing;
            else
                hsp = 8.5 * other.facing;
            
            vsp = other.facing;
            player = 2;
        }
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == s_vigilante_side_special)
        {
            accel_final = 0;
            last_h = 0;
        }
        
        sprite_index = s_vigilante_idle;
        punchcooldown = 0;
        state = (0 << 0);
    }
}
