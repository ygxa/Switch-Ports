if (state != 76 && state != 140 && state != 6)
{
    if (other.state == 136)
    {
        golfid = other.id;
        shot = 0;
        state = 76;
        sprite_index = spr_golfburger_golf;
        image_index = 0;
        
        if (shootdir == 0)
            image_xscale = choose(-1, 1);
        else
            image_xscale = shootdir;
    }
    else if (other.state == 158)
    {
        instance_destroy();
    }
}
