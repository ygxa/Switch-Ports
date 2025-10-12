showDoorLight = false
sprite_index = spriteDoorUnlocked

if (ds_list_find_index(global.SaveRoom, other.id) == -1 || place_meeting(x, y, obj_doorblocked))
{
	sprite_index = spriteDoorLocked
}
else
{
	sprite_index = spriteDoorUnlocked
	image_index = image_number - 1
	image_speed = 0
}

if (sprite_index == spriteDoorUnlocked && sprite_animation_end())
	image_speed = 0

with (obj_parent_player)
{
	if (place_meeting(x, y, other.id) && !instance_exists(obj_fadeoutTransition) && key_up && grounded && (state == PlayerState.normal || state == PlayerState.Sjumpprep || state == PlayerState.mach2 || state == PlayerState.mach3) && state != PlayerState.door && state != PlayerState.victory && state != PlayerState.comingoutdoor)
	{
		if (!global.janitorRudefollow && ds_list_find_index(global.SaveRoom, other.id) == -1)
			exit
		
		image_index = 0
		state = PlayerState.door
		targetDoor = other.targetDoor
		targetRoom = other.targetRoom
		obj_camera.chargeCameraX = 0
		
		if (ds_list_find_index(global.SaveRoom, other.id) == -1)
		{
			global.janitorRudefollow = false
			instance_create(x, y, obj_lock, 
			{
				sprite_index: other.spriteDoorLock
			})
			state = PlayerState.victory
			event_play_oneshot("event:/SFX/general/cheers", x, y)
			event_play_oneshot("event:/SFX/general/keyunlock", x, y)
			fmod_studio_event_instance_start(obj_parent_player.voiceCollect)
			
			with (other)
			{
				ds_list_add(global.SaveRoom, id)
				sprite_index = spriteDoorUnlocked
				image_index = 0
				image_speed = 0.35
			}
			
			with (obj_rudejanitor)
			{
				if (sprite_index != spr_rudejanitor_unlock)
				{
					ds_list_delete(global.FollowerList, ds_list_find_index(global.FollowerList, id))
					x = obj_parent_player.x - (16 * obj_parent_player.image_xscale)
					y = obj_parent_player.y
					image_index = 0
					state = PlayerState.run
				}
			}
		}
	}
}
