function pizzaface_mustache_start()
{
    if (sprite_index != s_pizzaface_mustache_start)
    {
        sprite_index = s_pizzaface_mustache_start;
        image_index = 0;
    }
    
    if (x != o_pf_point.x)
    {
        direction = point_direction(x, y, o_pf_point.x, o_pf_point.y);
        hsp = lengthdir_x(25, direction);
        vsp = lengthdir_y(25, direction);
        x += hsp;
        y += vsp;
    }
    
    if (floor(image_index) == (image_number - 1))
        state = (15 << 0);
}
