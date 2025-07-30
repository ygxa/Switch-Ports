if (instance_exists(cpuboy))
{
    if (distance_to_object(cpuboy) < 32)
        phase++;
    
    if (phase > 10)
        phase = 0;
    
    switch (phase)
    {
        case 0:
            x = 958;
            y = 504;
            break;
        
        case 1:
        case 9:
            x = 1660;
            y = 705;
            break;
        
        case 2:
        case 10:
            x = 254;
            y = 705;
            break;
        
        case 3:
        case 8:
            x = 960;
            y = 767;
            break;
        
        case 4:
        case 7:
            x = 960;
            y = 1155;
            break;
        
        case 5:
            x = 416;
            y = 1090;
            break;
        
        case 6:
            x = 1490;
            y = 1090;
            break;
    }
}

if (!instance_exists(cpuboy))
    instance_destroy();
else if (cpuboy.state != (19 << 0) && cpuboy.CPUtimetillpath != 0)
    instance_destroy();
