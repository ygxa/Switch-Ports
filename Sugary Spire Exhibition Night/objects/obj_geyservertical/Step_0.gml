if (geyserPredeploy)
{
	while (!place_meeting(x, y, obj_geyserstop))
		image_yscale += geyserHeightInterval
	
	geyserSolid = true
}
else if (!place_meeting(x, y, obj_geyserstop) && geysertimer > 0)
{
	image_yscale += geyserHeightInterval
	alarm[0] = 150
	alarm[1] = 5
}

if (!global.freezeframe)
{
	with (instance_place(x, y, obj_parent_player))
	{
		if ((other.geysertimer > 0 || other.geyserPredeploy) && (!other.geyserSolid || y > other.bbox_top) && state != PlayerState.actor)
		{
			if (state == PlayerState.machslide || (state == PlayerState.wallkick && (key_down || sprite_index == spr_wallJumpFastFall || sprite_index == spr_wallJumpFastFallIntro)) || state == PlayerState.freefall || state == PlayerState.machroll || state == PlayerState.normal || state == PlayerState.jump || state == PlayerState.climbwall)
			{
				sprite_index = spr_player_PZ_geyser
				state = PlayerState.jump
				grounded = 0
				movespeed = approach(movespeed, 0, 0.25)
				
				if (state == PlayerState.machslide)
					xscale *= -1
				
				if (state == PlayerState.climbwall)
				{
					state = PlayerState.wallkick
					fmod_studio_event_instance_start(sndWallkickStart)
				}
			}
			
			if (vsp > -8)
				vsp = -9
			else
				vsp = approach(vsp, -18, 0.8)
			
			wetTimer = approach(wetTimer, wetTimerMax, 15)
		}
	}
	
	with (obj_parent_enemy)
	{
		if (place_meeting(x, y, other) && (other.geysertimer > 0 || other.geyserPredeploy) && (!other.geyserSolid || y > other.bbox_top))
		{
			if (state != PlayerState.climbwall && state != PlayerState.machtumble && state != PlayerState.stun && state != PlayerState.freezeframe && state != PlayerState.wallkick)
			{
				sprite_index = baddieSpriteStun
				state = PlayerState.charge
				baddieStunTimer = 100
				hsp = approach(hsp, 0, 0.3)
				
				if (vsp > -8)
					vsp = -9
				else
					vsp = approach(vsp, -18, 0.8)
			}
			
			wetTimer = approach(wetTimer, wetTimerMax, 15)
		}
	}
}

if (event_instance_isplaying(sound))
	fmod_quick3D(sound, (x - sprite_xoffset) + (sprite_width / 2), bbox_top)

if (event_instance_isplaying(ambianceSND))
{
	var _xx = clamp(obj_parent_player.x, bbox_left, bbox_right)
	var _yy = clamp(obj_parent_player.y, bbox_top - 30, bbox_bottom)
	fmod_quick3D(ambianceSND, _xx, _yy)
}

if (geyserSolid)
	canCollide = solidCollideFunc
else
	canCollide = nonsolidCollideFunc
