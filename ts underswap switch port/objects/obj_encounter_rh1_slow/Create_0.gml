event_inherited();
minimumStepsFirst = 260;
minimumStepsAfter = 250;
factorFirst = 140;
factorAfter = 230;
puzzleOffsetSteps = 300;

if (global.areapopulations[0] > 0 && ds_map_find_value(global.flags, "plot") >= 27)
    instance_destroy();
