global.resume_scene_on_room_start = "asg_home.postbattle";
bt_start(27, false);

with (obj_asgore_ow)
    instance_create_xy(x + 16, y + 26, obj_transitionheart_asg);

instance_destroy();
