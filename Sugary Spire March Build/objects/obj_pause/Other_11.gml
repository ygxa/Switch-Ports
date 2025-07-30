/// @description Reset Level
if global.levelname != "none" {
	audio_stop_sound(mu_pause);
	instance_activate_all();
	//audio_stop_all();
	
	
    scr_levelSet();
	room = global.firstlvlRoom;
    global.gamePauseState = 0;
    with obj_player { targetDoor = "A"; }
	with instance_create(x, y, obj_fadeout) { fadealpha = 1; fadein = true; }
} else {
	scr_sound(sound_enemythrow);
}
