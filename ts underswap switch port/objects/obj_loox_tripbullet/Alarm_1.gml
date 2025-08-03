if (y >= room_height)
{
    x = obj_loox_monster.x;
    y = -100;
    sprite_index = spr_looxfall;
    image_speed = 0;
    image_index = 0;
    alarm[2] = 1;
}
else
{
    alarm[1] = 5;
}
