function pizzaface_lunge_start()
{
    if (sprite_index != s_pizzaface_lunge_start)
    {
        sprite_index = s_pizzaface_lunge_start;
        image_index = 0;
        audio_play_sound(su_pizzaface_lunge_start, 50, false);
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        state = (4 << 0);
        
        if (instance_exists(O_Player_1))
        {
            targetx = O_Player_1.x;
            var _wall = instance_nearest(x, y, ObjWall);
            targety = _wall.y;
        }
    }
}
