function pizzaface_intro()
{
    if (y < (ystart - 80))
    {
        y += 2;
    }
    else
    {
        if (sprite_index != s_pizzaface_intro1)
        {
            image_index = 0;
            sprite_index = s_pizzaface_intro1;
            global.player1intro = false;
            yaim = y;
        }
        
        if (floor(image_index) == (image_number - 1))
            state = (1 << 0);
    }
}
