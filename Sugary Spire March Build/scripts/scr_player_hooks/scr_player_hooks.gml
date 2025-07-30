function state_player_hooks() {
	vsp = 0;
	hsp = 0;
	prevVsp = 0;
	prevHsp = 0;
	hspCarry = 0;
	vspCarry = 0;	
	image_speed = 0.35;
	global.combofreeze = 30;
	/*	
	with obj_tv {
		scr_queue_tvanim(hooktvspr, 5);
	}
	
	switch (substate) {
	    case HookType.normal:
	    case HookType.left:
	    case HookType.right:
			hsp = (xscale * movespeed);
			vsp = 0;
			movespeed = approach(movespeed, 14, 0.05);			
			sprite_index = spr_player_hookhoriz;
	        break;		
	    case HookType.up:
			hsp = 0;
			vsp = verticalMovespeed;
			if verticalMovespeed > 0 {
				verticalMovespeed = 0;
			}
			verticalMovespeed = approach(verticalMovespeed, -14, 0.5);
			movespeed = 0;
			sprite_index = spr_player_hookvert;
	        break;
	    case HookType.down:
			hsp = 0;
			vsp = verticalMovespeed;
			if verticalMovespeed < 0 {
				verticalMovespeed = 0;
			}			
			verticalMovespeed = approach(verticalMovespeed, 14, 0.5);
			movespeed = 0;
			sprite_index = spr_player_hookvert;
	        break;
	}
	
	if place_meeting(x, y, obj_hookstop) {
	switch (substate) {
		default:
			state = states.mach2;
			sprite_index = spr_mach2jump;
			movespeed = clamp(movespeed, 6, 11);
	        break;		
	    case HookType.up:
			state = states.Sjump;
			sprite_index = spr_player_outofcontrolfall;
			movespeed = -vsp;
	        break;
	    case HookType.down:
			sprite_index = spr_bodyslamfall;
			verticalMovespeed = 15;
			vsp = verticalMovespeed;
			state = states.freefall;
			freefallsmash = 0;			
	        break;
	}		
	}
	*/
}