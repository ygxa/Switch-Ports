function pizzaface_recovering()
{
    if (sprite_index != s_pizzaface_recovering)
    {
        sprite_index = s_pizzaface_recovering;
        image_index = 0;
        PummelWeed = 120;
    }
    
    if (point_distance(x, y, ObjGame.x, 335) > 10)
    {
        direction = point_direction(x, y, ObjGame.x, 335);
        hsp = lengthdir_x(10, direction);
        vsp = lengthdir_y(10, direction);
        x += hsp;
        y += vsp;
    }
    
    PummelWeed -= 1;
    
    if (PummelWeed == 0)
        state = (6 << 0);
}
