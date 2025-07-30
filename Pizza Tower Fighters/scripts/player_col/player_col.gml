function player_col()
{
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
            sprint = false;
            doublekey = false;
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
            
            vsp = 0;
            detect = 1;
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
        
        vsp = 0;
    }
    
    y += vsp;
    grounded = place_meeting(x, y + 1, o_parentwall);
}
