repeat (irandom(7))
{
    var star = instance_create_xy(x, y, obj_mettwink_star);
    
    with (star)
    {
        direction = irandom(360);
        speed = irandom_range(12, 16);
        image_xscale = other.image_xscale * 2;
        image_yscale = other.image_yscale * 2;
        depth = other.depth - 1;
    }
}

alarm[0] = irandom_range(20, 30);
