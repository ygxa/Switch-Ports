with (other)
{
    if (state == 63 || state == 148 || state == 210)
        exit;
    
    if (state != 271 && state != 110 && state != 113 && state != 273 && state != 272 && state != 78 && state != 270 && sprite_index != spr_dive)
    {
        if (vsp > -8)
            vsp = approach(vsp, -8, 5);
        
        switch (state)
        {
            case 99:
            case 101:
                state = 94;
                break;
            
            case 107:
                if (sprite_index == spr_machslideboost)
                    state = 106;
                
                break;
        }
        
        state = 274;
        jumpstop = true;
    }
}
