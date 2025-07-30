with (other)
{
    if (state != 192 && vsp > 0 && !place_meeting(x, yprevious, other))
    {
        if (state == 13 || state == 14 || state == 15)
            has_mort = 1;
        else
            has_mort = 0;
    }
}
