if (sprite_index == s_cs_falltv)
    return 0;

with (other)
{
    if (key_accept && global.player2 == 0)
    {
        randomize();
        audio_play_sound(su_charselect, 50, false);
        global.player2 = choose("FP", "TV", "NO", "PS");
        
        if (global.player2 == "TV" || global.player2 == "NO")
            global.palp2 = irandom_range(0, 8);
        else
            global.palp2 = irandom_range(1, 9);
        
        var text = (global.player2 == "FP") ? "FAKER RANDOMLY CHOSEN" : ((global.player2 == "TV") ? "VIGILANTE RANDOMLY CHOSEN" : ((global.player2 == "NO") ? "NOISE RANDOMLY CHOSEN" : "PEPPINO RANDOMLY CHOSEN"));
        ScrSlidingTextCreate(text);
        global.randomselected = true;
        other.currentrandomlycharacter = global.player2;
    }
}
