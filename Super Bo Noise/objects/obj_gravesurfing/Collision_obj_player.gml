if (buffer <= 0 && other.state != (18 << 0) && other.grounded)
{
    buffer = 50
    with (other)
    {
        vsp = -11
        movespeed = abs(movespeed)
        dir = xscale
        movespeed = 13
        instance_create(x, y, obj_jumpdust)
        sprite_index = spr_null
        image_index = 0
        with (obj_gravecorpse)
        {
            if (playerid == other.id)
                instance_destroy()
        }
        with (instance_create(x, y, obj_gravecorpse))
            playerid = other.id
        state = (213 << 0)
    }
}
