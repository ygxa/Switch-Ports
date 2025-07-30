with (instance_nearest(x, y, obj_player))
{
    if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && state == 85 && movespeed >= 8)
    {
        with (other.id)
            instance_destroy();
    }
    
    if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && state == 85 && sprite_index == spr_cotton_attack)
    {
        with (other.id)
            instance_destroy();
    }
    
    if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && state == 95)
    {
        with (other.id)
            instance_destroy();
    }
    
    if (((place_meeting(x, y + vsp, other.id) && vsp > 0) || place_meeting(x, y + 1, other.id)) && state == 94)
    {
        with (other.id)
            instance_destroy();
    }
    
    if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && state == 98)
    {
        with (other.id)
            instance_destroy();
    }
    
    if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && state == 103)
    {
        with (other.id)
            instance_destroy();
    }
    
    if ((place_meeting(x, y + vsp, other.id) || place_meeting(x, y + sign(vsp), other.id)) && state == 103)
    {
        with (other.id)
            instance_destroy();
    }
}
