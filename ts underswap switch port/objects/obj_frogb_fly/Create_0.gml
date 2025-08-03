event_inherited();
easy = instance_exists(obj_loox_monster) && obj_loox_monster.isActive;
depth = -2;
instance_create_xy(x - 2, y - 2, obj_frogb_appear);
image_speed = 0.5;
move_towards_point(obj_battleheart.x + 2, obj_battleheart.y + 2, easy ? 2 : 2.5);
alarm[0] = 30;
alarm[1] = 45;
