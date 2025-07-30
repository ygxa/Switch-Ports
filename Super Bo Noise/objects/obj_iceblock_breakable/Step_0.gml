if (place_meeting(x, y - 1, obj_player1))
{
    with (obj_player1)
    {
        if (state != 188 && place_meeting(x, y + 1, other))
        {
            if (state == 49)
            {
                state = 40;
            }
            else if (state != 40 && state != 101)
            {
                if (state != 107 && state != 7 && state != 44 && state != 105 && state != 106 && state != 123)
                {
                    if (icedir != -xscale && move != 0)
                    {
                        if (prevmovespeed != 0)
                            icemovespeed = prevmovespeed;
                        else
                            icemovespeed = 8;
                        
                        icedir = -xscale;
                        savedicedir = -xscale;
                    }
                    
                    if (prevmove != move && move == 0)
                    {
                        icemovespeed = -(prevmovespeed - previcemovespeed);
                        icedir = -xscale;
                    }
                }
                else if (state == 107)
                {
                    if (prevstate != state)
                    {
                        icedir = xscale;
                        icemovespeed = floor(abs(movespeed) * 0.5);
                    }
                }
                else if (state == 7)
                {
                    icemovespeed = 0;
                }
            }
        }
    }
}
