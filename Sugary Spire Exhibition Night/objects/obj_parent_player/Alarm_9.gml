if room = rank_room 
	exit;

if instance_exists(obj_door){
    var shit = irandom(instance_number(obj_door) - 1);
    var fucker = instance_find(obj_door, shit);

    x = fucker.x + 50;
    y = fucker.y + 50;
    alarm[9] = -1;
	
	if ((state == PlayerState.door || state == PlayerState.victory) && room != rank_room)
	{
		state = PlayerState.comingoutdoor
		image_index = 0
		
		if (box)
		{
			hsp = 0
			vsp = 0
			verticalMovespeed = 0
			movespeed = 0
			jumpStop = true
			state = PlayerState.jump
			sprite_index = spr_fall
			grounded = false
		}
	}
}
else{
	show_debug_message("shit fucker")
	obj_fadeoutTransition.fadealpha = 1
}