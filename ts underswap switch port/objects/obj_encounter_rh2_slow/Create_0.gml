event_inherited();
encounters[0] = 8;
encounters[1] = 10;
encounters[2] = 11;
encounters[3] = 12;
encounters[4] = 13;
encounterWeights[0] = 0.15;
encounterWeights[1] = 0.25;
encounterWeights[2] = 0.15;
encounterWeights[3] = 0.2;
encounterWeights[4] = 0.25;
minimumStepsFirst = 300;
minimumStepsAfter = 290;
factorFirst = 140;
factorAfter = 230;
puzzleOffsetSteps = 140;

if (global.areapopulations[0] > 0 && ds_map_find_value(global.flags, "plot") >= 27)
    instance_destroy();
