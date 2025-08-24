obj_player.hallwayxscale = 0
obj_player.hallwayyscale = sign(image_yscale)
obj_player.hsp = 0
obj_player.vsp = 0


if !instance_exists(obj_fadeout){
	with instance_create(x,y,obj_fadeout){
		show_debug_message(string(other.targetDoor))
		targetDoor = other.targetDoor
		targetRoom = other.targetRoom
	}
}