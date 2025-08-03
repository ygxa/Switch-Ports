if (global.areapopulations[2] > 0 && ds_map_find_value(global.flags, "plot") >= 56)
{
    instance_destroy();
    exit;
}

event_inherited();
encounters[0] = 28;
encounters[1] = 31;
encounterWeights[0] = 0.6;
encounterWeights[1] = 0.4;
minimumStepsFirst = 60;
minimumStepsAfter = 150;

if (room == rm_star4)
{
    minimumStepsAfter += 100;
}
else if (room == rm_star10)
{
    minimumStepsFirst += 100;
    minimumStepsAfter += 60;
}

if (evac(2))
{
    with (instance_create(obj_encounter_sfx))
    {
        if (room == rm_star10 && !ds_map_find_value(global.flags, "st_beenard"))
        {
            array_push(sounds, 
            {
                sound: snd_beenardcry,
                gain: 0.3
            });
            array_push(sounds, 
            {
                sound: snd_beenardhurt,
                gain: 0.3
            });
        }
    }
}
