scr_input()

if key_down
	change_room(rm_server,"S")
	
if key_up{
	change_room(castle_town,"S")
	instance_create_depth(0,0,0,obj_client)	
}
	
if key_run
	change_room(castle_town,"S")