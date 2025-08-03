x = number_approach_smooth(x, xstart, 0.2, 2);

if (irandom(1) == 0)
    instance_create_xy(x + 126 + 30, y + 80, obj_butchy_smoke);

if (x != xstart)
    alarm[1] = 1;
