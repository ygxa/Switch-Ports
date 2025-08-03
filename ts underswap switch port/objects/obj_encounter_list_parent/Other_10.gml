if (global.areapopulations[global.currentarea] <= 0)
{
    bt_start(allDeadEncounter);
}
else if (empty)
{
    bt_start_noone();
}
else
{
    bt_start(encounters[xirandom(array_length(encounters) - 1)]);
    ds_map_set(global.flags, "last_killed", 0);
    trackKills = true;
}

alarm[0] = 1;
