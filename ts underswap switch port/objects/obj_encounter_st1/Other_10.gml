if (room == rm_star10 && !ruth_started())
{
    if (ds_map_find_value(global.flags, "st_beenard") || global.areapopulations[global.currentarea] <= 0)
    {
        event_inherited();
    }
    else
    {
        ds_map_set(global.flags, "st_beenard", true);
        bt_start(30);
        alarm[0] = 1;
        
        with (obj_encounter_sfx)
        {
            deleteSound(snd_beenardcry);
            deleteSound(snd_beenardhurt);
        }
    }
}
else
{
    event_inherited();
}
