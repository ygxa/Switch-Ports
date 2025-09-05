if (fadein)
{
	fadealpha = approach(fadealpha, 0, 0.1)
	
	if (!doneJingle)
	{
		doneJingle = true
		
		if (info.music != -4)
			fmod_studio_event_instance_start(info.music)
	}
}
else
{
	fadealpha = approach(fadealpha, 1, 0.1)
	
	if (fadealpha)
	{
		fadein = true
		alarm[0] = 180
	}
}
