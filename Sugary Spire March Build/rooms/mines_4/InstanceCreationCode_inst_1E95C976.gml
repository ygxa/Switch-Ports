flags.do_once_per_save = true;
condition = function() {
	return (ds_list_find_index(global.saveroom, inst_AB1F0EB) != -1) && global.minesProgress == false;	
}
output = function() {
	global.minesProgress = true;
	obj_music.contTrack_pos = 0;
	//audio_stop_all_music();
}