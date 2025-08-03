if (y != 135)
{
    if (ds_map_find_value(global.flags, "rh10_rt") == 0)
    {
        sceneName = "int.ruined10_2";
        ds_map_set(global.flags, "rh10_rt", 1);
    }
    else if (failed)
    {
        sceneName = "int.ruined10_4";
    }
    else
    {
        sceneName = "int.ruined10_3";
    }
}

event_inherited();
