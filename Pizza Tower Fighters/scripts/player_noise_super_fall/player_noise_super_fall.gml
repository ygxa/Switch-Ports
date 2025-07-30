function player_noise_super_fall()
{
    if (sprite_index != s_noise_super_crusherfall)
    {
        grv = 0.9;
        sprite_index = s_noise_super_crusherfall;
        image_index = 0;
        image_speed = 1;
        damagenull = true;
        unparry = true;
        ds_list_clear(HitByAttack);
    }
    
    if (blue_aftereffect <= 0)
    {
        blue_aftereffect = 6;
        
        with (instance_create_depth(x, y, layer, o_afterimage))
        {
            depth = other.depth + 1;
            image_xscale = other.image_xscale;
            image_blend = #FFFFBF;
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
    
    if (object_index == o_player_fakepep2 && global.P2Cpu == true)
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
    
    if (place_meeting(x + hsp, y, ObjWall))
    {
        while (!place_meeting(x + sign(hsp), y, ObjWall))
            x += sign(hsp);
        
        hsp = 0;
    }
    
    if (place_meeting(x + hsp, y, o_slope))
    {
        yplus = 0;
        
        while (place_meeting(x + hsp, y - yplus, o_slope) && yplus <= abs(1 * hsp))
            yplus += 1;
        
        if (place_meeting(x + hsp, y - yplus, o_slope))
        {
            while (!place_meeting(x + sign(hsp), y, o_slope))
                x += sign(hsp);
            
            hsp = 0;
        }
        else
        {
            y -= yplus;
        }
    }
    
    x += hsp;
    
    if (place_meeting(x, y + vsp, ObjWall))
    {
        while (!place_meeting(x, y + sign(vsp), ObjWall))
            y += sign(vsp);
        
        vsp = 0;
    }
    
    if (!place_meeting(x, y, o_slope) && vsp >= 0 && place_meeting(x, y + 2 + abs(hsp), o_slope))
    {
        while (!place_meeting(x, y + 1, o_slope))
            y += 1;
    }
    
    if (place_meeting(x, y + vsp, o_slope))
    {
        while (!place_meeting(x, y + sign(vsp), o_slope))
            y += sign(vsp);
        
        detect = 1;
        vsp = 0;
    }
    
    y += vsp;
    mask_index = s_noise_super_crusherfall;
    var VarHitByAttackNow = ds_list_create();
    var Hits;
    
    if (object_index == o_player_noise)
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
                    player_hurt(25, -10, other.facing, 7);
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    mask_index = s_noise_idle;
    
    if (place_meeting(x, y + 1, ObjWall) || place_meeting(x, y + 1, o_slope))
    {
        audio_stop_sound(su_doise_downaerial);
        state = (25 << 0);
        inv = false;
        damagenull = false;
        unparry = false;
    }
}
