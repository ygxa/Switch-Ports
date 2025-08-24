if turn = "enemyattack"{
	draw_sprite(spr_attackbox,0,obj_camera.view_width/2+obj_camera.camera_x,obj_camera.view_height/2+obj_camera.camera_y+100)
	
	if instance_exists(obj_soul)
		draw_sprite_ext(obj_soul.sprite_index,obj_soul.image_index,obj_soul.x,obj_soul.y,obj_soul.image_xscale,obj_soul.image_yscale,0,0,obj_soul.image_alpha)
	
	if instance_exists(obj_chompmove)
		draw_sprite(obj_chompmove.sprite_index,obj_chompmove.image_index,obj_chompmove.x,obj_chompmove.y)	
}