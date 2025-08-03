if (hp < maxHp)
{
    ds_map_set(global.flags, "ff", 1);
    dx_scene("battles.first_froggit.fightnk");
}
else
{
    dx_scene("battles.first_froggit.nonfight");
}
