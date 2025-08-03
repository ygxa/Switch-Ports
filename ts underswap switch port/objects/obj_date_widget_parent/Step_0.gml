if (smoothMovement)
{
    x = number_approach_smooth(x, targetX, 0.05, 0.5);
    y = number_approach_smooth(y, targetY, 0.05, 0.5);
}
else
{
    x = number_approach_linear(x, targetX, nonSmoothSpeed);
    y = number_approach_linear(y, targetY, nonSmoothSpeed);
}

if (instance_exists(obj_dateheart) && obj_dateheart.canMove && cooldown > 0)
    cooldown--;
