obj_player.hallwayxscale = sign(image_xscale)
obj_player.hallwayyscale = 0
obj_player.hsp = 0
obj_player.vsp = 0

if !instance_exists(obj_fadeout){
	with instance_create(x,y,obj_fadeout){
		show_debug_message(string(other.targetDoor))
		targetDoor = other.targetDoor
		targetRoom = other.targetRoom
	}
}