function pizzaface_lunge_end()
{
    if (sprite_index != s_pizzaface_lunge_end)
    {
        sprite_index = s_pizzaface_lunge_end;
        image_index = 0;
        image_speed = 1;
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        state = (2 << 0);
        sprite_index = s_pizzaface_idle;
        hsp = walksp * hmove;
    }
}
