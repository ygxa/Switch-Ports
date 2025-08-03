var _x = x - floor(sprite_xoffset);
var _y = y - floor(sprite_yoffset);

if (solidBottomHalf)
    _y += floor(sprite_height * 0.5);

s = instance_create_xy(_x, _y, obj_solid);

if (solidBottomHalf)
    s.image_yscale = sprite_height / 40;
else
    s.image_yscale = sprite_height / 20;
