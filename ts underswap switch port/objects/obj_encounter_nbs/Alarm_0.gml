if (doneFirst)
    requiredSteps = steps_calculate(minimumStepsAfter, factorAfter, didFirstAllDead);
else
    requiredSteps = steps_calculate(minimumStepsFirst, factorFirst, didFirstAllDead);

if (!didFirstAllDead && global.areapopulations[global.currentarea] <= 0)
    didFirstAllDead = true;

if (instance_exists(obj_puzzlemaster_parent))
{
    if (obj_puzzlemaster_parent.state != (2 << 0))
        requiredSteps += puzzleOffsetSteps;
}
