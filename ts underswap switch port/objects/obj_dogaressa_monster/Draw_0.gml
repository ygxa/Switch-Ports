if (transformable)
{
    if (bt_set_surface_transform())
        exit;
}

var ind = image_index;
var _x = x;

if (bt_monster_sum() == 1 && image_index == 0)
{
    image_index = 4;
    
    if (irandom(6) == 0)
        x += irandom_range(-1, 1);
}

draw_self();
image_index = ind;
x = _x;
