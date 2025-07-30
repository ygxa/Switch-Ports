function player_faker_up_special()
{
    if (blue_aftereffect <= 0)
    {
        blue_aftereffect = 6;
        
        with (instance_create_depth(x, y, layer, o_afterimage))
        {
            depth = other.depth + 1;
            image_xscale = other.image_xscale;
            image_blend = #F03030;
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
    
    var hmove = key_right - key_left;
    
    if (hmove != 0)
    {
        if (last_h != hmove)
        {
            last_h = hmove;
            accel_final = 0;
        }
        
        if (accel_final <= accel_max)
            accel_final += accel;
    }
    else if (accel_final > 0)
    {
        accel_final -= accel;
    }
    
    if (accel_final < accel)
    {
        accel_final = 0;
        last_h = 0;
    }
    
    hsp = accel_final * last_h;
    player_col();
    
    if (sprite_index != s_fakepep_upspecial)
    {
        noisebomb = 15;
        image_speed = 1;
        audio_play_sound(su_fakepep_upspecial, 50, false);
        sprite_index = s_fakepep_upspecial;
        image_index = 0;
        abletorecover = 0;
        ds_list_clear(HitByAttack);
        vsp = -12;
    }
    
    mask_index = s_noise_up_special_col;
    var VarHitByAttackNow = ds_list_create();
    var Hits;
    
    if (object_index == o_player_fakepep)
        Hits = instance_place_list(x, y, O_Player_2, VarHitByAttackNow, false);
    else
        Hits = instance_place_list(x, y, O_Player_1, VarHitByAttackNow, false);
    
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
                    player_hurt(5, 12, other.facing, 5);
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    mask_index = s_fakepep_idle;
    
    if (noisebomb == 0)
    {
        sprite_index = s_fakepep_idle;
        state = (0 << 0);
        accel_final = 0;
        last_h = 0;
    }
    
    if (distance_to_object(o_hurt_ceiling) < 100)
    {
        sprite_index = s_fakepep_idle;
        state = (0 << 0);
        accel_final = 0;
        last_h = 0;
        vsp = 0;
    }
}
