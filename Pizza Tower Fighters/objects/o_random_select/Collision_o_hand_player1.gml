if (sprite_index == s_cs_falltv)
    return 0;

with (other)
{
    if (key_accept)
    {
        if (global.gameselect == "CPU" && global.player2 == 0 && global.player1 != 0)
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
        
        if (global.player1 == 0)
        {
            randomize();
            audio_play_sound(su_charselect, 50, false);
            global.player1 = choose("FP", "TV", "NO", "PS");
            
            if (global.player1 == "TV" || global.player1 == "NO")
                global.palp1 = irandom_range(0, 8);
            else
                global.palp1 = irandom_range(1, 9);
            
            var text = (global.player1 == "FP") ? "FAKER RANDOMLY CHOSEN" : ((global.player1 == "TV") ? "VIGILANTE RANDOMLY CHOSEN" : ((global.player1 == "NO") ? "NOISE RANDOMLY CHOSEN" : ((global.player1 == "DO") ? "DOISE RANDOMLY CHOSEN" : "PEPPINO RANDOMLY CHOSEN")));
            ScrSlidingTextCreate(text);
            global.randomselected = true;
            other.currentrandomlycharacter = global.player1;
        }
    }
}
