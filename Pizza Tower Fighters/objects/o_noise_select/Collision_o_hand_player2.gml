if (sprite_index == s_cs_falltv)
    return 0;

with (other)
{
    if (key_accept && global.player2 == 0)
    {
        audio_play_sound(su_charselect, 50, false);
        global.player2 = "NO";
        other.selected = 1;
        global.palp2 = 0;
    }
}
