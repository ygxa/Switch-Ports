switch (room)
{
    case rm_star12:
        if (ruth_started() || global.areapopulations[2] <= 6)
            instance_destroy();
        else if (ds_map_find_value(global.flags, "bird") >= 2 || ds_map_find_value(global.flags, "plot") >= 57)
            instance_destroy();
        
        break;
    
    default:
        if (ds_map_find_value(global.flags, "bird") == 0 && ds_map_find_value(global.flags, "plot") >= 25)
            ds_map_set(global.flags, "bird", 1);
        
        if (ruth_enabled() || ds_map_find_value(global.flags, "bird") != 0)
            instance_destroy();
        
        break;
}
