with (obj_player1)
{
    if (shotgunAnim == 1)
    {
        if (state != 2 && state != 102 && state != 73 && state != 113 && state != 94 && state != 44)
            other.visible = true;
        else
            other.visible = false;
    }
    
    other.x = x - (20 * xscale);
    other.y = y;
    other.image_xscale = -xscale;
}

if (room == rank_room)
    visible = false;
