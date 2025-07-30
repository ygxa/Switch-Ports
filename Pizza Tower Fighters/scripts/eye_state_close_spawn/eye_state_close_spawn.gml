function eye_state_close_spawn()
{
    if (sprite_index != s_secreteye_closespawn)
    {
        sprite_index = s_secreteye_closespawn;
        image_index = 0;
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        state = (0 << 0);
        timer = irandom_range(200, 600);
    }
}
