if (sprite_index == candleBurn || global.freezeframe)
	exit

var touched = false

if (place_meeting(x, y, obj_parent_player))
{
	with (obj_parent_player)
	{
		if (state == PlayerState.noclip || state == PlayerState.frozen)
			exit
		
		if (state == PlayerState.doughmount || state == PlayerState.doughmountspin)
		{
			if (sprite_index != spr_player_PZ_dogMount_inflate_jump)
			{
				sprite_index = spr_player_PZ_dogMount_inflate
				image_index = 0
				vsp = -10
				state = PlayerState.doughmountballoon
				touched = true
			}
		}
		else if (state != PlayerState.doughmountballoon)
		{
			sprite_index = spr_player_PZ_fireAss_intro
			vsp = -20
			state = PlayerState.fireass
			image_index = 0
			movespeed = hsp
			
			if (!event_instance_isplaying(sndFireass))
				fmod_studio_event_instance_start(sndFireass)
			
			event_play_oneshot("event:/SFX/player/burn", x, y)
			touched = true
		}
	}
}

if (sprite_index != candleBurn && touched)
{
	sprite_index = candleBurn
	image_index = 0
}
