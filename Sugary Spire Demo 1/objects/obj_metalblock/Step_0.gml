with (instance_nearest(x, y, obj_player))
{
    if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && (state == 67 || state == 17 || state == 92 || state == 101 || state == 11 || state == 2 || state == 29 || state == 102 || state == 98 || (state == 17 && momemtum == 1)))
    {
        with (other.id)
            event_user(0);
    }
    
    if (((place_meeting(x, y + vsp, other.id) && vsp < 0) || place_meeting(x, y - 1, other.id)) && state == 60)
    {
        with (other.id)
            event_user(0);
    }
    
    if (((place_meeting(x, y + vsp, other.id) && vsp < 0) || place_meeting(x, y - 1, other.id)) && state == 10 && mach2 >= 100)
    {
        with (other.id)
            event_user(0);
    }
    
    if (((place_meeting(x, y + vsp, other.id) && vsp >= 0) || place_meeting(x, y + 1, other.id)) && state == 72 && freefallsmash > 10)
    {
        with (other.id)
            event_user(0);
    }
}
