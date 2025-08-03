if (global.control_gamepad_supported)
{
    if (global.control_gamepad && global.control_gamepad_device != -1)
        global.control_gamepad = gamepad_is_connected(global.control_gamepad_device);
    
    switch (ds_map_find_value(async_load, "event_type"))
    {
        case "gamepad discovered":
            if (!global.control_gamepad || global.gamepad_buttons_type == -1)
            {
                checkingPadIndex = ds_map_find_value(async_load, "pad_index");
                alarm[6] = 2;
            }
            
            break;
        
        case "gamepad lost":
            if (global.control_gamepad_device == ds_map_find_value(async_load, "pad_index"))
            {
                global.control_gamepad = false;
                global.control_gamepad_device = -1;
                global.last_connected_gamepad = -1;
            }
            
            break;
    }
}
