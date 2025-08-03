repeat (2)
{
    var side = xchoose(0, 1);
    
    if (side)
    {
        with (instance_create_xy(660, random_range(obj_hitthetarget.borderTop + 120, obj_hitthetarget.borderBottom - 120), obj_htt_bul))
        {
            hspeed = -min(max(4, intensity), 18);
            spin = hspeed * 2;
        }
    }
    else
    {
        with (instance_create_xy(-20, random_range(obj_hitthetarget.borderTop + 120, obj_hitthetarget.borderBottom - 120), obj_htt_bul))
        {
            hspeed = min(max(4, intensity), 18);
            spin = hspeed * 2;
        }
    }
}

alarm[0] = max(1, 30 - floor(intensity));
