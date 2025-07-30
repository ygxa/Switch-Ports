function player_noise_draw()
{
    if (sprite_index != s_noise_draw)
    {
        image_speed = 1;
        image_index = 0;
        sprite_index = s_noise_draw;
        hsp = 0;
        inv = 1;
    }
    
    vsp += grv;
    player_col();
    
    if (floor(image_index) == (image_number - 1))
    {
        image_index = 29;
        image_speed = 0;
    }
}
