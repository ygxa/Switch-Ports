function scr_playersounds_init() {
	machSound = noone;
	grindsnd = -4;
	suplexsnd = -4;
	flipsnd = -4;
}

function scr_playersounds() {
	//To Do: Clean Up
	
	//Tumble 
	if (sprite_index == spr_tumblestart && floor(image_index) >= 11 && !audio_is_playing(sound_tumblestart) && (!audio_is_playing(sound_tumble))) {			
		scr_sound(sound_tumble);			
	}
	if ((sprite_index == spr_tumble || sprite_index == spr_machroll) && !audio_is_playing(sound_tumblestart) && (!audio_is_playing(sound_tumble))) {
		scr_sound(sound_tumble);
	}
	if (state != states.tumble && sprite_index != spr_machroll)	{
		audio_stop_sound(sound_tumble);
	    audio_stop_sound(sound_tumblestart);
	}	
	
	//Minecart & Grinding
	if (state == states.minecart && grounded) || (state == states.grind) {
		if !audio_is_playing(grindsnd) grindsnd = scr_soundloop(sfx_railgrind)	
	} else if audio_is_playing(grindsnd) audio_stop_sound(grindsnd)
	
	
	if (audio_is_playing(suplexsnd) && state != states.handstandjump) audio_stop_sound(suplexsnd)
	
	
	if (sprite_index == spr_mach2jump) {
		if !audio_is_playing(flipsnd) flipsnd = scr_soundloop(sfx_flip)	
	} else if audio_is_playing(flipsnd) audio_stop_sound(flipsnd)
		
	// Mach.
	if (state == states.mach2 || state == states.mach3 || state == states.climbwall || state == states.climbceiling || state == states.climbdownwall) {
		var machsnd = noone;
		if (state == states.mach2 && sprite_index == spr_mach1 && grounded)
			machsnd = sound_dash1;
		else if ((state == states.mach2 && sprite_index == spr_mach2) || (state == states.climbwall || state == states.climbceiling || state == states.climbdownwall))
			machsnd = sound_dash2;
		else if (state == states.mach3 && sprite_index != spr_crazyrun)
			machsnd = sound_dash3;
		else if (sprite_index == spr_crazyrun)
			machsnd = sound_dash4;
		if !audio_is_playing(machsnd) {
			audio_stop_sound(machSound);
			machSound = scr_soundloop(machsnd);
		}
	} else if audio_is_playing(machSound) {
		audio_stop_sound(machSound);
	}
	
	//if ((sprite_index == spr_mach1) && ((!audio_is_playing(sound_dash1)) && grounded))
	//    scr_sound(sound_dash1);
	//else if ((sprite_index != spr_mach1) || ((!grounded) || (move == (-xscale))))
	//    audio_stop_sound(sound_dash1);
	//if ((sprite_index == spr_mach2) && (!audio_is_playing(sound_dash2)))
	//    scr_sound(sound_dash2);
	//else if (sprite_index != spr_mach2)
	//    audio_stop_sound(sound_dash2);
		
	//if ((state == states.mach3 && sprite_index != spr_crazyrun) || sprite_index == spr_machslideboost3) {
	//	if (!audio_is_playing(sound_maxspeed)) {
	//		scr_sound(sound_maxspeed);
	//	}
	//} else {
	//    audio_stop_sound(sound_maxspeed);
	//}
	
	//if (sprite_index == spr_crazyrun) {
	//	if (!audio_is_playing(sound_dash3)) {
	//		scr_sound(sound_dash3);
	//	}
	//} else {
	//    audio_stop_sound(sound_dash3);
	//}	

}
