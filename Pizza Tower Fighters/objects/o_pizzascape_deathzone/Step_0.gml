if (activated != 0)
{
    if (!instance_exists(o_ghost_crusher))
    {
        with (instance_create_layer(x, -1000, layer, o_ghost_crusher))
            targeting = other.activated;
    }
}

if (!place_meeting(x, y, O_Player_1) && !place_meeting(x, y, O_Player_2))
    activated = 0;
