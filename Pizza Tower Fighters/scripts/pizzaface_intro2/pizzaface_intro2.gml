function pizzaface_intro2()
{
    if (sprite_index != s_pizzaface_intro2)
    {
        sprite_index = s_pizzaface_intro2;
        image_index = 0;
        audio_play_sound(su_pizzaface_laugh, 50, false);
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        state = (2 << 0);
        sprite_index = s_pizzaface_idle;
        global.player2intro = false;
    }
}
