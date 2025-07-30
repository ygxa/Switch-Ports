targetx = obj_player.x
targety = obj_player.y
angle_rotate(direction, point_direction(x, y, targetx, targety), 3)
if following
	direction = angle_rotate(direction, point_direction(x, y, targetx, targety), 3)
if !bbox_in_camera_ext(view_camera[0], 300)	
	instance_destroy()
	
direction = angle_rotate(direction, point_direction(x, y, obj_player.x, obj_player.y), 3)
image_angle = direction

count -= 0.5

if count <= 0
	{
	instance_destroy()
	instance_create(x, y, obj_bombexplosioncherry)
	}
	
if place_meeting(x, y, obj_donutShitted) 
	instance_destroy()