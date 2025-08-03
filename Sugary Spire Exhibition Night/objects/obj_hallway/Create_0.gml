image_speed = 0.35
showDoorLight = 0
targetDoor = "A"
playerPosX = undefined
playerPosY = undefined

if global.randomroom{
	instance_destroy()
	with instance_create(x,y,obj_solid){
		sprite_index = spr_wallhallway
		image_xscale = other.image_xscale
		image_yscale = other.image_yscale
	}
	
	var door = instance_create_layer(x - 70 * image_xscale, y, layer, obj_door);

	door.y = y + (bbox_bottom - y) - (door.bbox_bottom - door.y);
	door.targetDoor = targetDoor;
	door.targetRoom = targetRoom;
}