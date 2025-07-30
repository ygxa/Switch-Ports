with (other)
{
    if (input_check("up") && ladderbuffer == 0 && (state == 2 || state == 60 || state == 106 || state == 123 || state == 105 || state == 59 || state == 94 || state == 62) && state != 109 && state != 107 && state != 110 && state != 113)
    {
        mach2 = 0;
        state = 95;
        y = floor(y);
        
        if ((y % 2) == 1)
            y -= 1;
    }
}
