fmod_studio_system_set_parameter_by_name("focus", global.unfocusedMute ? window_has_focus() : 1, true)
fmod_studio_system_set_parameter_by_name("musicAttenuation", global.musicAttenuation ? global.MediaIsPlaying : 0, false)
