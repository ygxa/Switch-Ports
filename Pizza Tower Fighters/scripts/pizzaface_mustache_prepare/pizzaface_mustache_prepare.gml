function pizzaface_mustache_prepare()
{
    if (sprite_index != s_pizzaface_mustache_windup)
    {
        sprite_index = s_pizzaface_mustache_windup;
        image_index = 0;
        
        if (hp < (hpmax / 2))
            image_speed = 2;
    }
    
    if (instance_exists(O_Player_1))
    {
        if (y != O_Player_1.y && floor(image_index) < 37)
        {
            direction = point_direction(x, y, O_Player_1.x, O_Player_1.y);
            vsp = lengthdir_y(12, direction);
            y += vsp;
        }
    }
    
    if ((floor(image_index) == 28 || floor(image_index) == 29) && !instance_exists(o_fireflameffect))
    {
        with (instance_create_layer(x - 10, y - 50, "part", o_fireflameffect))
            sprite_index = s_vigi_downspecial_part;
        
        audio_play_sound(su_pizzaface_mustache, 50, false);
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        state = (10 << 0);
        image_speed = 1;
    }
}
