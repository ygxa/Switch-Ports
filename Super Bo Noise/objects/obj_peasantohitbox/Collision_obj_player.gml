with (other)
{
    if (character == "V")
    {
        scr_hurtplayer(id);
    }
    else if (state != 123 && (state != 63 || tauntstoredstate != 123) && state != 5 && state != 91 && state != 33 && state != 188)
    {
        var _pindex = (object_index == obj_player1) ? 0 : 1;
        GamepadSetVibration(_pindex, 1, 1, 0.85);
        state = 11;
        vsp = -25;
        sprite_index = spr_fireass;
        image_index = 0;
    }
}
