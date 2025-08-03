if (image_speed == -0.5)
{
    if (image_index <= 0)
    {
        image_index = 0;
        image_speed = 0;
        sprite_index = spr_froglook;
    }
}

if (doReturnAnim)
{
    var dist = point_distance(x, y, xstart, ystart);
    
    if (dist <= 2)
    {
        speed = 0;
        x = xstart;
        y = ystart;
        doReturnAnim = false;
    }
    else
    {
        direction = point_direction(x, y, xstart, ystart);
        speed = dist * 0.25;
    }
}
