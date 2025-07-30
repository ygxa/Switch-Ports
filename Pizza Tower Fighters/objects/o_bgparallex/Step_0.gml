var near = layer_get_id("Background");
var stillnear = layer_get_id("Background_1");
var farAway = layer_get_id("Background_2");
layer_x(near, lerp(0, camera_get_view_x(view_camera[0]), 0.7));
layer_x(stillnear, lerp(0, camera_get_view_x(view_camera[0]), 0.75));
layer_x(farAway, lerp(0, camera_get_view_x(view_camera[0]), 0.8));
