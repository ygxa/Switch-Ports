pausedmusic = global.music;
//var roomname = room_get_name(room);
// Set Default Escape Music

// Gummy Harry Proximity
var _oldGummyBear = GummyBear;
if instance_exists(obj_gummyharry)
{
	var p = 0
	with (obj_gummyharry)
	{
		if bbox_in_camera(view_camera[0])
			p = 1
	}
	if (p != GummyBear)
		GummyBear = p
}
else
	GummyBear = 0



if (_oldGummyBear != GummyBear)
{
	if GummyBear
	{
		audio_sound_gain(global.harrymusic, global.musicVolume, 2000)
		audio_sound_gain(global.music, 0, 2000)
	}
	else
	{
		audio_sound_gain(global.harrymusic, 0, 2000)
		audio_sound_gain(global.music, global.musicVolume, 2000)
	}
}
if audio_sound_get_gain(prevmuID) <= 0 audio_stop_sound(prevmuID)	


if room != timesuproom && room != rank_room && !instance_exists(obj_endlevelfade)
{

	var _new_song = -4
	if !is_undefined(room_details.my_func) {
		_new_song = room_details.my_func();
	}

	var unforce_cont = false
	if global.panic {
		_new_song = obj_player.character == "N" ? mu_pizzanoescape : mu_escape
		if global.lapcount >= 1 _new_song = mu_lap
		if escapemusic != -4 _new_song = escapemusic
		unforce_cont = true
	} 

		
	if (_new_song != -4 && music != _new_song && music != mu_sucrose)
	{

		music = _new_song
		prevmuID = global.music
		var cur_mus_pos = audio_sound_get_track_position(prevmuID) / audio_sound_length(prevmuID)

		global.music = scr_music(music)
		var set_mus_pos = cur_mus_pos * audio_sound_length(global.music)
		if !unforce_cont
			audio_sound_set_track_position(global.music, set_mus_pos)
		if audio_is_playing(prevmuID) {
			audio_sound_gain(prevmuID, 0, 500)	
			audio_sound_gain(global.music, 0, 0)	
			audio_sound_gain(global.music, global.musicVolume, 500)	
		} else audio_sound_gain(global.music, global.musicVolume, 0)	
		//audio_stop_sound(prevmuID)
		
		audio_stop_sound(global.secretmusic)
		audio_stop_sound(global.harrymusic)
		global.secretmusic = -4
		
		
		
	}
}

/*
if (room != hub_w1 && room != outer_room2) && !string_contains(room_get_name(room), "secret")
	contTrack_pos = audio_sound_get_track_position(global.music) / audio_sound_length(global.music);
else if !string_contains(room_get_name(room), "secret")
	contTrack_pos = 0;
//Harry Song



// mus effects
if instance_exists(obj_coneball) && global.panic 
	museffect = musicEffect.fuzzy
else
	museffect = musicEffect.normal


switch museffect
{
	default:
	case musicEffect.normal:
		audio_sound_pitch(global.music, 1 + 0.25 * ((room_speed / 60) - 1))
		minfuzz = approach(minfuzz, 1, .05)
		maxfuzz = approach(maxfuzz, 1, .05)
	break;
	case musicEffect.fuzzy:
		minfuzz = approach(minfuzz, 0.95, .005)
		maxfuzz = approach(maxfuzz, 1.05, .005)
		audio_sound_pitch(global.music, approach(audio_sound_get_pitch(global.music), random_range(minfuzz, maxfuzz) + global.lapcount * .005, .05))
	break;
}