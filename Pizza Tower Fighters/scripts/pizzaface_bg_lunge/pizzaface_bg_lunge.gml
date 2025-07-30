function pizzaface_bg_lunge()
{
    if (sprite_index != s_pizzaface_lunge)
    {
        sprite_index = s_pizzaface_lunge;
        audio_play_sound(su_pizzaface_lunge, 50, false);
        vsp = -8;
        hsp = 0;
    }
    
    vsp += grv;
    player_col();
    
    if (image_xscale < 1)
    {
        image_xscale += 0.02;
        image_yscale += 0.02;
        
        if (palette > 0)
            palette -= 0.05;
    }
    
    if (y > room_height)
    {
        y = 300;
        
        if (instance_exists(O_Player_1))
            x = O_Player_1.x;
    }
    
    if (grounded)
    {
        image_speed = 1;
        inv = false;
        palette = 0;
        state = (13 << 0);
        audio_stop_sound(su_pizzaface_lunge);
    }
}
