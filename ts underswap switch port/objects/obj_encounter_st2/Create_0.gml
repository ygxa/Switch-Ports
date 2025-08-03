if (global.areapopulations[2] > 0 && ds_map_find_value(global.flags, "plot") >= 56)
{
    instance_destroy();
    exit;
}

event_inherited();
encounters[0] = 31;
encounters[1] = 29;
encounters[2] = 32;
encounterWeights[0] = 0.3;
encounterWeights[1] = 0.3;
encounterWeights[2] = 0.4;
minimumStepsFirst = ds_map_find_value(global.flags, "st2_enc") ? 180 : 60;
minimumStepsAfter = 300;
factorFirst = 10;
factorAfter = 20;

if (evac(2))
{
    with (instance_create(obj_encounter_sfx))
    {
        if (room == rm_star14B && !ds_map_find_value(global.flags, "st_beenard"))
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
