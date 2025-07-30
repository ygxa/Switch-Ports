function player_vigilante_up_aerial()
{
    if (sprite_index != s_vigilante_up_aerial)
    {
        audio_play_sound(su_pep_kick, 100, false);
        image_speed = 1;
        sprite_index = s_vigilante_up_aerial;
        image_index = 0;
        ds_list_clear(HitByAttack);
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
    mask_index = s_vigilante_up_aerial_col;
    var VarHitByAttackNow = ds_list_create();
    var Hits;
    
    if (object_index == o_player_vigilante)
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
                    player_hurt(10, 12, -other.facing, 2);
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    mask_index = s_vigilante_idle;
    
    if (floor(image_index) == (image_number - 1) || place_meeting(x, y + 1, ObjWall) || place_meeting(x, y + 1, o_slope))
    {
        sprite_index = s_vigilante_idle;
        state = (0 << 0);
    }
}
