if global.panic {
	sprite_index = spr_siren_active;	
} else {
	sprite_index = spr_siren_idle;	
}
/*if global.panic && sprite_index = spr_siren_active && floor(image_index) == (image_number - 1)
{
	if !audio_is_playing(sfx)
	{
		audio_play_sound_on(sirenSound, sfx_siren, true, 100)
		audio_emitter_position(sfx, x + (sprite_width / 2), y + (sprite_height / 2), 0)
	}
}
=======
audio_play_sound_on(sirenSound, sfx_siren, true, 100)
audio_emitter_position(sirenSound, x + (sprite_width / 2), y + (sprite_height / 2), 0)
}*/ //how do i fix this :(

