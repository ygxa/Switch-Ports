function player_doise_fuckingdies()
{
    if (pause > 0)
        pause--;
    
    if (pause == 0)
    {
        hitstun -= 1;
        image_speed = 1;
        vsp += grv;
        sprite_index = s_doise_hurt;
        
        if (place_meeting(x + hsp, y, ObjWall))
        {
            yplus = 0;
            
            while (place_meeting(x + hsp, y - yplus, ObjWall) && yplus <= abs(1 * hsp))
                yplus += 1;
            
            if (place_meeting(x + hsp, y - yplus, ObjWall))
            {
                while (!place_meeting(x + sign(hsp), y, ObjWall))
                    x += sign(hsp);
                
                hsp = -hsp;
            }
            else
            {
                y -= yplus;
            }
        }
        
        x += hsp;
        var _movingPlatform = instance_place(x, y + max(1, vsp), o_way_platform);
        
        if ((_movingPlatform && bbox_bottom <= _movingPlatform.bbox_top) && !key_down)
        {
            if (vsp > 0)
            {
                while (!place_meeting(x, y + sign(vsp), o_way_platform))
                    y += sign(vsp);
                
                if (place_meeting(x, y + 1, o_way_platform))
                    vsp = -4;
                else
                    vsp = 0;
            }
        }
        else
        {
            detect = 0;
        }
        
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
        
        if (hsp != 0)
            facing = sign(hsp);
        
        if (hitstun == 0 || place_meeting(x, y + 1, ObjWall))
        {
            blastdamaged = 0;
            sprint = false;
            doublekey = 0;
            
            if (global.P2Cpu && object_index == O_Player_2)
                state = (1 << 0);
            else
                state = (0 << 0);
            
            accel_final = hsp * facing;
            last_h = 1 * facing;
            projectilehit = 0;
        }
    }
}
