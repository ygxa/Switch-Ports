if (transformable)
{
    if (bt_set_surface_transform())
        exit;
}

var ind = image_index;
var _x = x;

if (bt_monster_sum() == 1 && image_index == 0)
{
    image_index = 5;
    
    if (irandom(4) == 0)
        x += irandom_range(-2, 2);
}

draw_self();
image_index = ind;
x = _x;
