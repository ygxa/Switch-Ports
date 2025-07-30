function Scr_Granny_Sound()
{
    var _rats = irandom_range(1, 3);
    
    switch (_rats)
    {
        case 1:
            audio_play_sound(su_pizza_granny, 100, false);
            break;
        
        case 2:
            audio_play_sound(su_pizza_granny2, 100, false);
            break;
        
        case 3:
            audio_play_sound(su_pizza_granny3, 100, false);
            break;
    }
}
