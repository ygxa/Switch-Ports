if (sprite_index == s_cs_falltv)
    return 0;

with (other)
{
    if (key_accept)
    {
        audio_play_sound(su_charselect, 50, false);
        global.player1 = "GB";
        global.palp1 = 1;
        instance_destroy();
    }
}
