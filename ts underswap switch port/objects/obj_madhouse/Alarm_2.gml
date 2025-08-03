var cam = view_get_camera(0);
camera_set_view_pos(cam, center - 48 - 2, (y + (sprite_height / 2)) - 36);
camera_set_view_size(cam, 96, 72);
alarm[3] = 50;
sprite_index = spr_madhouse;
instance_create_xy(x + 16, y + 25, obj_madhouse_glow);
