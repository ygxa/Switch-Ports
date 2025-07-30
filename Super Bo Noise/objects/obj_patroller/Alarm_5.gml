if (patroltimer > 0)
{
    patroltimer--;
    alarm[5] = 60;
}
else
{
    patrolfound = 0;
    state = 82;
    sprite_index = spr_patroller_alert;
    image_index = 0;
    scr_monster_activate();
}
