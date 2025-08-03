x = number_approach_smooth(x, 552, 0.25, 0.5);
y = number_approach_smooth(y, 365, 0.25, 0.5);

if (x != 552 || y != 365)
    alarm[4] = 1;
