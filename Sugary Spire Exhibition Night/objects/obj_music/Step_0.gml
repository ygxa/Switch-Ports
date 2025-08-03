if audio_is_playing(mu_entryway) && global.playerCharacter = Characters.Pizzano{
	ds_map_find_value(global.RoomMusicMap, room).musicInst = mu_pizzanoentryway
	audio_stop_sound(mu_entryway)
	fmod_studio_event_instance_start(mu_pizzanoentryway, true)
}

if audio_is_playing(mu_pizzanoentryway) && global.playerCharacter = Characters.Pizzelle{
	ds_map_find_value(global.RoomMusicMap, room).musicInst = mu_entryway
	audio_stop_sound(mu_pizzanoentryway)
	fmod_studio_event_instance_start(mu_entryway, true)
}

if (global.gamePauseState)
	exit

if (event_instance_isplaying(global.RankMusicInst) && room != rank_room && !instance_exists(obj_endlevelfade) && !instance_exists(obj_rank))
	fmod_studio_event_instance_stop(global.RankMusicInst, true)

if global.playerCharacter = Characters.Pizzano && global.EscapeMusicInst != mu_pizzanoescape
	global.EscapeMusicInst = mu_pizzanoescape
	
if global.playerCharacter = Characters.Pizzelle && global.EscapeMusicInst != mu_escape
	global.EscapeMusicInst = mu_escape

if (global.panic)
{
	if (!panicStart)
	{
		panicStart = true
		stop_music()
		fmod_studio_event_instance_start(global.EscapeMusicInst, true)
		//show_message("played music")
		//fmod_studio_event_instance_set_paused(global.EscapeMusicInst, false)
		//fmod_studio_event_instance_set_parameter_by_name(global.EscapeMusicInst, "state", 0, true)
		//fmod_studio_system_set_parameter_by_name("pillarfade", 0, true)
		//fmod_studio_event_instance_stop(global.HarryMusicInst, true)
		
		//if (!is_undefined(global.RoomMusic))
		//{
			//fmod_studio_event_instance_stop(global.RoomMusic.musicInst, true)
			//fmod_studio_event_instance_stop(global.RoomMusic.secretMusicInst, true)
		//}
		
		//fmod_studio_event_instance_set_callback(global.EscapeMusicInst, FMOD_STUDIO_EVENT_CALLBACK.NESTED_TIMELINE_BEAT)
	}
	/*
	else if (event_instance_isplaying(global.EscapeMusicInst))
	{
		var event_state = 0
		
		if (global.EscapeTime <= time_in_frames(1, 0))
			event_state = 1
		
		if (global.lapcount >= 1)
			event_state = 2
		
		//fmod_studio_event_instance_set_parameter_by_name(global.EscapeMusicInst, "state", event_state, true)
	}
	*/
}
else
{
	if (panicStart)
	{
		panicStart = false
		fmod_studio_event_instance_stop(global.EscapeMusicInst, true)
	}
	
	fmod_studio_system_set_parameter_by_name("pillarfade", false, false)
	
	if (bbox_in_camera(obj_gummyharry, view_camera[0], 35))
		fmod_studio_system_set_parameter_by_name("pillarfade", true, false)
	
	if (!is_undefined(global.RoomMusic))
	{
		with (global.RoomMusic)
		{
			if (!is_undefined(musicFunc))
				musicFunc(room, musicInst, secretMusicInst)
		}
	}
}
