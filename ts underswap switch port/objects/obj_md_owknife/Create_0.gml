sfx_play(snd_ding);
image_alpha = 0;
image_angle = -90;
targetDir = point_direction(x, y, obj_player.x, obj_player.y) - 90;
state = 0;
done = false;
depth = -100;
alarm[0] = 1;
