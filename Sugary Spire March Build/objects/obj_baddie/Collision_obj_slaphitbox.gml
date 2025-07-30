/*
if object_index != obj_charcherry 
{
	scr_sound(sound_slaphit);
	instance_create((x + (obj_player.xscale * 40)), y, obj_punchdust)
	if obj_player.character == "P"
	{
		if global.cane == 0
		{
			with (obj_player) {	
				if state == states.handstandjump {
					baddiegrabbedID = other.id;
					if !key_up {
						state = states.grab;
						sprite_index = spr_player_haulingstart;
						image_index = 0;
					} else {
						state = states.superslam;
						sprite_index = spr_player_piledriverstart;
						if grounded
							vsp = -12;
						else
							vsp = -6;
						grounded = false;
						image_index = 0;
						image_speed = 0.35;	
					}
				}
				state = baddiestate.grabbed;
				instance_destroy(other.id);
			}
		}
		else {
			state = baddiestate.stun;
			hp -= 1;
			thrown = 1;
			hsp = obj_player.xscale * 15;
			vsp = -6;
			obj_player.hsp = 0;
			obj_player.vsp = 0;
			obj_player.sprite_index = obj_player.spr_canehit;
			obj_player.state = states.finishingblow;
		}
	}
	if obj_player.character == "N"
	{
		state = baddiestate.stun;
		hp -= 1;
		thrown = 1;
		hsp = obj_player.xscale * 15;
		vsp = -6;
		with obj_player {
			grounded = 0
			movespeed = -3.5;
			vsp = -8;
			mach2 = 0;
			state = states.bump;
			image_index = 0;
			machslideAnim = 1;
			machhitAnim = 0;
		}
	}
}