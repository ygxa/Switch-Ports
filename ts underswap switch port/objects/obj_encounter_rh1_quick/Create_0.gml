event_inherited();
encounters[0] = 6;
encounters[1] = 7;
encounters[2] = 8;
encounters[3] = 9;
encounterWeights[0] = 0.3;
encounterWeights[1] = 0.15;
encounterWeights[2] = 0.25;
encounterWeights[3] = 0.3;
puzzleOffsetSteps = 30;

if (global.areapopulations[0] > 0 && ds_map_find_value(global.flags, "plot") >= 27)
    instance_destroy();
