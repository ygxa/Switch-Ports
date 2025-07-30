function pizzaface_lunge_recover()
{
    if (sprite_index != s_pizzaface_lunge_recover)
    {
        sprite_index = s_pizzaface_lunge_recover;
        audio_play_sound(su_pizzaface_lunge_recover, 50, false);
        targety = ystart - 50;
    }
    
    if (floor(image_index) == (image_number - 1))
        image_speed = 0;
    
    y -= 10;
    
    if (y < yaim)
    {
        image_speed = 1;
        state = (7 << 0);
    }
}
