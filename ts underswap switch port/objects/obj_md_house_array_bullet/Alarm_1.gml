creepX = number_approach_smooth(creepX, 0, 0.25, 0.5);
creepY = number_approach_smooth(creepY, 0, 0.25, 0.5);

if (creepX != 0 || creepY != 0)
    alarm[1] = 1;
