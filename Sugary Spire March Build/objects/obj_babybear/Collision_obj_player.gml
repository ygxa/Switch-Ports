global.collect += 25
global.combofreeze = 30;
if global.combotime > 0
	global.combotime += 3;
create_small_number(x, y, "25")
if audio_is_playing(sound_points)
    audio_stop_sound(sound_points)
scr_sound(sound_points)
instance_destroy()
