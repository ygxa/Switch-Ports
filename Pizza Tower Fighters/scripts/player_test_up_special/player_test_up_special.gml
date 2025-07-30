function player_test_up_special()
{
    if (blue_aftereffect <= 0)
    {
        blue_aftereffect = 6;
        
        with (instance_create_depth(x, y, layer, o_afterimage))
        {
            depth = other.depth + 1;
            image_xscale = other.image_xscale;
            image_blend = #2C7EE4;
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
    
    if (object_index == o_player_default2 && global.P2Cpu == true)
    {
        if (CPUtimetillpath > 0)
            CPUtimetillpath--;
        
        if (distance_to_object(o_hurt) < 90 && !place_meeting(x, y, o_parentwall) && !grounded)
            cpu_recovering = true;
        
        direction = point_direction(x, y, o_cpu_findme.x, o_cpu_findme.y);
        
        if (accel_final <= accel_max)
            accel_final += accel;
        
        if (accel_final > accel_max && place_meeting(x, y + 1, o_parentwall))
            accel_final -= (accel / 3);
        
        hsp = lengthdir_x(accel_final, direction);
    }
    else
    {
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
    }
    
    vsp += grv;
    player_col();
    
    if (sprite_index != s_test_up_special)
    {
        abletorecover = 0;
        vsp = -15;
        image_speed = 1;
        audio_play_sound(su_pep_uppercut, 50, false);
        sprite_index = s_test_up_special;
        image_index = 0;
        ds_list_clear(HitByAttack);
    }
    
    mask_index = s_test_up_specialcol;
    var VarHitByAttackNow = ds_list_create();
    var Hits;
    
    if (object_index == o_player_default)
        Hits = instance_place_list(x, y, O_Player_2, VarHitByAttackNow, false);
    else
        Hits = instance_place_list(x, y, O_Player_1, VarHitByAttackNow, false);
    
    if (Hits > 0)
    {
        for (var i = 0; i < Hits; i++)
        {
            var HitID = ds_list_find_value(VarHitByAttackNow, i);
            
            if (ds_list_find_index(HitByAttack, HitID) == -1)
            {
                ds_list_add(HitByAttack, HitID);
                
                with (HitID)
                    player_hurt(20, 7, other.facing, 2);
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    mask_index = s_test_idl;
    
    if (animation_end())
    {
        image_index = 16;
        image_speed = 0;
    }
    
    if ((place_meeting(x, y + 1, o_parentwall) || place_meeting(x, y, o_mushroom)) && image_index == 16)
    {
        mask_index = s_test_idl;
        image_speed = 1;
        state = (0 << 0);
        
        if (global.P2Cpu && object_index == o_player_default2)
            cpu_recovering = false;
    }
}
