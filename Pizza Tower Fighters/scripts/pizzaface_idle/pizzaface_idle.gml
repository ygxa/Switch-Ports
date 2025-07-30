function pizzaface_idle()
{
    x += hsp;
    facing = sign(hsp);
    hmove = facing;
    grounded = false;
    
    if (timetillflip > 0)
    {
        timetillflip--;
    }
    else
    {
        timetillflip = irandom_range(50, 90);
        hsp = -hsp;
        facing = sign(hsp);
        hmove = facing;
    }
    
    if (cputimer > 0)
    {
        cputimer--;
    }
    else
    {
        if (hp < (hpmax / 2))
            cputimer = 60;
        else
            cputimer = 120;
        
        switch (attack)
        {
            case 0:
                attack++;
                grv = 0.5;
                
                if (hp < (hpmax / 2))
                    state = (12 << 0);
                else
                    state = (3 << 0);
                
                break;
            
            case 1:
                attack++;
                
                if (x > 120 && x < 820)
                    state = (8 << 0);
                
                break;
            
            case 2:
                attack++;
                state = (9 << 0);
                break;
            
            case 3:
                attack++;
                state = (11 << 0);
                break;
            
            case 4:
                attack = 0;
                state = (19 << 0);
                break;
        }
    }
}
