var _block = id
with (obj_player1)
{
    if (state != (91 << 0) && place_meeting(x, (y + 1), _block))
    {
        vsp = -11
        _block.image_index = 0
        _block.image_speed = 0.35
    }
}
