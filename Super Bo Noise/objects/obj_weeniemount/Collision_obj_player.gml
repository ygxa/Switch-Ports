with (other)
{
    if (state == 44 || state == 82)
    {
        state = 33;
        movespeed = hsp;
        sprite_index = spr_rideweenie;
        xscale = other.image_xscale;
        jumpstop = 1;
        
        if (vsp < 0)
            vsp = 0;
        
        instance_destroy(other);
    }
}
