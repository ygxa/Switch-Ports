if (room == rm_ruinc_main || room == rm_ruinc_grillbys)
{
    var _x = x - floor(sprite_xoffset);
    var _y = (y - floor(sprite_yoffset)) + (floor(sprite_height * 0.25) * 3);
    s = instance_create_xy(_x, _y, obj_solid);
    s.image_xscale = sprite_width / 20;
    s.image_yscale = sprite_height / 80;
}
