if (state != 147)
{
    wave_seconds--;
    
    if (wave_seconds < 0)
    {
        if (wave_minutes > 0)
        {
            wave_seconds = 59;
            wave_minutes--;
        }
        else
        {
            wave_seconds = 0;
            
            with (obj_player1)
            {
                if (state != 9)
                {
                    vsp = -11;
                    state = 9;
                    targetRoom = lastroom;
                }
            }
        }
    }
}

if (state == 145 || state == 144)
    alarm[0] = 60;
