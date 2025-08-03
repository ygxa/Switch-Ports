event_inherited();
depth = -2;
instance_create_xy(x - 2, y - 2, obj_frogb_appear);
image_speed = 0.5;
move_towards_point(x + irandom_range(-4, 4), (obj_battlemanager.boxY1 + obj_battlemanager.boxY2) / 2, 2);
alarm[0] = 30;
alarm[1] = 45;
