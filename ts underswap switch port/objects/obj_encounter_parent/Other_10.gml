if (empty)
{
    bt_start_noone();
}
else
{
    bt_start(0);
    ds_map_set(global.flags, "last_killed", 0);
    trackKills = true;
}
