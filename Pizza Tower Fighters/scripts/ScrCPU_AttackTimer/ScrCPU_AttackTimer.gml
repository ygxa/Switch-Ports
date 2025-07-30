function ScrCPU_AttackTimer()
{
    switch (global.CPULVL)
    {
        case 1:
            if (cputimerbaybee != 0)
                cputimerbaybee--;
            
            if (state != (1 << 0) && state != (1 << 0) && state != (2 << 0))
                cputimerbaybee = 90;
            
            break;
        
        case 2:
            if (cputimerbaybee != 0)
                cputimerbaybee--;
            
            if (state != (1 << 0) && state != (1 << 0) && state != (2 << 0) && state != (0 << 0))
                cputimerbaybee = 50;
            
            break;
        
        case 3:
            if (cputimerbaybee != 0)
                cputimerbaybee--;
            
            if (state != (1 << 0) && state != (1 << 0) && state != (2 << 0) && state != (0 << 0))
                cputimerbaybee = 35;
            
            break;
        
        case 4:
            if (cputimerbaybee != 0)
                cputimerbaybee--;
            
            if (state != (1 << 0) && state != (1 << 0) && state != (2 << 0) && state != (0 << 0))
                cputimerbaybee = 15;
            
            break;
        
        case 5:
            if (cputimerbaybee != 0)
                cputimerbaybee--;
            
            if (state != (1 << 0) && state != (1 << 0) && state != (2 << 0) && state != (0 << 0))
                cputimerbaybee = 5;
            
            break;
    }
}
