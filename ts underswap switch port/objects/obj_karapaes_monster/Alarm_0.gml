x = number_approach_smooth(x, xstart, 0.35, 0.5);
y = number_approach_smooth(y, ystart, 0.35, 0.5);

if (x != xstart || y != ystart)
    alarm[0] = 1;
