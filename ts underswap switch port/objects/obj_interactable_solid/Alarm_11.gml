if (variable_instance_exists(id, "notSolid") && notSolid)
    exit;

if (variable_instance_exists(id, "solidBbox") && solidBbox)
{
    s = instance_create_xy(bbox_left, bbox_top, obj_solid);
    s.image_xscale = (bbox_right - bbox_left) / 20;
    s.image_yscale = (bbox_bottom - bbox_top) / 20;
}
else
{
    var _x = x - floor(sprite_xoffset);
    var _y = y - floor(sprite_yoffset);
    
    if (solidBottomHalf)
        _y += floor(sprite_height * 0.5);
    
    s = instance_create_xy(_x, _y, obj_solid);
    s.image_xscale = sprite_width / 20;
    
    if (solidBottomHalf)
        s.image_yscale = sprite_height / 40;
    else
        s.image_yscale = sprite_height / 20;
}
