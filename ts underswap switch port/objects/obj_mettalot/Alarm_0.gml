micXOffset = number_approach_smooth(micXOffset, 45, 0.25, 0.5);

if (micXOffset == 45)
    scene_resume();
else
    alarm[0] = 1;
