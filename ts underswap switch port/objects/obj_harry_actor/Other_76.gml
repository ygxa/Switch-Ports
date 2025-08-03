if (ds_map_find_value(event_data, "event_type") == "sprite event")
{
    switch (ds_map_find_value(event_data, "message"))
    {
        case "propeller":
            sfx_play(snd_click);
            break;
    }
}
