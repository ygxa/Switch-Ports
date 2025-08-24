event = 1

if (global.rank == "c" || global.rank == "d")
	fmod_studio_event_instance_start(rank_loopBAD, false)
else
	fmod_studio_event_instance_start(rank_loop, false)
