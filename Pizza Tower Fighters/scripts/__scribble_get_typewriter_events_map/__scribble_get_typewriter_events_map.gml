function __scribble_get_typewriter_events_map()
{
    static _map = ds_map_create();
    
    return _map;
}

function __scribble_typewrite_events_map_initialize()
{
    var _map = __scribble_get_typewriter_events_map();
    ds_map_set(_map, "pause", undefined);
    ds_map_set(_map, "delay", undefined);
    ds_map_set(_map, "sync", undefined);
    ds_map_set(_map, "speed", undefined);
    ds_map_set(_map, "/speed", undefined);
}
