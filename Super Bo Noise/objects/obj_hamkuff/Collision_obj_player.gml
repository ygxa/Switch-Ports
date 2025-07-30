if (state != 140)
{
    if (!other.isgustavo)
    {
        if (other.state != 123 || !other.launched)
        {
            if (state != 208)
            {
                sprite_index = spr_hamkuff_chain1;
                state = 208;
                playerid = other.id;
            }
        }
        else
        {
            instance_destroy();
        }
    }
    else if (other.brick && state != 208)
    {
        other.brick = 0;
        state = 208;
        sprite_index = spr_hamkuff_chain1;
        state = 208;
        
        with (other)
        {
            state = 198;
            xscale = -other.image_xscale;
            vsp = -10;
        }
        
        with (instance_create(other.x, other.y, obj_brickcomeback))
        {
            trapped = 1;
            baddieID = other.id;
            other.playerid = id;
        }
    }
    else if (other.state == 261)
    {
        instance_destroy();
    }
    else
    {
        with (other)
        {
            state = 198;
            xscale = other.image_xscale;
            vsp = -10;
        }
    }
}
