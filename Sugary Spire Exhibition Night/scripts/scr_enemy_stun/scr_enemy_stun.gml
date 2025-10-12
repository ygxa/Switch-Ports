function scr_enemy_stun()
{
	baddieStunTimer--
	sprite_index = baddieSpriteStun
	image_speed = 0.35
	
	if (grounded)
	{
		hsp = approach(hsp, 0, 0.3)
		scr_conveyorBeltKinematics()
	}
	
	if (grounded && baddieStunTimer < 0)
	{
		image_index = 0
		
		if (object_index == obj_fizzCloud || object_index == obj_frothCloud)
		{
			movespeed = 5
			state = EnemyStates.float
			sprite_index = baddieSpriteWalk
			vsp -= 8
		}
		else if (object_index == obj_charCherry)
		{
			state = EnemyStates.charcherry
			sprite_index = spr_charcherry_run
			movespeed = 8
			vsp = 0
		}
		else if (object_index == obj_candyCorn)
		{
			sprite_index = spr_candyCornRun
			state = PlayerState.titlescreen
		}
		else if (object_index != obj_bananaCharger && object_index != obj_swedishfish)
		{
			movespeed = 1
			state = PlayerState.frozen
			sprite_index = baddieSpriteWalk
		}
		else
		{
			sprite_index = baddieSpriteIdle
			state = PlayerState.frozen
		}
	}
}
