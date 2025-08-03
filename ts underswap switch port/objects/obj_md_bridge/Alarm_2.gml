var cam = view_get_camera(0);
camera_set_view_pos(cam, 717, 156);
camera_set_view_size(cam, 96, 72);
alarm[3] = 50;
sprite_index = spr_md_ow;
instance_create_xy(x + (sprite_width / 2), y + (sprite_height / 2), obj_md_bridge_glow);
