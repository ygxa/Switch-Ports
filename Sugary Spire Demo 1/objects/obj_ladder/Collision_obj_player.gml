with (obj_player)
{
    if (key_up && ladderbuffer == 0 && (state == 0 || state == 86 || state == 66 || state == 67 || state == 65 || state == 23 || state == 57 || state == 25) && state != 70 && state != 68 && state != 71 && state != 72)
    {
        hsp = 0;
        vsp = 0;
        mach2 = 0;
        state = 56;
        x = other.x + 16;
        y = floor(y);
        
        if ((y % 2) == 1)
            y -= 1;
    }
}
