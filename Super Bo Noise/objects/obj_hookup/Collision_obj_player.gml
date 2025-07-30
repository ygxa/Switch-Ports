with (other)
{
    if (input_check("up") && ladderbuffer == 0 && (state == 11 || state == 2 || state == 60 || state == 106 || state == 123 || state == 105 || state == 59 || state == 94 || state == 62) && state != 109 && state != 107 && state != 110 && state != 113)
    {
        other.hooked = 1;
        hooked = 1;
        mach2 = 0;
        state = 95;
        x = other.x + 16;
        y = other.y + 40;
    }
}
