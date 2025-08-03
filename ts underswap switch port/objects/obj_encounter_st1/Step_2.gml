if (room != rm_star10 && global.canmove)
{
    var pop = global.areapopulations[2];
    
    if (pop > 0 && pop <= 8 && ruth_enabled() && !ds_map_find_value(global.flags, "st_beewarn") && !ds_map_find_value(global.flags, "st_beenard"))
    {
        ds_map_set(global.flags, "st_beewarn", true);
        dx_scene("star.beewarn");
    }
}

event_inherited();
