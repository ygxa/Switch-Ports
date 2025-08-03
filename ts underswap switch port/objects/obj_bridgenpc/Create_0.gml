event_inherited();

if (ds_map_find_value(global.flags, "plot") < 24)
{
    instance_destroy();
}
else if (ds_map_find_value(global.flags, "plot") >= 27)
{
    sprite_index = spr_whimsunow_up;
    siner = 0;
    image_speed = 1;
}
else
{
    sprite_index = spr_tem_up_walk;
    image_speed = 0;
}
