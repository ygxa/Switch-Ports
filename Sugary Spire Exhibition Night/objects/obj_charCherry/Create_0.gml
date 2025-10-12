event_inherited()
state = PlayerState.burrow
canGetScared = false
baddieSpriteIdle = spr_charcherry_popout
baddieSpriteWalk = spr_charcherry_run
baddieSpriteStun = spr_charcherry_stun
baddieSpriteScared = spr_charcherry_stun
baddieSpriteTurn = undefined
baddieSpriteHit = spr_charcherry_hit
baddieSpriteDead = spr_charcherry_dead

enemyDeath_SpawnBody = function()
{
	if (state == PlayerState.charcherryrun)
	{
		instance_create(x, y, obj_bombExplosionMini)
	}
	else
	{
		instance_create(x, y, obj_bombExplosionMini, 
		{
			hurtPlayers: false
		})
	}
}

enemyAttack_TriggerEvent = function()
{
	if (scr_enemy_playerisnear(400, 60) && grounded && state == PlayerState.burrow)
	{
		var _player = get_nearestPlayer()
		image_xscale = -getFacingDirection(_player.x, x)
		sprite_index = spr_charcherry_popout
		image_index = 0
	}
}

slide = 0

enemyCustomStates = function()
{
	switch (state)
	{
		case PlayerState.burrow:
			scr_conveyorBeltKinematics()
			var player_object = get_nearestPlayer(x, y)
			image_speed = 0.35
			hsp = 0
			
			if (sprite_index == spr_charcherry_popout)
			{
				if (sprite_animation_end())
					state = PlayerState.charcherryrun
				
				exit
			}
			
			if (grounded || place_meeting_collision(x, y + vsp))
				sprite_index = spr_charcherry_wait
			else
				sprite_index = spr_charcherry_waitair
			
			enemyAttack_TriggerEvent()
			break
		
		case PlayerState.charcherryrun:
			image_speed = 0.35
			sprite_index = spr_charcherry_run
			scr_conveyorBeltKinematics()
			var targetplayer = get_nearestPlayer(x, y)
			var playerposition = x - targetplayer.x
			
			if (x != targetplayer.x && image_xscale != -sign(playerposition))
			{
				movespeed = 10
				image_xscale = -sign(playerposition)
				slide = -image_xscale * (movespeed + 4)
			}
			
			movespeed = approach(movespeed, 12, 0.5)
			slide = approach(slide, 0, 0.2)
			hsp = (image_xscale * movespeed) + slide
			
			if (grounded && scr_solid(x + image_xscale, y))
				vsp -= 8
			
			if (place_meeting(x, y, targetplayer))
				instance_destroy()
			
			break
	}
}
