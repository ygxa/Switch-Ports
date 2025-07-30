
if place_meeting(x, y, obj_player)
	global.dancetimer = timer
	//global.maxdancetimer = mytimeigiveyoufortime
	
if global.dancetimer > 0
sprite_index = spr_onoffblock_on

if global.dancetimer <= 0
sprite_index = spr_onoffblock_off