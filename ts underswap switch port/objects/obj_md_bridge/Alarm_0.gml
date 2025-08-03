sfx_play(snd_dummysurprise);
instance_destroy(obj_camera);
obj_gamemanager.customViewMode = true;
var cam = view_get_camera(0);
origXView = camera_get_view_x(cam);
origYView = camera_get_view_y(cam);
camera_set_view_pos(cam, 637, 48);
camera_set_view_size(cam, 256, 192);
alarm[1] = 16;
