if !audio_is_playing(sound_parry) scr_sound(sound_parry);
with (obj_player) {
	state = states.parry;
	sprite_index = spr_player_parry;
	image_index = 0;
	movespeed = -8;
	flash = 1;
}