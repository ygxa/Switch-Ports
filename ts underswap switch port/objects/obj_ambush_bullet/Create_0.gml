event_inherited();
damageAmount = 8;
image_speed = 0;
depth = -900;
move_towards_point(obj_player.x, obj_player.y, (room == rm_crys_premines) ? 5.7 : 5.1);
direction += random_range(-20, 20);
image_angle = direction - 90;
sfx_play(snd_throw);
