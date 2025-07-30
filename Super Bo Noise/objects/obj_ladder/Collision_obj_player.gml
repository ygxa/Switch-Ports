with (other)
{
    if (input_check("up") && ladderbuffer == 0 && (state == 2 || state == 60 || state == 106 || state == 123 || state == 105 || state == 59 || state == 94 || state == 62) && state != 109 && state != 107 && state != 110 && state != 113)
    {
        state = 95;
        x = other.x + 16;
        y = floor(y);
        
        if ((y % 2) == 1)
            y -= 1;
    }
    
    if (input_check("up") && ladderbuffer == 0 && (state == 194 || state == 193))
    {
        state = 263;
        
        if (brick == 1)
        {
            with (instance_create(x, y, obj_brickcomeback))
            {
                wait = 1;
                instance_create(x, y, obj_genericpoofeffect);
            }
        }
        
        brick = 0;
        x = other.x + 16;
        y = floor(y);
        
        if ((y % 2) == 1)
            y -= 1;
    }
}
