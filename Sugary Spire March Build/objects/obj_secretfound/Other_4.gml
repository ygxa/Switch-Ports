if (ds_list_find_index(global.saveroom, id) == -1) {
	
	with (obj_tv)
	{
		message = "YOU HAVE FOUND A SECRET!";
	    showtext = 1;
		alarm[0] = 150;
	}
	scr_sound(sound_secretgot);
	global.secretfound++;
	//instance_destroy();
    ds_list_add(global.saveroom, id);
} 


