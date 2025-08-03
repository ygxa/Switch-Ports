if (ds_map_find_value(async_load, "id") == dialog)
{
    dialog = -1;
    global.fader_on_room_start = true;
    room_goto(rm_intro);
}
