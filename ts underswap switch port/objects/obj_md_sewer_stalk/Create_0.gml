if (ds_map_find_value(global.flags, "plot") >= 24.75)
{
    if (ds_map_find_value(global.flags, "plot") >= 25)
        instance_destroy(obj_ruin_sewer_spotlight);
    
    with (obj_trigger_code)
    {
        if (x < 560)
            instance_destroy();
    }
    
    instance_destroy();
    exit;
}

currentTarget = x + 160;
siner = 0;
