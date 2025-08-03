if (y >= obj_loox_monster.y)
{
    vspeed = 0;
    y = obj_loox_monster.y;
    image_speed = 1.5;
    alarm[4] = 2;
    alarm[3] = 15;
}
else
{
    alarm[2] = 1;
}
