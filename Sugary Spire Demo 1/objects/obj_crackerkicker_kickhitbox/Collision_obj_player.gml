with (other.id)
{
    if (instance_exists(other.baddieID) && (state != 93 && (state != 85 && state != 112)))
    {
        state = 93;
        xscale = other.baddieID.image_xscale;
        movespeed = 14;
        vsp = 0;
        sprite_index = spr_tumble;
    }
}
