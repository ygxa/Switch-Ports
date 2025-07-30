with (other)
{
    if (state != 213 && state != 212 && state != 23)
    {
        sprite_index = spr_slipbanan1;
        other.drop = 1;
        vsp = -11;
        movespeed += 2;
        
        if (movespeed > 14)
            movespeed = 14;
        
        hsp = movespeed * xscale;
        image_index = 0;
        state = 167;
    }
    
    instance_destroy(other);
}
