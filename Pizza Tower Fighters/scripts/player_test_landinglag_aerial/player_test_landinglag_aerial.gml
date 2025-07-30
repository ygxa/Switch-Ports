function player_test_landinglag_aerial()
{
    hsp = 0;
    vsp = 0;
    
    if (sprite_index != s_test_land)
    {
        sprite_index = s_test_land;
        image_index = 0;
        image_speed = 2;
    }
    
    if (floor(image_index) == (image_number - 1))
        state = (0 << 0);
}
