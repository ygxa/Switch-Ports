if global.battle 
	exit;
	
if instance_exists(obj_player)
{
	view_width = camera_get_view_width(view_camera[0]);
	view_height = camera_get_view_height(view_camera[0]);
	
	camera_x = obj_player.x - (view_width * 0.5);
	camera_y = obj_player.y - (view_height * 0.5);

	camera_x = clamp(camera_x, 0, room_width - view_width)
	camera_y = clamp(camera_y, 0, room_height - view_height)

	camera_set_view_pos(view_camera[0], camera_x, camera_y);
}
