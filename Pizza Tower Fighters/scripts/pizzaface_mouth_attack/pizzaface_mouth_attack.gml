function pizzaface_mouth_attack()
{
    if (sprite_index != s_pizzaface_cheek)
    {
        sprite_index = s_pizzaface_cheek;
        image_index = 0;
        image_speed = 1;
        noisebomb = 30;
    }
    
    if (floor(image_index) == 6 && !instance_exists(o_pizzaface_bubble))
    {
        with (instance_create_layer(x, y + 50, "part", o_pizzaface_bubble))
        {
            if (instance_exists(O_Player_1))
                direction = point_direction(x, y, O_Player_1.x, O_Player_1.y);
            
            speed = 12;
        }
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = s_pizzaface_idle;
        state = (2 << 0);
        hsp = walksp * facing;
    }
}
