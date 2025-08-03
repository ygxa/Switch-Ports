if (ds_map_find_value(global.flags, "rh5_candy") == 4)
{
    image_index = 1;
    
    if ((obj_player.x - (obj_player.sprite_width * 0.5)) >= (x + 19))
        depth = 90;
    else
        depth = -(y + _offsetY);
}
else
{
    image_index = 0;
    depth = -(y + _offsetY);
}
