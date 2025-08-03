x += spd;
grav += (dir * 0.005);
spd += grav;
y = number_approach_smooth(y, obj_battlemanager.boxY1 + 4, 0.03, 0.5);
