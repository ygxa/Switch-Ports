if (!ds_map_find_value(global.flags, "enc"))
{
    instance_destroy();
    exit;
}

didFirstAllDead = false;
doneFirst = false;
allDeadEncounter = 5;
minimumStepsFirst = 90;
minimumStepsAfter = 120;
factorFirst = 50;
factorAfter = 50;
requiredSteps = 120;
puzzleOffsetSteps = 0;
noZoneChance = 0;
trackKills = false;
roomFlag = "k_" + string_delete(room_get_name(room), 1, 3);
empty = false;
var currentKills = ds_map_find_value(global.flags, roomFlag);

if (!is_undefined(currentKills) && currentKills >= maxKills)
    empty = true;
