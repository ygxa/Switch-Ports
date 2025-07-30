function player_test_side_aerial_old()
{
    if (hsp != 0)
    {
        facing = sign(hsp);
        direction = facing;
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
        
        vsp = 0;
    }
    
    y += vsp;
    
    if (sprite_index != s_test_side_aerial_old)
    {
        image_speed = 1;
        hsp = 7 * facing;
        abletorecover = 0;
        sprite_index = s_test_side_aerial_old;
        image_index = 0;
        audio_play_sound(su_pep_shoulder, 50, false);
        ds_list_clear(HitByAttack);
    }
    
    mask_index = s_test_side_aerial_oldCOL;
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
                    player_hurt(5, 7, other.facing, 5);
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    mask_index = s_test_idl;
    
    if (floor(image_index) == (image_number - 1) || place_meeting(x, y + 1, ObjWall))
    {
        mask_index = s_test_idl;
        state = (0 << 0);
        accel_final = hsp * facing;
        last_h = 1 * facing;
    }
}
