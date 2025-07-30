if (place_meeting(x, y - 16, obj_player1))
{
    with (obj_player1)
    {
        if (place_meeting(x, y + 16, other.id) && !place_meeting_collision(x + xscale, y, 1) && bbox_bottom <= other.bbox_top && xscale == sign(other.image_xscale))
        {
            if (state == 106 || state == 203 || state == 213 || state == 7 || state == 123 || state == 189)
            {
                vsp = -12;
                movespeed = 14;
                sprite_index = spr_player_rampjump;
                image_index = 0;
                
                if (isgustavo)
                {
                    sprite_index = spr_player_ratmountwalljump;
                    state = 205;
                }
                else
                {
                    state = 189;
                }
                
                if (!other.used)
                {
                    ramp = 1;
                    other.used = 1;
                }
                
                ramp_buffer = 16;
                did_ramp = false;
                trace("trickjump");
            }
        }
    }
}
