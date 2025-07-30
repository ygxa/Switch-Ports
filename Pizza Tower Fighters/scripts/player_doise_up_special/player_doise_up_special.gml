function player_doise_up_special()
{
    if (blue_aftereffect <= 0)
    {
        blue_aftereffect = 6;
        
        with (instance_create_depth(x, y, layer, o_afterimage))
        {
            depth = other.depth + 1;
            image_xscale = other.image_xscale;
            image_blend = #87CEFA;
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
    
    hsp = 0;
    player_col();
    
    if (sprite_index != s_noise_up_special)
    {
        noisebomb = 16;
        image_speed = 1;
        audio_play_sound(su_noise_jetpack_up, 50, false);
        sprite_index = s_noise_up_special;
        image_index = 0;
        abletorecover = 0;
        ds_list_clear(HitByAttack);
        vsp = -10.5;
    }
    
    mask_index = s_noise_up_special_col;
    var VarHitByAttackNow = ds_list_create();
    var Hits;
    
    if (object_index == o_player_doise)
    {
        Hits = instance_place_list(x, y, O_Player_2, VarHitByAttackNow, false);
    }
    else
    {
        Hits = instance_place_list(x, y, O_Player_1, VarHitByAttackNow, false);
        
        if (CPUtimetillpath > 0)
            CPUtimetillpath--;
    }
    
    noisebomb--;
    
    if (Hits > 0)
    {
        for (var i = 0; i < Hits; i++)
        {
            var HitID = ds_list_find_value(VarHitByAttackNow, i);
            
            if (ds_list_find_index(HitByAttack, HitID) == -1)
            {
                ds_list_add(HitByAttack, HitID);
                
                with (HitID)
                    player_hurt(12, 15, other.facing, 2);
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    mask_index = s_noise_idle;
    
    if (key_Q)
    {
        instance_create_layer(x, y - 50, layer, o_player_doise_explosion);
        sprite_index = s_noise_idle;
        state = (17 << 0);
        player_hurt(10, 17, facing, 7);
        blastdamaged = true;
        accel_final = 0;
        last_h = 0;
    }
    
    if (noisebomb == 0)
    {
        sprite_index = s_noise_idle;
        state = (0 << 0);
        accel_final = 0;
        last_h = 0;
    }
}
