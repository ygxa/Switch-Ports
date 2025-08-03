try
{
    if (ds_map_find_value(async_load, "status"))
    {
        var _id = ds_map_find_value(async_load, "id");
        
        if (_id == debugPlot)
            ds_map_set(global.flags, "plot", real(ds_map_find_value(async_load, "value")));
        else if (_id == debugBattle)
            bt_start(ds_map_find_value(async_load, "value"), false);
    }
}
catch (e)
{
    debug_error(e);
}
