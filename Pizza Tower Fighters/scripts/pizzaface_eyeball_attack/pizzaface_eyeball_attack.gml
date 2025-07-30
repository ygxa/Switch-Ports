function pizzaface_eyeball_attack()
{
    if (sprite_index != s_pizzaface_eyeless)
    {
        sprite_index = s_pizzaface_eyeless;
        image_index = 0;
        image_speed = 1;
        
        if (hp < (hpmax / 2))
            noisebomb = 4;
        else
            noisebomb = 2;
    }
    
    if (punchcooldown > 0)
    {
        punchcooldown--;
    }
    else if (floor(image_index) == 4)
    {
        noisebomb -= 1;
        audio_play_sound(su_pizzaface_eye, 50, false);
        punchcooldown = 10;
        
        with (instance_create_layer(x + 20, y, "part", o_pizzaface_eye))
            facing = 1;
        
        with (instance_create_layer(x - 20, y, "part", o_pizzaface_eye))
            facing = -1;
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        if (noisebomb == 0)
        {
            sprite_index = s_pizzaface_idle;
            state = (2 << 0);
            hsp = walksp * facing;
        }
    }
}
