if (tossCooldown > 0)
	return

if !audio_is_playing(sfx_paperball)
	event_play_oneshot(sfx_paperball)
	
vsp = random_range(-8, -10)
image_xscale = -other.xscale
movespeed = random_range(8, 12)
tossCooldown = 10
