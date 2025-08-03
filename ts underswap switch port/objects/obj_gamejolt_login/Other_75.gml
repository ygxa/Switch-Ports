if (global.ostype == 1)
{
    if (ds_map_find_value(async_load, "event_type") == "virtual keyboard status")
    {
        var s = ds_map_find_value(async_load, "keyboard_status");
        
        if (state < 2)
        {
            if (s == "hidden" || s == "hiding")
                keyboard_virtual_show(1, 9, 0, false);
        }
        else if (s == "showing" || s == "visible")
        {
            keyboard_virtual_hide();
        }
    }
}
