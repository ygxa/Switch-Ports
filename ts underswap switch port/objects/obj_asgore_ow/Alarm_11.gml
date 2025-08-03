switch (type)
{
    case 0:
        global.currentnpc = id;
        break;
}

if (type != 7)
    visible = true;

var _x = x - floor(sprite_xoffset);
var _y = (y - floor(sprite_yoffset)) + (floor(sprite_height * 0.25) * 3);
s = instance_create_xy(_x, _y, obj_solid);
s.image_xscale = sprite_width / 20;
s.image_yscale = sprite_height / 80;
