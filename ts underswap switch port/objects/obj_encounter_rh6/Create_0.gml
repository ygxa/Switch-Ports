event_inherited();
encounters[0] = 22;
encounters[1] = 20;
encounters[2] = 23;
encounters[3] = 24;
encounterWeights[0] = 0.15;
encounterWeights[1] = 0.2;
encounterWeights[2] = 0.3;
encounterWeights[3] = 0.35;
minimumStepsFirst = 200;
minimumStepsAfter = 190;
puzzleOffsetSteps = 150;

if (global.areapopulations[0] > 0 && ds_map_find_value(global.flags, "plot") >= 27)
    instance_destroy();
