if (place_meeting(x, y - 1, obj_player1))
{
    with (obj_player1)
    {
        if (state != 150 && state != 93 && state != 188 && state != 212 && state != 213)
        {
            if (place_meeting(x, y + 1, other))
            {
                if (state != 115 && state != 116 && state != 118 && state != 117)
                {
                    state = 96;
                    sprite_index = spr_currentplayer;
                }
                else
                {
                    state = 118;
                }
                
                xscale = sign(other.image_xscale);
                movespeed = 20;
            }
        }
        else
        {
            vsp = -6;
            image_index = 0;
        }
    }
}
