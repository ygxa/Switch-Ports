if (place_meeting(x, y, obj_player)) {
	with obj_player	{
		if place_meeting(x, y, other) {
			if (state != states.noclip && !global.freezeframe) {
				//if (sprite_index == spr_player_drown_jump && state == states.jump) {
					if (vsp >= 0) {
						if (state == states.cotton || state == states.cottondrill) {
							instance_create(x, y, obj_poofeffect);
						}						
						scr_playerrespawn();
					}
				/*} else if (state != states.drown) {
					if (state == states.cotton || state == states.cottondrill) {
						instance_create(x, y, obj_poofeffect);
					}
					state = states.drown;
					sprite_index = spr_player_drown;	
					image_index = 0;
					jumpstop = false;
				}*/
			}
		}
	}
}