function eye_state_idle_spawn()
{
    if (sprite_index != s_secreteye_spawnidle)
    {
        sprite_index = s_secreteye_spawnidle;
        image_index = 0;
        timer = 200;
    }
    
    timer--;
    
    if (timer < 1)
        state = (6 << 0);
}
