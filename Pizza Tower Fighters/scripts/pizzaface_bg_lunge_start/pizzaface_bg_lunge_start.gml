function pizzaface_bg_lunge_start()
{
    if (sprite_index != s_pizzaface_lunge_recover)
    {
        sprite_index = s_pizzaface_lunge_recover;
        audio_play_sound(su_pizzaface_lunge_recover, 50, false);
        inv = true;
    }
    
    if (floor(image_index) == (image_number - 1))
        image_speed = 0;
    
    y -= 10;
    
    if (y < -20)
    {
        image_speed = 1;
        state = (16 << 0);
        
        if (instance_exists(O_Player_1))
        {
            x = O_Player_1.x;
            y = 300;
            var _wall = instance_nearest(x, y, ObjWall);
            targety = _wall.y;
            image_xscale = 0.1;
            vsp = -8;
            palette = 1;
            image_yscale = 0.1;
        }
    }
}
