function player_faker_downspecial_inv()
{
    if (sprite_index != s_fakepep_disappeared)
    {
        gone = 80;
        image_speed = 1;
        sprite_index = s_fakepep_disappeared;
        mask_index = s_fakepep_disappeared;
    }
    
    gone--;
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
    
    if (!place_meeting(x, y, ObjWall))
    {
        hsp = (accel_final * last_h) + (2 * last_h);
        vsp += grv;
    }
    
    player_col();
    
    if (gone < 0 || key_Q)
        state = (14 << 0);
}
