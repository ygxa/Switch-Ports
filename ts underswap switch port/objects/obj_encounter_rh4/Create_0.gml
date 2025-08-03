event_inherited();
encounters[0] = 16;
encounters[1] = 17;
encounters[2] = 18;
encounters[3] = 19;
encounterWeights[0] = 0.25;
encounterWeights[1] = 0.15;
encounterWeights[2] = 0.25;
encounterWeights[3] = 0.35;
minimumStepsFirst = 220;
minimumStepsAfter = 320;
puzzleOffsetSteps = 200;

if (global.areapopulations[0] > 0 && ds_map_find_value(global.flags, "plot") >= 27)
    instance_destroy();
