x = number_approach_smooth(x, 515, 0.25, 0.5);
y = number_approach_smooth(y, 415, 0.25, 0.5);

if (x != 515 || y != 415)
    alarm[5] = 1;
