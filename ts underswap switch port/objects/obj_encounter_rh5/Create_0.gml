event_inherited();
encounters[0] = 8;
encounters[1] = 13;
encounters[2] = 20;
encounters[3] = 21;
encounterWeights[0] = 0.15;
encounterWeights[1] = 0.3;
encounterWeights[2] = 0.35;
encounterWeights[3] = 0.2;
minimumStepsFirst = 160;
minimumStepsAfter = 150;
puzzleOffsetSteps = 150;

if (global.areapopulations[0] > 0 && ds_map_find_value(global.flags, "plot") >= 27)
    instance_destroy();
