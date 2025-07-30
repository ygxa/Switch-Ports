function player_faker_down_aerial_start()
{
    if (sprite_index != s_fakepep_down_aerial_start)
    {
        grv = 0.5;
        vsp = -10;
        audio_play_sound(su_fakepep_bodyslam_st, 50, false);
        sprite_index = s_fakepep_down_aerial_start;
        image_index = 0;
        image_speed = 1;
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
        hmove = key_right - key_left;
        
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
    
    if (floor(image_index) == (image_number - 1) || place_meeting(x, y + 1, ObjWall))
        state = (4 << 0);
}
