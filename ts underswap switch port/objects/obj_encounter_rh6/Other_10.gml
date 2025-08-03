if (ds_map_find_value(global.flags, "rh_butchy") || global.areapopulations[global.currentarea] <= 0)
{
    event_inherited();
}
else
{
    ds_map_set(global.flags, "rh_butchy", true);
    bt_start(24);
    alarm[0] = 1;
}
