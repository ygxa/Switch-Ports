var view_width = camera_get_view_width(view_camera[0]);
var view_height = camera_get_view_height(view_camera[0]);

if instance_exists(obj_player)
{
	var camera_x = obj_player.x - (view_width * 0.5);
	var camera_y = obj_player.y - (view_height * 0.5);

	camera_set_view_pos(view_camera[0], camera_x, camera_y);
}