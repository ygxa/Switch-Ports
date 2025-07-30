if (sprite_index == s_cs_falltv || global.doiseun == 0)
    return 0;

with (other)
{
    if (key_accept && global.player2 == 0)
    {
        audio_play_sound(su_charselect, 50, false);
        global.player2 = "DO";
        global.palp2 = 1;
        other.selected = true;
    }
}
