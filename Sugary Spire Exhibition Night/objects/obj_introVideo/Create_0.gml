scr_initinput()
canSkip = false
alarm[1] = 350
showText = false
displayVideo = false

updateVolume = function()
{
	var attenuation_factor = fmod_studio_system_get_parameter_by_name("musicAttenuation").value
	var real_volume = global.musicVolume * global.masterVolume * (1 - attenuation_factor)
}

