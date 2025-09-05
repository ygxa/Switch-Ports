if (!currentSecretStatus)
	exit;

	fmod_studio_event_instance_stop(global.RoomMusic.secretMusicInst, true)
	
	if (!global.panic)
	{
		audio_resume_sound(global.RoomMusic.musicInst)
		//fmod_studio_event_instance_set_callback(global.RoomMusic.musicInst, 0)
	}
	else
		audio_resume_sound(global.EscapeMusicInst)

if (global.panic)
{
	//fmod_studio_event_instance_set_paused(global.EscapeMusicInst, false)
	//fmod_studio_event_instance_set_callback(global.EscapeMusicInst, FMOD_STUDIO_EVENT_CALLBACK.NESTED_TIMELINE_BEAT)
}

currentSecretStatus = false
global.RoomIsSecret = false
