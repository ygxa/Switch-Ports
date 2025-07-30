function player_slime_idle()
{
    if (room == R_Tutorial && O_Tutorial_Manager.phase == 10 && !instance_exists(O_Text))
        state = (4 << 0);
    
    if (accel_final > 0)
        accel_final -= accel;
    
    if (accel_final < accel)
    {
        accel_final = 0;
        last_h = 0;
    }
    
    hsp = accel_final * last_h;
    vsp += grv;
    
    if (hsp != 0)
        facing = sign(hsp);
    
    if (place_meeting(x + hsp, y, ObjWall))
    {
        while (!place_meeting(x + sign(hsp), y, ObjWall))
            x += sign(hsp);
        
        hsp = 0;
    }
    
    x += hsp;
    
    if (place_meeting(x, y + vsp, ObjWall))
    {
        while (!place_meeting(x, y + sign(vsp), ObjWall))
            y += sign(vsp);
        
        vsp = 0;
    }
    
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
    
    y += vsp;
    
    if (place_meeting(x, y + 1, ObjWall) || detect == 1)
    {
        justspawned = 0;
        blastdamaged = 0;
        abletodouble = 1;
        abletorecover = 1;
        image_speed = 1;
        
        if (hsp != 0)
        {
            sprite_index = s_cheese_walk;
            
            if (animation_end())
                instance_create_layer(x, y + 30, layer, o_cloudeffect);
        }
        else
        {
            sprite_index = s_cheese_idle;
        }
    }
    else
    {
        sprite_index = s_cheese_fall;
    }
}
