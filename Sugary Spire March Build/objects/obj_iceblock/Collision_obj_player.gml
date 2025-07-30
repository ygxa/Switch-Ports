if invtime <= 0 && state != icestate.grabbed {
	with (other) {
		if state = states.mach3	{
			instance_create(other.baddieID.x, other.baddieID.y, obj_slapstar);
                instance_create(other.baddieID.x, other.baddieID.y, obj_baddiegibs);
				instance_create(other.baddieID.x, other.baddieID.y, obj_bangeffect);
				with instance_create(other.baddieID.x, other.baddieID.y, obj_bangeffect)
				sprite_index = spr_enemypuncheffect;
			machpunchAnim = true;
			other.state = icestate.thrown
			other.vsp = -11
			other.movespeed = movespeed + 2
			other.xscale = xscale
			other.flash = true;
			other.invtime = 10
			scr_sound(sound_punch)
                scr_sound(choose(sound_punch2, sound_punch3));
			
		}
		
		
		
	}
	
	
	
}