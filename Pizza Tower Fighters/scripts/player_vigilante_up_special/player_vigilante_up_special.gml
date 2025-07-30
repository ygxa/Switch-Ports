function player_vigilante_up_special()
{
    if (blue_aftereffect <= 0)
    {
        blue_aftereffect = 6;
        
        with (instance_create_depth(x, y, layer, o_afterimage))
        {
            depth = other.depth + 1;
            image_xscale = other.image_xscale;
            image_blend = #FFAE42;
            sprite_index = other.sprite_index;
            image_alpha = 1.25;
            image_index = other.image_index - 1;
            full = 1;
        }
    }
    else
    {
        blue_aftereffect--;
    }
    
    if (sprite_index != s_vigilante_up_special)
    {
        abletorecover = 0;
        audio_play_sound(su_vigi_throw, 50, false);
        vsp = -3;
        sprite_index = s_vigilante_up_special;
        image_index = 0;
        image_speed = 1;
        ds_list_clear(HitByAttack);
    }
    
    vsp += (grv / 2);
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
            
            with (instance_create_layer(x, y, layer, o_vigilante_dynamite))
            {
                hsp = other.hsp;
                vsp = -2;
                player = 1;
            }
        }
    }
    else if (floor(image_index) == 2 || floor(image_index) == 3)
    {
        punchcooldown = 10;
        
        with (instance_create_layer(x, y, layer, o_vigilante_dynamite))
        {
            hsp = other.hsp;
            vsp = -2;
            player = 2;
        }
    }
    
    if (animation_end())
    {
        sprite_index = s_vigilante_idle;
        state = (0 << 0);
        accel_final = 0;
        last_h = 0;
        punchcooldown = 0;
    }
}
