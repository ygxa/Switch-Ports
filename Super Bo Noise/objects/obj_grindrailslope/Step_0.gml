with (obj_player1)
{
    if (state != 86 && state != 108)
    {
        if (place_meeting_slopePlatform(x, y + 1, other) && vsp >= 0)
        {
            if (!isgustavo && state != 80)
            {
                state = 80;
                vsp = 0;
            }
            else if (isgustavo && state != 204)
            {
                if (brick == 1)
                {
                    with (instance_create(x, y, obj_brickcomeback))
                        wait = 1;
                }
                
                brick = 0;
                y += 46;
                state = 204;
            }
        }
    }
}
