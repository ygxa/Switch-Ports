event_inherited();
encounters[0] = 7;
encounters[1] = 10;
encounters[2] = 12;
encounters[3] = 15;
encounterWeights[0] = 0.25;
encounterWeights[1] = 0.15;
encounterWeights[2] = 0.25;
encounterWeights[3] = 0.35;
minimumStepsFirst = 160;
minimumStepsAfter = 150;

if (room == rm_ruin14)
{
    minimumStepsFirst += 100;
    minimumStepsAfter += 100;
}

if (global.areapopulations[0] > 0 && ds_map_find_value(global.flags, "plot") >= 27)
    instance_destroy();
