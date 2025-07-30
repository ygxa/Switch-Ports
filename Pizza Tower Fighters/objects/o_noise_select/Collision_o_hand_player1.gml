if (sprite_index == s_cs_falltv)
    return 0;

with (other)
{
    if (key_accept)
    {
        if (global.gameselect == "CPU" && global.player2 == 0 && global.player1 != 0)
        {
            global.player2 = "NO";
            other.selected = 1;
            global.palp2 = 0;
            audio_play_sound(su_charselect, 50, false);
        }
        
        if (global.player1 == 0)
        {
            global.player1 = "NO";
            global.palp1 = 0;
            other.selected = 1;
            audio_play_sound(su_charselect, 50, false);
        }
    }
}
