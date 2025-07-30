if (sprite_index == s_cs_falltv)
    return 0;

with (other)
{
    if (key_accept)
    {
        if (global.gameselect == "CPU" && global.player2 == 0 && global.player1 != 0)
        {
            global.player2 = "TV";
            global.palp2 = 0;
            other.selected = true;
            audio_play_sound(su_charselect, 50, false);
        }
        
        if (global.player1 == 0)
        {
            global.player1 = "TV";
            global.palp1 = 0;
            other.selected = true;
            audio_play_sound(su_charselect, 50, false);
        }
    }
}
