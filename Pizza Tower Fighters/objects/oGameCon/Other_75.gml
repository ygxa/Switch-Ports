exit;
show_debug_message("Event = " + ds_map_find_value(async_load, "event_type"));
show_debug_message("Pad = " + string(ds_map_find_value(async_load, "pad_index")));

switch (ds_map_find_value(async_load, "event_type"))
{
    case "gamepad discovered":
        var pad = ds_map_find_value(async_load, "pad_index");
        gamepad_set_axis_deadzone(pad, 0.5);
        gamepad_set_button_threshold(pad, 0.1);
        
        if (global.P1controllerport == 0)
            global.P1controllerport = pad;
        
        if (global.P1controllerport != 0 && global.P2controllerport == 0)
            global.P2controllerport = pad;
        
        break;
    
    case "gamepad lost":
        var pad = ds_map_find_value(async_load, "pad_index");
        
        if (instance_exists(player[pad]))
        {
            if (pad == global.P1controllerport)
                global.P1controllerport = 0;
            else
                global.P2controllerport = 0;
        }
        
        break;
}
