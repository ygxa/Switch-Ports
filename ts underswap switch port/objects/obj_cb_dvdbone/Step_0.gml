image_angle += rotSpeed;

if ((x + hspeed + 19) >= obj_battlemanager.boxX2 || ((x + hspeed) - 19) <= obj_battlemanager.boxX1)
{
    hspeed *= -1;
    sfx_play(snd_swallow);
    view_shake(2, 2);
}

if ((y + vspeed + 19) >= obj_battlemanager.boxY2 || ((y + vspeed) - 19) <= obj_battlemanager.boxY1)
{
    vspeed *= -1;
    sfx_play(snd_swallow);
    view_shake(2, 2);
}

if (!initialAccel)
    speed += accel;
