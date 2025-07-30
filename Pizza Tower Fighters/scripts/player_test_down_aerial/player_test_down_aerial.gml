function player_test_down_aerial()
{
    if (object_index == o_player_default2 && global.P2Cpu == true)
    {
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
        yplus = 0;
        
        while (place_meeting(x + hsp, y - yplus, ObjWall) && yplus <= abs(1 * hsp))
            yplus += 1;
        
        if (place_meeting(x + hsp, y - yplus, ObjWall))
        {
            while (!place_meeting(x + sign(hsp), y, ObjWall))
                x += sign(hsp);
            
            hsp = 0;
        }
        else
        {
            y -= yplus;
        }
    }
    
    x += hsp;
    
    if (!place_meeting(x, y, ObjWall) && vsp >= 0 && place_meeting(x, y + 2 + abs(hsp), ObjWall))
    {
        while (!place_meeting(x, y + 1, ObjWall))
            y += 1;
    }
    
    if (place_meeting(x, y + vsp, ObjWall))
    {
        while (!place_meeting(x, y + sign(vsp), ObjWall))
            y += sign(vsp);
        
        detect = 1;
        vsp = 0;
    }
    
    y += vsp;
    grounded = place_meeting(x, y + 1, o_parentwall);
    
    if (sprite_index != s_test_down_aerial)
    {
        image_speed = 1;
        sprite_index = s_test_down_aerial;
        noisebomb = 2;
        image_index = 0;
        audio_play_sound(su_pep_kick, 50, false);
        ds_list_clear(HitByAttack);
    }
    
    if (punchcooldown > 0)
    {
        punchcooldown--;
    }
    else
    {
        if (floor(image_index) == 4 && noisebomb > 0)
        {
            ds_list_clear(HitByAttack);
            punchcooldown = 3;
            noisebomb--;
        }
        
        if (floor(image_index) == 5 && noisebomb > 0)
        {
            ds_list_clear(HitByAttack);
            punchcooldown = 2;
            noisebomb--;
        }
    }
    
    mask_index = s_test_down_aerialcol;
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
                {
                    if (other.image_index != 5 && other.image_index < 5)
                        player_hurt(2, -1, other.facing, 2);
                    else
                        player_hurt(2, -7, other.facing, 6);
                }
                
                vsp = -1;
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    mask_index = s_test_idl;
    
    if (place_meeting(x, y + 1, ObjWall))
    {
        if (grounded)
            state = (29 << 0);
        else
            state = (0 << 0);
    }
}
