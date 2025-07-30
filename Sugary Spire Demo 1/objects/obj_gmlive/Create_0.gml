instance_destroy();

if (instance_number(obj_gmlive) > 1)
{
    var first = instance_find(obj_gmlive, 0);
    
    if (id != first)
    {
        instance_destroy();
        exit;
    }
}

if (asset_get_index("live_init") == -1)
{
    show_debug_message("live_init is missing!\nEither GMLive is not imported in the project, or the 'GMLive' script got corrupted (try re-importing)\nIf you don't have GMLive, you can safely remove obj_gmlive and any remaining live_* function calls.\n\n");
    instance_destroy();
    exit;
}

live_init(1, "http://localhost:5100", "");
global.live_blank_object = 213;
global.live_blank_room = 106;
global.live_room_updated = scr_room_updated;
